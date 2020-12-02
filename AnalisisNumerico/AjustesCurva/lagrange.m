function p = lagrange(x, f, v)
#cargar libreria pkg load symbolic
%x,f valores tabulares
%v valor a interpolar
n=length(x);
syms t; %Crea Variable simbolica para definir el polinomio en t para el polinomio
p=0;
for i=1:n
    L=1;
    for j=1:n
        if i ~= j
        L=L*(t-x(j))/(x(i)-x(j));
        end
    end
    p=p+L*f(i) %entrega p(t) en forma simbólica
end
p=expand(p) %simplificación algebraica
if nargin==3 %verifica si existe un parámetro adicional
    t=v;
    p=eval(p); % entrega el resultado de p evaluado en v
end