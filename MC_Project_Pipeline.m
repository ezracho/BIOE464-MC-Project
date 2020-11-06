function [pos_hist, P_hist, vir_hist, U_hist, eff] = MC_Project_Pipeline(N, R, L, sigma, epsilon, iterations, rho_temp)
%% Main pipeline
% Create the space and generates initial positions while checking for overlaps.  
% It then generates new positions (moving one particle at a time), then
% checks whether we can update the system to the new configuration.  
% Also determines energy and pressure using the LJ equation.  
% Returns the position history, pressure history, virial value history, and efficiency
%% Create old particles
old_positions = placing_particles(N, R, L);                                 % Creates old positions
[U_old, vir_old, P_old] = testw_alt(N, L, old_positions, sigma, epsilon, rho_temp);
pos_hist = old_positions;                                                   % History of positions
U_hist = U_old;                                                             % History of energy
vir_hist = vir_old;                                                         % History of virials 
P_hist = P_old;                                                             % History of Pressure
eff = 0;                                                                    % Number of successful moves
%% Create a loop for new positions
for i = 1:iterations
    if mod(i, iterations/10) == 0
        disp(["run number is " i]);
    end
    new_positions = pinpoint_change(old_positions, N, L);
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