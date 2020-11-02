function [U2] = LJP(epsilon,sigma,r,L)
rcut=L/2;
    if  r>rcut
     U2=0;
    else
        U2= 4.*epsilon.*((sigma./r).^12 - (sigma./r).^6);
end
