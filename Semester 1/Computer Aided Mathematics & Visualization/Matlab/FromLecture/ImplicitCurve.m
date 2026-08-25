clear
syms x y
F(x,y)=x^2+y^2-1
fimplicit(F)
axis equal
%If you want to restrict the domain.
fimplicit(F,[0 2 0 2])
F(0,1)