function [ poli, interpo ] = gaussJordan(A,b,valor)
##% Franco Salcedo
##% Solucion a un sistema de ecuaciones lineales algoritmo Gauss_Jordan
##%INPUT:
##% A matriz
##% b= terminos independientes
##% valor: valor a interpolar, si no tiene valor, se interpola on valor=1
##%OUT:  
##%Solucion del sistema
if nargin < 3; valor = 1; end

[f,c] = size(A);
a=[A b];
 for k=1:c
       a(k,:)=a(k,:)/a(k,k);
       for j=k+1:f
            a(j,:)=a(j,:)-a(k,:).*a(j,k);
            j=j+1;
        end
      k=k+1;
    end
for k=f:-1:2
      for j=k-1:-1:1
            a(j,:)=a(j,:)-a(k,:).*a(j,k);
           j=j-1;
       end
      k=k-1;
end
  poli= a(1:f, f+1)';
  interpo=polyval(fliplr(poli),valor);

end