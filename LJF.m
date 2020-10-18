function [F] = LJF(epsilon,sigma,r)

F = 24*epsilon*(((sigma^6)./(r^7)) - 2*((sigma^12)./(r^13)));


end