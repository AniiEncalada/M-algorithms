function Yint = LagrangeINT(x,y,Xint)
% x vector con cooordenas en x.
% y vector con coordadas en y.
% Xint valor a interpolar

n = length (x) ; # Tamaño del vector
# calculo de Li.
for i = 1:n 
      L(i) =1;
      for j = 1:n   
        if j ~= i 
        L(i)=L(i)*(Xint-x(j))/(x(i)-x(j));
        end
      end
  end
  
    Yint = sum(y.*L); # valor del polinomio
endfunction
