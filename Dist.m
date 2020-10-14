function[r]=Dist(pos1,pos2,L)
r=zeros(length(pos1),1);
for i =1:length(pos1);
    r(i) = sqrt(sum((pos1(i)-pos2).^2));
    if abs(r(i))>(L/2)
        r(i)=L-r(i);
    else
        r(i)=r(i);
end
end