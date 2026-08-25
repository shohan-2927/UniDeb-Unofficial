clear
hold off
syms x y
f(x,y)=sin(x)+cos(y);
fsurf(f,'y');
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
hold on
fimplicit(f,'r','Linewidth',3)
p=[2,3,f(2,3)];
plot3(p(1),p(2),p(3),'b*','MarkerSize',5)