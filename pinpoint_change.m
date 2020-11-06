function [new_pos] = pinpoint_change(old_pos, N, L)
% Take a random point and changes its position
% Will omit that row and append a new position at the end-due to the nature
% of how the overlap function is coded
swap_pos = randi(N);                                                    % Used to alter position coordinates
old_pos(swap_pos, :) = [];                                              % Omit that row (now N-1 points)
gen_pos = [(L*rand(1)-(L/2)), (L*rand(1)-(L/2)), (L*rand(1)-(L/2))];    %create new position
new_pos = [old_pos; gen_pos];                                           % Append new position