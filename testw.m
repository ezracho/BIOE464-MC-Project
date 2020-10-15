clc
clear()
%%%Conditions
T = 297.15;     % kelvin
Kb = 1.38064852 * 10^-23; % m2 kg s-2 K-1 
B=1/(Kb*T);
N= 500;                     %Number of paricles
L = 20;                         % Lattice side
S=100;                        % simulation number
sigma = 2;                 % Diameteer particle
epsilon = 1;               % well depth

%%%%%  Runnning the simulation for N-1 particles static and 1 mobile 
pos = []; %Initializing matrix of positions
U = []; %Initializing matrix of potential
U1 =0; %Initial U
U2 = [];
pos1 = ((rand(3,(N-1))-0.5)*2)'; % Position N-1 particles (x, y, z)




%%%%%%%%  Energy 
 for i = 1:S                                                 % Run for each simulation
    pos2 =((rand(3,1)-0.5)*2)' ;        % New position test particle
    r = (dist(pos1,pos2,L));                   % Distance between particle test and others
    for ii = 1:N-1                                         % Run for each interaction 
        U2(i) = LJP(epsilon,sigma,r/2); % Energy of particle interaction
    end
    deltaU = sum(U2)-sum(U1);           % Change of energy
if deltaU <= 0                                              % Accept conditon
    U1=U2;
    pos = [pos,[pos1; pos2]];  % amends position matrix (Coordinates (x,y,z) x particle) 
    U = [U;sum(U2)]; % amends U matrix
elseif deltaU > 0
    rand >  exp(-deltaU*B);
        U1=U2;
        pos = [pos,[pos1; pos2]]; % amends position matrix
        U = [U;sum(U2)]; % amends U matrix
else
    U1 = U1;
    pos = [pos, pos]; % amends position matrix
    U = [U;U]; % amends U matrix
end


P = [];                     %Pressure
F = [];                       %Force  
vir = [];                   % Virial
V = L^3                    % Volume 
rho = N/V;              % Density

F(i) = LJF(epsilon,sigma,r); % Force between particle (dU/dr)
vir(i) = (sum(F).*r)./3;
P = (rho/B)+vir./V
 end
   