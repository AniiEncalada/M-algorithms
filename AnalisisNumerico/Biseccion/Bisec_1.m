function sol=Bisec_1(fun,a,b,tol)
% Método de la Bisección para resolver f(x)=0
if nargin<4, tol=sqrt(eps); end
fa=fun(a); fb=fun(b);
if sign(fa)*sign(fb)>=0, error('El intervalo (a,b) no contiene la solución\n'), end
while abs(b-a)/2 > tol
    c=(a+b)/2;
    fc = fun(c);
  if fc==0, break, end
      if sign(fc)*sign(fa) < 0
        b=c; fb=fc;
      else
        a=c; fa=fc; % No es necesario hacer fa=fc;
      end
      fprintf(' %17.15f %17.15f\n',a,b);
  end
    sol = (a+b)/2;
end