function [new_pos] = gaussian_change(pos, L, sig, num)
% Take a random point (or many points) and change their position based on
% the Gaussian Distribution.  Obeys boundary conditions
% num = number of moved particles
if num == length(pos)                                       % If moving all particles
    for a = 1:length(pos)
        for j = 1:3                                         % For each dimension
            randnum = normrnd(0, sig);                      % Generates value
            pos(a, j) = pos(a,j) + randnum;
            % If point moves to image, find the position in the primitive cell
            while pos(a, j) > L
                pos(a,j) = pos(a,j) - L;
            end
            while pos(a, j) < L
                pos(a,j) = pos(a,j) + L;            
            end
        end
    end
elseif num == 1
    s_pos = randi(length(pos));                             % Select random point
    for j = 1:3                                             % For each dimension
            randnum = normrnd(0, sig);                      % Generates value
            pos(s_pos, j) = pos(s_pos,j) + randnum;
            % If point moves to image, find the position in the primitive cell
            while pos(s_pos, j) > L
                pos(s_pos,j) = pos(s_pos,j) - L;
            end
            while pos(s_pos, j) < L
                pos(s_pos,j) = pos(s_pos,j) + L;            
            end
    end
end
new_pos = pos;                                              % Output is altered input