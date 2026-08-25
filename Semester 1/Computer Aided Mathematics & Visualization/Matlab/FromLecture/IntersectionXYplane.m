clear
syms x y
f(x,y)=sin(x)*y*(y) %f(x,y)= z value
xlabel('x')
ylabel('y')
zlabel('z')
fsurf(f);
%axis equal;
hold on;
fimplicit(f,'r','LineWidth',3)%implicit f(x,y)=0, namely z=0, in 2D