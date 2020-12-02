###Ley de enfriamiento de Newton.
### manual de octave rv02 pag 41
##k=0.023;
##Ta=30;
##T0=600;
##t=[0:0.1:250];
##fun= @(T,t) k*(Ta- T) ;
##T=lsode(fun, T0, t);
##plot(t,T,'Color','blue','linewidth', 2)
##grid on
##
##
###Curvas isoclinas y campos de direccion y'= 2x
##pkg load symbolic
##DE = diff(y, x) - 2*x == 0;
##sol = dsolve (DE)
%Representación de las isoclinas 
##hold on %para dibujar todas las isoclinas en la misma figura
##y=[-1,1]; %valores de y para dibujar la recta que pasa por los 
##% puntos (x,-1) y (x,1) 
##for m=-2:0.4:2 %valores de las pendientes 
##    x=m/2;%ecuación de las isoclinas 
##    plot([x,x],y)%dibujo de las isoclinas 
##end 
hold on
%representación de las soluciones
a=-1;
b=1;
numsol=20
x=linspace(a,b,numsol);
for y0=linspace(a,b,numsol)%puntos de paso en el eje OY 
    y= y0.*x - x.*cos(x);%ecuación de las soluciones que pasan por (0,y0) 
    plot(x,y,'r')%dibujo de las soluciones 
end 
axis([a b a b])%muestra las soluciones en el cuadrado %[-1,1]x[-1,1]

grid on

%campo de direcciones representado con vectores (1,y') 
f=@(x,y) (y + (x.^2).*sin(x))./x;%definición de la derivada en cualquier punto (x,y) 
#f=@(x,y) x^2*sin(x);
[u,v]=meshgrid(a:0.15:b);%rejilla de puntos para dibujar los
%vectores tangentes a las curvas solución que pasan por dichos
%puntos
 
du=ones(size(u));%primera componente del vector tangente 
dv=f(u,v);%segunda componente del vector tangente 
q=quiver(u,v,du,dv) 
#set(q,'ShowArrowHead','off')%para quitar la flecha del vector 
#hold off 