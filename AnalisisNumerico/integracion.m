##fx = @(x) 0.2 + 25 * x - 200 * x .^ 2 + 675 * x .^ 3 - 900 * x .^ 4 + 400 * x .^ 5
##d2=diff(fx,x,2)
##integral(function_handle(d2),0,0.8)/0.8

#-(((0.8)^3)/(12*2^2))*(-60)
##Ejercicio de Examen
fx1= @(x) (1-exp(-2*x))
d2=diff(fx1,x,2)
a=0
b=3
n=4
valor= integral(function_handle(d2),a,b)/(b-a)
errorapro=-(((b-a)^3)/(12*n^2))*(valor)

#error con simpson
d4=diff(fx1,x,4)
a=0
b=3
n=4
valor= integral(function_handle(d4),a,b)/(b-a)
errorapro=-(((b-a)^5)/(180*n^4))*(valor)