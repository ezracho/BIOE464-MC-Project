function [pos_hist, P_hist, vir_hist, U_hist] = MC_Project_Pipeline(N, R, L, T, sigma, epsilon, iterations, rho_temp)
%% Main pipeline; mostly pseudocode for now
% Create the space
% Generate old points 
    % While checking for overlaps
% Generate new points
    % While checking for overlaps
% Determine whether to keep old positions or move to new positions
    % Also check for overlaps-while getting individual positions?
% Determine energy with Leonard-Jones Function
    % While considering periodic boundary conditions (Rebecca)
% σ = 3.4 × 10-10 m and ε = 1.65 × 10-21 

%% Create old particles
old_positions = placing_particles(N, R, L);                         % Creates old positions
[U_old, vir_old, P_old] = testw_alt(N, L, T, old_positions, sigma, epsilon, rho_temp);          % Insert old energy calculation
pos_hist = old_positions;                                         % History of positions
U_hist = U_old;                                                   % History of energy
vir_hist = vir_old;                                                 % History of virials 
P_hist = P_old;                                                    %History of Pressure
% Do something about "vir" (old and new)
    alt_pos_hist = [];                                              % For debugging
                    %%% < Insert line to append to another file > %%%
%% Create a loop for new positions
for i = 1:iterations
    new_positions = pinpoint_change(old_positions, N, R, L);        % Temporarily replaced
    % new_positions = placing_particles(N, R, L); % Temporarily replaced
    [U_new, vir_new, P_new] = testw_alt(N, L, T, new_positions, sigma, epsilon, rho_temp); % insert new energy calculation
    update = updateCheck(U_old, U_new, T); 
    if update == true
        old_positions = new_positions;
        U_old = U_new;
        vir_old = vir_new; 
        P_old = P_new; 
    end
    alt_pos_hist = [alt_pos_hist; old_positions(1, :)];             %%% Allows to check if it changes
    pos_hist = [pos_hist; old_positions];                           % But like it's 100 positions each time, so...
    U_hist = [U_hist; U_old];
    vir_hist = [vir_hist; vir_old];
    P_hist = [P_hist; P_old]; 
    %%% < Insert line to append to another file >
    i = i + 1;
end
plot3(old_positions(:, 1), old_positions(:, 2), old_positions(:, 3), 'k.');                    % Will plot the final snaphsot of the system





