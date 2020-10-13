function [F] = LJF(epsilon,sigma,r)
F = (24*epsilon).*(((sigma./r).^7)-((sigma./r).^13));

end