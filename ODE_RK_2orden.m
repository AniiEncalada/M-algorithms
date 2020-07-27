function [] = ODE_RK_2orden(a,b,h,y0,EDO,EDOsol)
#programa resolucion ED METODO RUNGE-KUTTA
#Por: Franco H. Salcedo
#clear;
if nargin < 6
  ban=1
else 
  ban=0
end

clc;
figure
x(1)=a; y(1)=y0;
n = (b-a)/h; #numero de puntos a evaluar
disp('      i          x(i)             y(i)  ');
disp('-----------------------------------------');
for i=1:n  
    x(i+1) = a+i*h;
    K1=EDO(x(i),y(i));
    K2=EDO(x(i)+3/4*h, y(i)+3/4*K1*h);
    y(i+1) = y(i)+ h*(1/3*K1 + 2/3*K2);
    disp(sprintf('      %i          %f        %f ',i,x(i+1),y(i+1)));
end

if ban == 0
  xp = a:0.1:b;
  sol =EDOsol(xp);
  plot(x,y,'--r',xp,sol);
else
  plot(x,y,'--r');
end
title('METODO RUNGE KUTA 2do ORDEN');

grid on

end