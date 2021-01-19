function sol = GaussJordan(a,b) 
  
#M=[3 -2 2 -3;4 0 2 -3;2 4 -1 1;-1 1 1 -1];
##b=[-14;-9;9;-4]
#M2=[3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10]
##b2=[7.85 -19.3 71.4]

ab = [a,b];
[R,C] = size(ab); 
for j = 1:R-1
% INICIO SECCION PIVOTEO 
  if ab(j,j) == 0 #encuentra cero
  for k = j + 1:R
      if ab(k,j) ~= 0
        abTemp = ab(j,:);
        ab(j,:) = ab(k,:);
        ab (k,:) = abTemp;
        break  %salgo del for k = j + 1:R
      end
  endfor 
  end 
% FIN SECCION PIVOTEO
% se transforma en triangular superior
  for i = j + 1:R
    ab(i,j:C) = ab(i,j:C) - ab(i,j)/ab(j,j)*ab(j,j:C);
  endfor
endfor
ab
# se realiza la sustitución hacia atrás
##x = zeros(R,1);
##x(R) = ab(R,C)/ab(R,R);
##for i = R-1:-1:1 
##  x(i) = (ab(i,C) - ab(i,i + 1:R)*x(i + 1:R))/ab(i,i);
##endfor 

# Convertida en triangular superior, la hago diagonal
#haciendo operaciones de abajo hacia arriba
for k=R:-1:2
      for j=k-1:-1:1
         ab(j,:)=ab(j,:)-ab(k,:)/ab(k,k)*ab(j,k);
      end
end
ab
sol= zeros(1,R);
#divido todo por el pivote
for k=1:R
   ab(k,:)= ab(k,:)/ab(k,k);
   sol(k)=ab(k,C);
end
ab

##a=[0 0.9231 0 0 0 0 0 0; -1 -0.3846 0 0 0 0 0 0; 0 0 0 0 1 0 0.8575 0; 1 0 -0.7809 0 0 0 0 0 
##0 -0.3846 -0.7809 0 -1 0.3846 0 0; 0 0.9231 0.6247 0 0 -0.9231 0 0
##0 0 0.6247 -1 0 0 0 0; 0 0 0 1 0 0 -0.5145 -1];
###b=[1690;3625;0;0;0;0;0;0];



