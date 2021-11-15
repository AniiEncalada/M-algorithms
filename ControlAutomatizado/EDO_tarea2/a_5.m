clc;
clear all;
ED='Df=-4*x*f'
ci='f(0)=3';
f=dsolve(ED,ci,'x');
pretty(f)
x=linspace(0,10,50);
vf=eval(f);
plot(x,vf)
grid on