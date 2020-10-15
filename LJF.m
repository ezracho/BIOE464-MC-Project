function [F] = LJF(epsilon,sigma,r)

F = (48.*epsilon./r).*(((sigma./r).^12)-((sigma./r).^6));

end