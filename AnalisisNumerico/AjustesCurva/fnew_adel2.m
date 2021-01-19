function [T poli,polyexp,aprox] = fnew_adel2(x, fx, g,valor)
##x=[50 60 70 80 90 100];
##fx=[24.94 30.11 36.05 42.84 50.57 59.30];
#N=6; h=10; xint=64;
syms t
N=length(x);
h= x(2)- x(1);
p=0;
for i=1:g
 T(i,1)=fx(i+1)-fx(i);
end
for j=2:g
 for i=j:g
  T(i,j)=T(i,j-1)-T(i-1,j-1);
 end
end

p=1;
p2=0;
s=(t-x(1))/h;
for k=0:g-1
 p=(p*(s-k));
 p2=p2 +  (p*T(k+1,k+1))/ factorial(k+1);
endfor
poli=fx(1)+p2;
poli = sym2poly(poli);
aprox=polyval(poli,valor);
polyexp=polyout(poli);
end