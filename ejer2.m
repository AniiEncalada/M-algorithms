#Resolver PVI
#y"-3y'+2y = e^(-3*t) , y(0) = 1 , y'(0) = 4
#Se define las variables simbolicas necesarias
syms s t Y
#Se define como funcion el lado derecho y encontramos la transformada
f = exp(-3*t)
F = laplace(f,t,s)
#Encontramos la transformada de laplace de y' --> Y1=sY(s) -y(0 )
Y1 = s*Y - 1;
#Encontramos la transformada de laplace de y" --> Y2= sY1 - y'(0)
Y2 = s*Y1 - 4
#Se resuelve la transformada del lado izquierdo de la ecuacion - la fo derecho = 0
#y se resuelve para Y
Sol = solve(Y2 -3*Y1 + 2*Y - F, Y)
#Encontramos la solucion con la transformada inversa
sol = ilaplace(Sol,s,t);
sol