function r=Aproxsimple(x,y,n,u)
  #P Matriz de puntos
  #P=[1 56.5; 5 113; 20 181;40 214.5]; x=2
##  x=[1 5 20 40]
##  y=[56.5 113 181 214.5]
  #P=[1960 179;1970 203; 1980 226;1990 249;2000 281;2010 308]
#clear  all; 
clc;
fprintf('Interpolacion con el Metodo de Aproximacion Polinomial Simple\n\n'); 
#n=length(x);
xi=y;
xint=u
%determinando los parametros a0,1,2...
i=1; 
while i<=n 
    a(i,1)=1; 
    j=2;
    while j<=n 
        a(i,j)=a(i,j-1)*x(1,i); 
        j=j+1; 
    end 
    a(i,n+1)=xi(1,i); 
    i=i+1; 
end 
a
%Resolviendo mediante el metodo de Gauss-jordan
c=n+1; 
f=n; 
for k=1:c-1 
    a(k,:)=a(k,:)/a(k,k); 
    for j=k+1:f 
        a(j,:)=a(j,:)-a(k,:)*a(j,k); 
        j=j+1; 
    end 
    k=k+1; 
end
a
for k=f:-1:2 
    for j=k-1:-1:1 
        a(j,:)=a(j,:)-a(k,:)*a(j,k); 
        j=j-1; 
    end 
    k=k-1; 
end
r=0; 
a
for m=1:n-1 
    r=r+(a(m+1,n+1))*xint^m; 
end
  r=r+a(1,n+1); 
  fprintf('\n\nresultado xi: %d\n',r);
%Graficando Resultados
plot(x,xi) 
grid 
xlabel('x');ylabel('y')