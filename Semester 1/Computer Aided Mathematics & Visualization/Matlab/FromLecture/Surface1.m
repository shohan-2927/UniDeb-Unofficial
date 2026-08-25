clear
hold off
syms x y
f(x,y)=sin(x)+cos(y);
fsurf(f,[-10 10 -2 2]);
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
hold on
fimplicit(f,'r','Linewidth',3)