function [repeat] = overlap(gen, R)
% Returns boolean on whether to repeat or not; uses row vectors
% gen = generated array, R = radius of particles; testing uses R = 0.0001                                 
k = size(gen, 1);                                     % Finds number of points; determines iterations
repeat = false;
if k > 1 
    for g = 1:k - 1
        pos = gen(g, :) - gen(k, :);          % assuming generated as column vectors; assuming final added point is at the end of matrix
        dist = sqrt(pos(1)^2 + pos(2)^2 + pos(3)^2); 
        if dist < 2*R                              % Overlap occurs if two are closer than adjacent (r/2 + r/2)
            repeat = true;                          % Repeat if overlap occurs 
            break
        end
    end
end