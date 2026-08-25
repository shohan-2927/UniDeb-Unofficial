clear
hold off
syms t
x(t)=t*cos(t);
y(t)=t*sin(t);
z(t)=t;
fplot3(x(t),y(t),z(t),[0 12*pi])
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
hold on
t0=6*pi;
plot3(x(t0),y(t0),z(t0),'r*','MarkerSize',5)
xd(t)=diff(x,t);
yd(t)=diff(y,t);
zd(t)=diff(z,t);
v=[xd(t0),yd(t0),zd(t0)];
p=[x(t0),y(t0),z(t0)];
quiver3(p(1),p(2),p(3),v(1),v(2),v(3),'r','LineWidth',2)