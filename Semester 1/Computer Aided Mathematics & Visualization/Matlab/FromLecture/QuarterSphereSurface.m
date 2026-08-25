clear
hold off
syms x y z
F(x,y,z)=x^2+y^2+z^2-1;
fimplicit3(F,[0 1])
axis equal
p=[2,1,2]
F(p(1),p(2),p(3))