clc
clear()

T = 293.15; %kelvin
Kb = 1.38064852 * 10^-23; % m2 kg s-2 K-1 
B=1/(Kb*T);
N= 500; %Number of paricles
L = 5; % Lattice side
S=1000; % simulation number
pos=zeros(N,3); %Initializing matrix of positions
U=zeros(1,1); %Initializing matrix of potential
U1 =1; %Initial U
sigma = 2;
epsilon = 1;
 pos1 = ((rand(3,(N-1))-0.5)*2)'; % Position N particles (x, y, z)
for i= 1:S
    pos2 =((rand(3,1)-0.5)*2)' ;% New position test particle
    r = (Dist(pos1,pos2,L)); % Distance between particle test and others
    U2 = LJP(epsilon,sigma,r); % Energy of particle interaction
    deltaU = sum(U2)-sum(U1);
if deltaU <= 0
    U1=U2;
    pos = [pos,[pos1; pos2]];  % amends position matrix (Coordinates (x,y,z) x particle) 
    U = [U;sum(U2)]; % amends U matrix
elseif deltaU > 0
    Pacc = exp(deltaU*B);
    acc = randi(10);
    if Pacc >= acc
        U1=U2;
        pos = [pos,[pos1; pos2]]; % amends position matrix
        U = [U;sum(U2)]; % amends U matrix
    end
else
    U1 = U1;
    pos = [pos, pos]; % amends position matrix
    U = [U;U]; % amends U matrix
end
end



        
    F=LJF(epsilon,sigma,r); % Force between particle (dU/dr)
   

% figure
% subplot(1,2,1)
% scatter(r,deltaU,'filled','r')
% axis([0 max(r) min(U2) max(U2)])
% grid on
% xlabel('r (reduced)')
% ylabel('U(r) (reduced)')
% title('Leonard-Jones Potential')
% %  hold on
%  subplot(1,2,2)
%  scatter(r,F,'filled','b')
% axis([0 max(r) min(F) max(F)])
% grid on
% xlabel('r (reduced)')
% ylabel('F(r) (reduced)')
% title('Leonard-Jones Force')