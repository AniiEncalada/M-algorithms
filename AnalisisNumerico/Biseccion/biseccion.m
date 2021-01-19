function[] = biseccion(F,a,b,tol,imax)

clc
 figure;
 gr=ezplot(F,[a,b]);
  grid on;
  hold on;
  set(gr, "linewidth",4); 
  #set(gr, "linewidth",4,"Color",'cyan' ); 
##F =@ (x) 8-4.5*(x-sin(x));
##ezplot(F,[0,4]) 
##a = 2; b = 3; imax = 20; tol = 0.001; 
##F = @(x) ((9.8*68.1)./x ).* (1-exp(-(x/68.1)*10)) -40;
##ezplot(F,[10,20])
##a = 12; b = 16; imax = 20; tol = 0.001;

#F=@(x) x.^3 +4*x.^2-10;
#ezplot(F,[0,4]);
#a = 1; b = 2; imax = 20; tol = 0.0001;

##F=@(x) 8 - 4.5*(x-sin(x))
##ezplot(F,[0,4]);
##a = 2; b = 3; imax = 20; tol = 0.001;
##F=@(x) (9.81/15).*x.*(1- exp((-15./x).*10) ) -36 
##ezplot(F,[50,65]);
##a = 50; b = 65; imax = 20; tol = 0.001;
##F=@(x) x.^3 - 4.*x -9; 
##ezplot(F);
##a = 2; b = 3; imax = 20; tol = 0.00000001;
##grid on
# numero de iteraciones que se requeriran
n=(log2( (b-a)/tol) )
%*****************
Fa = F(a) 
Fb = F(b)
if Fa*Fb > 0
  disp('Error:La función tiene el mismo signo en los puntos a y b. ') 
    else
    disp ( 'iteration   a          b     (xNS)Solution  f(xNS)    Tolerance ') 
    for i = 1:imax
        plot([a,b],[F(a),F(b)],'k--');
        xNS= (a + b)/2;
        toli = (b - a)/2;
        FxNS = F(xNS);
        fprintf('%3i %11.6f %11.6f %11.7f %11.7f %11.7f\n', i, a, b, xNS, FxNS, toli)
        if FxNS == 0 
          fprintf ('Una solución exacta =%11.6f fue encontrada' ,FxNS)
          break
        end
        if toli < tol 
          break
        end
        if i == imax 
          fprintf ('Solución no fue obtenida en %i iteraciones' ,imax)
          break
        end
        if F(a)*FxNS < 0 
          b = xNS;
        else 
          a = xNS;
        end 
    end 
    plot(xNS, FxNS,'ro',"linewidth",2,'markerfacecolor', 'r');
    #title({'METODO BISECCION';func2str(F)} );
    title('METODO BISECCION');
    text(xNS+0.05,0,func2str(F), 'Color','blue','FontSize',10);

   
end
end

