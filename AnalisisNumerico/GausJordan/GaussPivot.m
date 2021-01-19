function x = GaussPivot(a,b) 
#M=[3 -2 2 -3;4 0 2 -3;2 4 -1 1;-1 1 1 -1];
##b=[-14;-9;9;-4]
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
        ab
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
# se realiza la sustitución hacia atrás
x = zeros(R,1);
x(R) = ab(R,C)/ab(R,R);
for i = R-1:-1:1 
  x(i) = (ab(i,C) - ab(i,i + 1:R)*x(i + 1:R))/ab(i,i);
endfor 


#a=[0 0.9231 0 0 0 0 0 0; -1 -0.3846 0 0 0 0 0 0; 0 0 0 0 1 0 0.8575 0; 1 0 -0.7809 0 0 0 0 0 
#0 -0.3846 -0.7809 0 -1 0.3846 0 0; 0 0.9231 0.6247 0 0 -0.9231 0 0
#0 0 0.6247 -1 0 0 0 0; 0 0 0 1 0 0 -0.5145 -1];
#b=[1690;3625;0;0;0;0;0;0];



