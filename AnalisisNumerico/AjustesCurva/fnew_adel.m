function T = fnew_adel(x, fx, xint)
##x=[50 60 70 80 90 100];
##fx=[24.94 30.11 36.05 42.84 50.57 59.30];
#N=6; h=10; xint=64;
N=length(x);
h= x(2)- x(1);
for i=1:N-1
 T(i,1)=fx(i+1)-fx(i);
end
for j=2:N-1
 for i=j:N-1
  T(i,j)=T(i,j-1)-T(i-1,j-1);
 end
end
#T
s=(xint-x(1))/h
fxint=fx(1)+s*T(1, 1);
fprintf('Grado 1 P(%4.2f)=%6.2f\n',xint,fxint)
fxint2=fx(1)+s*T(1,1)+s*(s-1)/2*T(2,2);
fprintf('Grado 2 P(%4.2f)=%6.2f\n',xint,fxint2)
# Grado 3
fxint3=fx(1)+s*T(1,1)+s*(s-1)/2*T(2,2) + s*(s-1)*(s-2)/factorial(3)*T(3,3);
fprintf('Grado 3 P(%4.2f)=%6.2f\n',xint,fxint3)
# Grado 4
fxint4=fx(1)+s*T(1,1)+s*(s-1)/2*T(2,2) + s*(s-1)*(s-2)/factorial(3)*T(3,3)...
       +s*(s-1)*(s-2)*(s-3)/factorial(4)*T(4,4);
fprintf('Grado 4 P(%4.2f)=%6.2f\n',xint,fxint4)
end