clear
px=[1,3,6,9]
py=[1,4,4.5,0]
syms t
n=3;%n is degree, 4 points -> 3 degree curve
x(t)=px(1)*(1-t)^3+...%they are the formula of Bezier curve
    px(2)*nchoosek(3,1)*t*(1-t)^2+...
    px(3)*nchoosek(3,2)*t^2*(1-t)+...
    px(4)*t^3;
y(t)=py(1)*(1-t)^3+...
    py(2)*nchoosek(3,1)*t*(1-t)^2+...%nchoosek means nCk, the combination to choose k objects from n objects.
    py(3)*nchoosek(3,2)*t^2*(1-t)+...%nchoosek(3,2) means 3C2 choosing 2 objects from 3 objects
    py(4)*t^3;
plot(px,py,'*--'); hold on; axis equal;
fplot(x, y, [0 1])%parameter is always 0 to 1 in Bezier curve