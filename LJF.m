function [F] = LJF(epsilon,sigma,r)
F = (24*epsilon).*(((sigma./r).^7)-((sigma./r).^13));
figure
scatter(r,F)
axis([min(r) max(r) min(F) max(F)])
grid on
xlabel('r')
ylabel('F(r)')
title('Leonard-Jones Force')
end