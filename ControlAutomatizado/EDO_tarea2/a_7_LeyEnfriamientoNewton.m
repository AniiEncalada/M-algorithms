%Agua a temperatura de 100° C se enfría en 10 minutos a 80° C, en un cuarto 
% cuya temperatura es de 25° C. Encuentre la temperatura del agua después 
% de 20 minutos.

clc, clear all
%Fórmula
ED = 'DT = k * (T - TA)';
f = dsolve(ED, 't');
pretty(f);

syms k C1;
%Valores iniciales
T = 100; %Temperatura inicial
TA = 25; %Temperatura ambiente
t = 0; %tiempo inicial
vf = eval(T==f);
C1 = solve(vf, C1);
%Segundo momento
t = 10;
T = 80; 
vf = eval(T == f);
%Valor de K
k = solve(vf, k)
%Tercer momento
t = 20;
%Temperatura
Temperatura = eval(f)
%graficar
t = linspace(0, 100, 30);
vf = eval(f);
plot(t, vf, 'b')
xlabel('t (min)')
ylabel('T (°C)')
grid on