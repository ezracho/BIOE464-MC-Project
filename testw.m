%The  ϵ and  σ values for Xenon (Xe) are 1.77 kJ/mol and 4.10 angstroms
%respectively.
epsilon = 1.77 *10^3    % J/mol
sigma = 4.71*10^-10     % m
oldpos = (rand(499,3)).*10^-8 % Position 499 particles (x, y, z)
newpos1 = (rand(1,3)).*10^-8  % New position test particle
L=5*10^-8 % Half length of simulation box
r=Dist(oldpos,newpos1,L); % Distance between particle test and others
U=LJP(epsilon,sigma,r); % Energy of particle interaction
Uold=U
F=LJF(epsilon,sigma,r) % Force between particle (dU/dr)