function [U2] = LJP(epsilon,sigma,r)

for i=1:length(r)
 
    U2= 4.*epsilon.*((sigma./r).^12 - (sigma./r).^6);

end
