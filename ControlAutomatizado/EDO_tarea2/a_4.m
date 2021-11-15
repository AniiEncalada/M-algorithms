clc;
clear all;
ED='Df=x/f'
ci='f(0)=2'
f=dsolve(ED,ci,'x');
pretty(f)
x=linspace(0,10,50);
vf=eval(f);
plot(x,vf)
grid on