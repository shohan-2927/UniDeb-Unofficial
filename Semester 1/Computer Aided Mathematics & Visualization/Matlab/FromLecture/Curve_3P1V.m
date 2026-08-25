clear
hold off
px=[1, 3, 6];
py=[1, 5, 1.5];
vx=[5];
vy=[0];%we have 3 points and 1 vector as enough info for curve
plot(px,py,'b*');
axis equal; hold on;%we plot 3 points by one before command line, but we want to plot curve in the same figure, that's why we need "hold on"
quiver(px(2),py(2),vx(1),vy(1));%point (3,5) is defined as the starting point of vector (5,0)
syms a3 a2 a1 a0 t
x(t)=a3*t^3+a2*t^2+a1*t+a0;%3rd polynomial for curve (by mathmatical def)
xd(t)=diff(x,t);
t1=0; t2=1; t3=2;
ex = [x(t1)==px(1),...
    x(t2)==px(2),...
    x(t3)==px(3),...
    xd(t2)==vx(1)];
sx=solve(ex, [a3 a2 a1 a0])
cx(t)=subs(x, [a3 a2 a1 a0],...
    [sx.a3, sx.a2, sx.a1, sx.a0])
syms b3 b2 b1 b0
y(t)=b3*t^3+b2*t^2+b1*t+b0;
yd(t)=diff(y,t);
ey = [y(t1)==py(1),...
    y(t2)==py(2),...
    y(t3)==py(3),...
    yd(t2)==vy(1)];
sy=solve(ey, [b3 b2 b1 b0])
cy(t)=subs(y, [b3 b2 b1 b0],...
    [sy.b3, sy.b2, sy.b1, sy.b0])
fplot(cx, cy, [t1 t3])