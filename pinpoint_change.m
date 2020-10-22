function [new_pos] = pinpoint_change(old_pos, N, R, L)
% Pls wrk
% Take a random point and changes its position
% Will omit that row and append a new position at the end-due to the nature
% of how the overlap function is currently coded
swap_pos = randi(N);            % Used to alter position coordinates
old_pos(swap_pos, :) = [];             % Omit that row (now N-1 points)
q = true;
while q == true
    gen_pos = [(L*rand(1)-0.5), (L*rand(1)-0.5), (L*rand(1)-0.5)]; %create new position
    new_pos = [old_pos; gen_pos];                                  % Append new position
    q = overlap(new_pos, R);                                       % Determines whether to repeat this loop
end
% Exiting loop means no overlap