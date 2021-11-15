clc;
clear all;
ED='Df=2*x';
ci='f(0)=1';
f=dsolve(ED,ci,'x');
pretty(f)
x=linspace(0,10,50);
vf=eval(f);
plot(x,vf)
grid on