#Resolver PVI
#y'+3y =9*sin(2*t) , y(0) = 5 ,
#Se define las variables simbolicas necesarias
syms s t Y
#Se define como funcion el lado derecho y encontramos la transformada
f = 9*sin(2*t)
F = laplace(f,t,s)
#Encontramos la transformada de laplace de y' --> Y1=sY(s) -y(0 )
Y1 = s*Y - 5;

#Se resuelve la transformada del lado izquierdo de la ecuacion - lafo derecho = 0
#y se resuelve para Y
Sol = solve(Y1 + 3*Y - F, Y)
#Encontramos la transformada inversa
sol = ilaplace(Sol,s,t);
sol