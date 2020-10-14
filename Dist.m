%to implement periodic boundary conditions
function[r]=Dist(pos1,pos2,L)
%%set quantity to shift by
rcut = L/2; %max distance before particle is further than an image

%%for loop to shift to nearest image
r_vector = [] %initialize vector form of distance
for j = 1:3 %for each dimension
    if abs(pos1(j)-pos2(j)) > rcut %if particles are further than rcut away in this dimension
        pos2(j) = pos2(j) - rcut; %then shift by rcut
    %else keep position the same
    end
    r_vector = [r_vector, abs(pos1(j)-pos2(j))]; %add this dimension to distance vector
end

r = sqrt(sum(r_vector.^2)); %scalar value of radius