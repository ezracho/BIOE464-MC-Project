function[r]=Dist(oldpos,newpos1,L)
r=zeros(length(oldpos),1);
for i =1:length(oldpos);
    r(i) = sqrt(sum((oldpos(i)-newpos1).^2));
    if abs(r(i))>(L/2)
        r(i)=L-r(i);
    else
        r(i)=r(i);
end
end