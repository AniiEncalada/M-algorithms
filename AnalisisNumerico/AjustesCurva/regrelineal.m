function [A,pol,poli] = regrelineal (x, y, grado,valor)
###Franco Salcedo
###regresion lineal minimos cuadrados
###INPUT:
###x,y datos de x y f(x)
###grado: Grado del polinomio
###valor: valor para la interpolacion

% Instalar
##  pkg install symbolic-2.8.0.tar.gz
##  news symbolic
##  pkg load symbolic

#########
#instalando directo
##symbolic-win-py-bundle-2.8.0.tar.gz
##pkg load symbolic
#################


if nargin < 4; valor = 1; end

n=length(x);
ny=length(y);
if (n ~= ny) || (n<(grado+1))
    error('Datos inconsistentesm Regresión es imposible! ' );
end
##%matriz de ceros
A = zeros( grado+1,grado+1);
for i = 1: grado +1
    for j= 1: i
        k=i+j-2;
        sum=0;
        for l= 1: n
               sum=sum+x(l)^k;
        end
        A(i,j)=sum;
        A(j,i)= sum;
    end
    sum=0;
     for l= 1: n
          sum= sum+(y(l)*x(l)^(i-1));
     end
     A(i,grado+2)=sum;
 end % of for loop
 %se resuelve el polinomio
[ poli, interpo ] = gaussJordan(A(:,1:grado+1),A(:,grado+2),valor);
 % grafica
  %grafica_minimo(poli,100)
  %%%%
% disp('polinomio:');
% disp(poli);
pol=poly2sym(fliplr(poli))
%disp(pol);
fprintf('Interpolacion al %2.2f --> %12.5f\n',valor, interpo);
ym=mean(y);
st=0;
sr=0;
  for i=1:n
     st=st + (y(i) - ym)^2;
     p=0;
      for j=1: grado+1
         p=p -  poli(j)*x(i)^(j-1) ;
          %p=p+ poli(3)*x(i)^2- poli(2)*x(i) - poli(1)
      end
      sr = sr + (y(i) +p )^2;
  end
 
 %Error estandar
 sxy = (sr / (n-(grado+1)))^0.5;
 fprintf('Error Estandar: %12.2f\n',sxy);
 %Coeficiente  de determinacion (incertidumbre)
 r2 = (st - sr)/st;
  fprintf('El polinomio explica el %12.2f de la incertidumbre\n',r2*100);
 %coeficiente de correlacion sqrt(r2)
 %desviacion standar
 sd=(st/(n-1))^0.5
%Polinomio Invertido
 poli=fliplr(poli)
% sym2poly(pol)
%coeffs(pol)

# para ggraficar la curva
xad= [min(x):0.02:max(x)];
 ymc=polyval(poli,xad);
 #plot(x,y,'bo',xad,ymc,'r--');
 plot(x,y,'bo-','markerfacecolor', 'b',xad,ymc,'r--','linewidth', 2);
grid on

