function [update] = updateCheck(U_old, U_new, T)
% Accept or reject move; boolean of update
% Checks the energies of the old/current value with the new value
% Takes energy calculations
update = false;                             % Defaults false
Kb = 1.38064852 * (10^-23); % m2 kg s-2 K-1 
beta = T*Kb;
e_old = exp(-beta*U_old);
e_new = exp(-beta*U_new);
if e_new > e_old
    update = true; 
    disp('here');
else
    disp('rand');
    randCheck = rand(1);
    q = e_new/e_old;            % Apparently can be NaN?
    w = [q, "vs", randCheck]; disp(w);
    if e_new/e_old > randCheck
        update = true; 
%     elseif e_new/e_old == NaN
%         update = true;
    end
end
end
