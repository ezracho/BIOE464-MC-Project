

function [U] = LJP(epsilon,sigma,r)
U = 4.*epsilon.*((sigma./r).^12-(sigma./r).^6);
plot(r,U)
axis([0 max(r) min(U) max(U)])
grid on
xlabel('r')
ylabel('U(r)')
title('Leonard-Jones Potential')

end
