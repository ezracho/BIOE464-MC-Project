%The  ϵ and  σ values for Xenon (Xe) are 1.77 kJ/mol and 4.10 angstroms
%respectively.
Uold = 0
epsilon_o = 1.77 *10^3    % J/mol
epsilon = 1 % Reduced units
sigma_o = 4.10*10^-3     % m
sigma = 1  % Reduced unit
oldpos = ((rand(3,500)-0.5)*2)' % Position 499 particles (x, y, z)
newpos1 =((rand(3,1)-0.5)*2)' % New position test particle
L = 2/sigma_o % Length of simulation box
r = (Dist(oldpos,newpos1,L))/sigma_o; % Distance between particle test and others
U = LJP(epsilon,sigma,r); % Energy of particle interaction
deltaUold = U-Uold 
F=LJF(epsilon,sigma,r) % Force between particle (dU/dr)

figure
subplot(1,2,1)
scatter(r,deltaUold,'filled','r')
axis([0 max(r) min(U) max(U)])
grid on
xlabel('r (reduced)')
ylabel('U(r) (reduced)')
title('Leonard-Jones Potential')
%  hold on
 subplot(1,2,2)
 scatter(r,F,'filled','b')
axis([0 max(r) min(F) max(F)])
grid on
xlabel('r (reduced)')
ylabel('F(r) (reduced)')
title('Leonard-Jones Force')