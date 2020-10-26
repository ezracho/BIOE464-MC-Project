function [Utot, vir, P] = testw_alt(N, L, T, pos, sigma, epsilon, rho)
% Returns the energy based on all interactions between particles
% Takes inputs for side number of particles, side length, temperature, and
% position matrix

global B;
V = L^3;

Kb = 1.38064852 * 10^-23; % m2 kg s-2 K-1 
%B = 1/(Kb*T);

Utot = 0;                               % Initialize energy
vir = 0;                                % Initialize Vir
for i = 1: N-1
    pos_calc = pos(i, :);   % Makes the position for calculations the current iteration row
    % Now to find energy relative to this one point.  And force, why not
    for j = i+1 : N                             % Considers all values above "i"
        U_loop = 0; vir_loop = 0;                 % Initialize energy and force for current iteration
        pos_loop = pos(j, :);                   % Take a single point
        diffD = pos_calc-pos_loop;                  
        r = (Dist(pos_calc,pos_loop,L));
        U_loop = LJP(epsilon, sigma, r);        % Cutoff already in LJP
        
        
        Utot = Utot + U_loop;
        
        vir_loop = (r/3)*LJF(epsilon, sigma, r);        % Check subroutine; add cutoff
        vir = vir + vir_loop;
    end
end
P = (rho/B)+vir./V;      % Pressure calculation (rho is defined at the top, but we will need  a loop
% should have total energy for configuration at the end in Etot




