function [sol] = gauss(M,b)
##M=[4 0 2 -3; 3 -2 2 -3;2 4 -1 1;-1 1 1 -1];
##b=[-9;-14;9;-4]
#uno la matriz con los terminos independientes

#M=[0.0003 3;1 1]
#b= [2.0001; 1]
A=[M b];
#encuentro el tamaño de la matriz f filas c columnas
[f,c] = size(A);

for k=1:c-1
  #divido para los pivotes todas lasfilas
 A(k,:)=A(k,:)/A(k,k)
  for j=k+1:f
  A(j,:)=A(j,:)-A(k,:).*A(j,k)
  endfor
 endfor
 
 #segunda parte
 #sustitución hacia atrás
 #declaro un vector de igual dimension a las filas

 sol= zeros(1,f);
 sol(f)=A(f,c)/A(f,f);
 #sustitucion hacia atrás
 for i=f-1:-1:1
      sum=A(i,c);
      for j=i+1:1:f
         sum = sum -A(i,j)*sol(j);
      end 
      sol(i)=sum/A(i,i);
  end
 
 
 
