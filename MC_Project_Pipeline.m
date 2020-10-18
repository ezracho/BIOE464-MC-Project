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

% Start by declaring space.  Change values as needed
N = 500; R = 0.0001; L = 1; T = 100;        % Declare number of particles, radius of particles, and space length (L x L x L)
% Setting T = 100K for now
sigma = 1; epsilon  = 1;                    % Cutoff distance, well depth
iterations = 50;                            % Setting iterations as 10 times for now    

%% Create old particles
old_positions = placing_particles(N, R, L);                         % Creates old positions
[U_old, vir_old] = testw_alt(N, L, T, old_positions, sigma, epsilon);          % Insert old energy calculation
pos_hist = old_positions;                                         % History of positions
U_hist = U_old;                                                   % History of energy
% Do something about "vir" (old and new)
    alt_pos_hist = [];                                              % For debugging
                    %%% < Insert line to append to another file > %%%
%% Create a loop for new positions
for i = 1:iterations
    new_positions = placing_particles(N, R, L); 
    [U_new, vir_new] = testw_alt(N, L, T, new_positions, sigma, epsilon); % insert new energy calculation
    update = updateCheck(U_old, U_new, T); 
    if update == true
        old_positions = new_positions;
        U_old = U_new;
    end
    alt_pos_hist = [alt_pos_hist; old_positions(1, :)]              % Allows to check if it changes
    pos_hist = [pos_hist; old_positions];                           % History by appending positions
        % But like it's 100 positions each time, so...
    U_hist = [U_hist; U_old];
    %%% < Insert line to append to another file >
    i = i + 1;
end
pos_hist
U_hist
plot(U_hist)







