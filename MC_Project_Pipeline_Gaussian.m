function [pos_hist, P_hist, vir_hist, U_hist, eff] = MC_Project_Pipeline_Gaussian(N, R, L, sigma, epsilon, iterations, rho_temp, move_num, sig)
% Like main pipeline, but using Gaussian moves.    
%% Create old particles
old_positions = placing_particles(N, R, L);                                 % Creates old positions
[U_old, vir_old, P_old] = testw_alt(N, L, old_positions, sigma, epsilon, rho_temp);
pos_hist = old_positions;                                                   % History of positions
U_hist = U_old;                                                             % History of energy
vir_hist = vir_old;                                                         % History of virials 
P_hist = P_old;                                                             % History of Pressure
eff = 0;                                                                    % Number of successful moves
%% Create a loop for new positions
for i = 1:iterations                                                        % Gives update every 10% progress
    if mod(i, iterations/10) == 0
        disp(["run number is " i]);
    end
    new_positions = gaussian_change(old_positions, L, sig, move_num);       % Gaussian movement; move_num determines all or one particle at a time
    [U_new, vir_new, P_new] = testw_alt(N, L, new_positions, sigma, epsilon, rho_temp); % insert new energy calculation
    update = updateCheck(U_old, U_new); 
    if update == true
        old_positions = new_positions;
        U_old = U_new;
        vir_old = vir_new; 
        P_old = P_new; 
        eff = eff + 1;
    end
    pos_hist = [pos_hist; old_positions];                           % Append to the history files
    U_hist = [U_hist; U_old];
    vir_hist = [vir_hist; vir_old];
    P_hist = [P_hist; P_old]; 
    i = i + 1;
end