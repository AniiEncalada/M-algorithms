function [area] = simpson13general(fx,n,a,b)
##Autor : Franco Salcedo
##ENTRADA
##fx: Funcion a integrar
##n: Tamano de paso (SIEMPRE PAR)
##a: Limite inferior
##b: Limite superior
##SALIDA
##Area bajo la curva

#Grafica curva original
#fx=@(x) 0.2+25*x -200*x.^2 + 675*x.^3 -900*x.^4 +400*x.^5;
%ezplot(fx,[a,b]);
%grid on 
%hold on

%integral
syms x
#fxint=@(x) 0.2*x+25*x^2/2 -200*x^3/3 + 675*x^4/4 -900*x^5/5 +400*x^6/6;
#fxint = quad(fx,x)
#fxint = function_handle(int(fx,x))

%segunda derivada
#f2prima=@(x) -400*x+(4050*x^2)/2-(10800*x^3)/3+(8000*x^4)/4;
fxint = function_handle(int(fx,x))
f4prima =function_handle(diff(fx,x,4));
int4 = integral(f4prima, a, b);

% numero de intervalos
#n=500;
#n=1;
##a=0.0;
##b=0.8;
h=(b-a)/n;
# calculo de la integral real
vv= (  feval(fxint,b) - feval(fxint,a) )
%primer trapecio
sum=feval(fx,a);
xa=sum;
#fprintf('Valor verdadero %12.12f\n', vv);
a1=a;
ban=0;
for i=1:n-1
      if ban==0 xb=4*fx(a+h); ban=1; 
        else  xb=2*fx(a+h); ban=0;
      endif
     sum=sum+xb;
      %relleno area
      %fill([a, a, a+h,a+h],[0, xa,xb,0],'b')
      xa=xb;
      a=a+h;
end % of for loop
sum=sum+fx(a+h);

xbfin=feval(fx,b);
%sum=sum+xbfin;
 %fill([a, a, a+h,a+h],[0, xa,xbfin,0],'b')
 area=((b-a1)*sum)/(3*n);
 fprintf('Valor aprox: %12.12f\n', area);
 fprintf('Error verdadero: %12.12f\n', vv-area);
 fprintf('Error relativo %%: %2.2f\n', abs((vv-area)/vv)*100);
  #Calculo del error de Truncamiento 
err=(-1)* ((b-a1)^5/(180*n^4))*(int4/(b-a1));
 fprintf('Error Aproximado: %5.7f\n', abs(err))
 
