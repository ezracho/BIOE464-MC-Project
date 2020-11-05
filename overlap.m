function [repeat] = overlap(gen, R, L)
% Returns boolean on whether to repeat or not; uses row vectors
% gen = generated array, R = radius of particles;
k = size(gen, 1);                                     % Finds number of points; determines iterations
repeat = false;
if k > 1 
    for g = 1:k - 1
        dist1 = Dist1(gen(g, :),gen(k, :),L);      % Accounting for image particles
        if dist1 < R                              % Overlap occurs if two are closer than adjacent (r/2 + r/2)
            repeat = true;                          % Repeat if overlap occurs 
            disp([dist1, " is oof"])
            break
        end
    end
end