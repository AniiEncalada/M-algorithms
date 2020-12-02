function y=simple(x,P)
  #P Matriz de puntos
  #P=[1 56.5; 5 113; 20 181;40 214.5]; x=2
  #P=[1960 179;1970 203; 1980 226;1990 249;2000 281;2010 308]
  n=size(P,1);   % Número de filas (puntos) en P
  P=sortrows(P); % Se ordena P por el primer valor de cada fila
  if x<P(1,1)|x>P(n,1)
      y=[];
      disp('Error: el valor de x se encuentra fuera del rango de puntos');
  else
      k=1;
      while ~(x>=P(k,1)&x<=P(k+1,1))
          k=k+1;
      end
      y=interpola1(x,P(k,:),P(k+1,:));     
  end
end
function y=interpola1(x,P1,P2)
    if x<P1(1)|x>P2(1)
        y=NaN;
        disp('Error: el valor de X está fuera del segmento P1-P2');
    else
        b=(P2(2)-P1(2))/(P2(1)-P1(1));
        a=P1(2)-b*P1(1);
        y=a+b*x;
    end
end