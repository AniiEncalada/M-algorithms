function [Matrix] = DifDiv(x,y)
% Franco Salcedo
%Matriz de Diferencias Divididas para encontrar la aprox de Newton
% x, y son los datos de forma tabular
#x=[-2 -1 0 2 3 6]
#y=[-18 -5 -2 -2 7 142]
nodos=x;
N=length(nodos)-1;
fnodos=y;
% rellenamos la matriz con valores no definidos
M=NaN(N+1,N+2);

% Rellenamos la primera columna
M(:,1)=nodos;
% Rellenamos la segunda columna
M(:,2)=fnodos;
for i=2:N+1
    % Las diferencias divididas de orden i comienzan en la fila i y acaban
    % en la fila N+1.
    for j=i:N+1
        M(j,i+1)=(M(j,i) - M(j-1,i)) / (M(j,1)   - M(j-i+1,1)  );
    end
end
Matrix = M;
end

