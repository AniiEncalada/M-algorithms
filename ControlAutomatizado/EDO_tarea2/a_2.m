clc;
clear all;
ED='Df=f';
ci='f(1)=1';
f=dsolve(ED,ci,'x');
pretty(f)
x=linspace(0,10,50);
vf=eval(f);
plot(x,vf)
grid on