clear
syms x
f(x)=sin(x)
fplot(f)
hold on
plot(-0.5, f(-0.5),'*')
%If you want to restrict the domain.
%fplot(f, [-2*pi, 2*pi],'r','LineWidth',3)