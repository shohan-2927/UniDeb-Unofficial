clear
px = [1,3,5,9,12]; py = [1,5,4,0,2];
plot(px,py,'*--');axis equal; hold on
syms t 
%P0 = px(1)from
x(t) = 0*t;y(t)=0*t;
n = 4;
for i=0:n
    b(t) = nchoosek(n,i) * t^i * (1-t)^(n-i);
    x(t) = x(t) + px(i+1) * b(t);
    y(t) = y(t) + py(i+1) * b(t);
end
fplot(x,y,[0,1])
v0 = [ n*(px(2)-px(1)), n*(py(2)-py(1)) ];
quiver(px(1),py(1),v0(1),v0(2))
v1 = [ n*(px(5)-px(4)),n*(py(5)-py(4))];
quiver(px(5),py(5),v1(1),v1(2))

%connect new Bezier
m =5;
rx = [ px(5),px(5) + v1(1)/m, 18,19,22,25]
ry = [ py(5),py(5) + v1(2)/m, 5,0,2,4.5]
plot(rx,ry,'*--')

x(t) = 0*t;y(t)=0*t;
for i=0:m
    b(t) = nchoosek(m,i) * t^i * (1-t)^(m-i);
    x(t) = x(t) + rx(i+1) * b(t);
    y(t) = y(t) + ry(i+1) * b(t);
end
fplot(x,y,[0,1])