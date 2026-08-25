clear
px=[1,3,6,9,12]
py=[1,4,4.5,0,3]
syms t
n=4;
x(t)=0*t; y(t)=0*t;%symbol t needed on RHS as well in Matlab
for i=0:n%i will be from 0 to n
    b(t)=nchoosek(n,i)*t^i*(1-t)^(n-i);
    x(t)=x(t)+px(i+1)*b(t);%px*i will be error when i==0
    y(t)=y(t)+py(i+1)*b(t);
end%loop while n=0,1,2,3,4
plot(px,py,'*--'); hold on; axis equal;
fplot(x, y, [0 1])
%Make tangent vector
v1x=n*(px(2)-px(1));%formula to determine tangent vector for x value at the point (px(1),py(1))
v1y=n*(py(2)-py(1));%formula to determine tangent vector for y value at the point (px(1),py(1))
quiver(px(1),py(1),v1x,v1y); 
v2x=n*(px(5)-px(4));
v2y=n*(py(5)-py(4));
quiver(px(5),py(5),v2x,v2y);
%Connect Hermite
rx=[px(5), 26];
ry=[py(5), 5];
ux=[v2x, 4];
uy=[v2y, -3];
plot(rx, ry, 'r*');
quiver(rx(1),ry(1),ux(1),uy(1));
quiver(rx(2),ry(2),ux(2),uy(2));
t0=-1; t1=1;
syms a3 a2 a1 a0 b3 b2 b1 b0
x(t)=a3*t^3+a2*t^2+a1*t+a0;
y(t)=b3*t^3+b2*t^2+b1*t+b0;
xd(t)=diff(x,t);
yd(t)=diff(y,t);
e=[x(t0)==rx(1),...
    x(t1)==rx(2),...
    xd(t0)==ux(1),...
    xd(t1)==ux(2)];
m=solve(e,[a3 a2 a1 a0]);
hx(t)=subs(x, [a3 a2 a1 a0],[m.a3 m.a2 m.a1 m.a0]);
e=[y(t0)==ry(1),...
    y(t1)==ry(2),...
    yd(t0)==uy(1),...
    yd(t1)==uy(2)];
m=solve(e,[b3 b2 b1 b0]);
hy(t)=subs(y, [b3 b2 b1 b0],[m.b3 m.b2 m.b1 m.b0]);
fplot(hx,hy,[t0 t1]);