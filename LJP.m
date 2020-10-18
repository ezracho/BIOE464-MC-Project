function [U2] = LJP(epsilon,sigma,r)
U2= 4.*epsilon.*((sigma./r).^12 - (sigma./r).^6);