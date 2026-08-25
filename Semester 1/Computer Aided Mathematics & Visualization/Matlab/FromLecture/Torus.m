clear
hold off
syms u v
R=2; r=1;
sx(u,v) = (R+r*cos(v))*cos(u);
sy(u,v) = (R+r*cos(v))*sin(u);
sz(u,v) = r*sin(v);
fsurf(sx,sy,sz, [0 2*pi 0 2*pi],'y')
axis equal
u0 = pi/2;
v0 = pi/4;
p=[sx(u0,v0),sy(u0,v0),sz(u0,v0)];
hold on
plot3(p(1),p(2),p(3),'r*','MarkerSize',8)
cx(u)=sx(u,v0);%isocurve1,v0=fixed v
cy(u)=sy(u,v0);
cz(u)=sz(u,v0);
fplot3(cx,cy,cz,[0 2*pi],'b','LineWidth',3)
dx(v)=sx(u0,v);%isocurve2,u0=fixed u
dy(v)=sy(u0,v);
dz(v)=sz(u0,v);
fplot3(dx,dy,dz,[0 2*pi],'m','LineWidth',3)

cxd=diff(cx,u);%tangent vector with respect to u
cyd=diff(cy,u);
czd=diff(cz,u);
cv=[cxd(u0),cyd(u0),czd(u0)];
quiver3(p(1),p(2),p(3),cv(1),cv(2),cv(3),'LineWidth',3)

dxd(v)=diff(dx,v);
dyd(v)=diff(dy,v);
dzd(v)=diff(dz,v);
dv=[dxd(v0),dyd(v0),dzd(v0)];
quiver3(p(1),p(2),p(3),dv(1),dv(2),dv(3),'LineWidth',3)

normvec=cross(cv,dv);%cross product
quiver3(p(1),p(2),p(3),normvec(1),normvec(2),normvec(3),'LineWidth',3)