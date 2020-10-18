function [F] = LJF(epsilon,sigma,r)

F = (24.*epsilon./r).*(((12*sigma./r).^12)-((6*sigma./r).^6));


end