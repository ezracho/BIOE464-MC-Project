

function [U] = LJP(epsilon,sigma,r)
for i=1:length(r)
    if r<=sigma
    U = 0;
    else
    U = 4.*epsilon.*((sigma./r).^12 - (sigma./r).^6);
    end
end


end
