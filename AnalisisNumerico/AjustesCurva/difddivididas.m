function [ ret ] = difddivididas(A)
#A=puntos();
#P=[3 2;-1 5;2 -2;4 -3;-2 3];
#P=[-2 -18;-1 -5;0 -2;2 -2;3 7; 6 142]

n=size(A);
for i=1:n-1
 for j=i+1:n
 A(j,i+2)=(A(j,i+1)-A(j-1,i+1))/(A(j,1)-A(j-i,1));
 end
end
A
endfunction