function [area] = trapeciogeneral2(fx,n,a,b)
##Autor : Franco Salcedo
##ENTRADA
##fx: Funcion a integrar
##n: Tamano de paso
##a: Limite inferior
##b: Limite superior
##SALIDA
##Area bajo la curva

#Grafica curva original
#fx=@(x) 0.2+25*x -200*x.^2 + 675*x.^3 -900*x.^4 +400*x.^5;
ezplot(fx,[a,b]);
grid on 
hold on

%integral
syms x
#fxint=@(x) 0.2*x+25*x^2/2 -200*x^3/3 + 675*x^4/4 -900*x^5/5 +400*x^6/6;
#fxint = quad(fx,x)
fxint = function_handle(int(fx,x))
%segunda derivada
#f2prima=@(x) -400*x+(4050*x^2)/2-(10800*x^3)/3+(8000*x^4)/4;
f1prima =function_handle(diff(fx,x,1));
% numero de intervalos
#n=500;
#n=1;
##a=0.0;
##b=0.8;
h=(b-a)/n
vv= (  feval(fxint,b) - feval(fxint,a) ) ;
%primer trapecio
sum=feval(fx,a);
xa=sum;
media=feval(f1prima,h+a) - feval(f1prima,a);
err=(-1/12)*media*(h)^2;
fprintf('Valor verdadero %12.12f\n', vv);
for i=1: n-1
        xb=feval(fx,(a+h));
        sum=sum+(2*xb);
      %relleno area
      fill([a, a, a+h,a+h],[0, xa,xb,0],'b')
      xa=xb;
      a=a+h;
      %calculo del error
       err=err+ (-1/12)* ( feval(f1prima,a+h) - feval(f1prima,a) ) *(h)^2;
  end % of for loop
 xbfin=feval(fx,b);
 sum=sum+xbfin;
 fill([a, a, a+h,a+h],[0, xa,xbfin,0],'b')
 area=h*sum/2;
 fprintf('Valor aprox: %12.12f\n', area);
 fprintf('Error verdadero: %12.12f\n', vv-area);
 fprintf('Error relat porcentual: %2.2f\n', (vv-area)/vv*100);
 fprintf('Error aproximado (Tolerancia): %5.7f\n', abs(err))