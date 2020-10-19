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
% Start by declaring space.  Change values as needed
N = 500; R = 0.001; L = 2; T = 300;        % Declare number of particles, radius of particles, and space length (L x L x L)
% Setting T = 2.0 K for now
sigma = 0.01; epsilon  = 0.1;                    % Cutoff distance, well depth
iterations = 1000;                            % Setting iterations as 10 times for now    

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
    new_positions = placing_particles(N, R, L); 
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
% subplot(1, 2, 1);
plot(U_hist);
maxU = max(U_hist); ylim([-0.2*maxU, maxU]); 
% % subplot(1, 2, 2); plot(alt_pos_hist(:, 1));






