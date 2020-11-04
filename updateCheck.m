function [update] = updateCheck(U_old, U_new)
% Accept or reject move; boolean of update
% Checks the energies of the old/current value with the new value
% Takes energy calculations
update = false;                             % Defaults false
global B; 

e_old = exp(-B*U_old);
e_new = exp(-B*U_new);

if U_new < U_old
    update = true; 
else
    randCheck = rand(1);
    if e_new/e_old > randCheck
        update = true; 
    end
end
end
