function [F] = LJF(epsilon,sigma,r)
F = (24*epsilon).*(((sigma./r).^7)-((sigma./r).^13));
plot(r,F)
axis([0 max(r) min(F) max(F)])
grid on
xlabel('r')
ylabel('F(r)')
title('Leonard-Jones Force')
end