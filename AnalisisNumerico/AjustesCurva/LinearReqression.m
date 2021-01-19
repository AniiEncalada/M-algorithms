function [a1,a0] = LinearReqression(x,y)
% al The coefficient al.
% a0 The coefficient aO.
##x=[1:7];
##y=[0.5 2.5 2.0 4.0 3.5 6.0 5.5]

a0=0;
a1=0;
nx=length(x);
ny=length(y);
if nx ~= ny
  disp('ERROR: El núm de elementos en x, debe ser el mismo en y. ')
  a1='Error';
  a0='Error';
 else
  Sx=sum(x);
  Sy=sum(y);
  Sxy=sum(x.*y);
  Sxx=sum(x.^2);
  a1=(nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);
  a0=(Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);
endif

#Tplot=[-300 100];
xplot=min(x):0.01:max(x);
yplot=a1*xplot+ a0;
clf;
plot(x,y, 'ro' ,'markersize' ,8,'markerfacecolor','r',xplot,yplot, 'b-','linewidth',3)
grid on

#hold on
#plot(Tplot,pplot, 'k')
#xlabel('Temperatura (C) ','fontsize' ,20)
#ylabel('Presion(atm)' ,'fontsize' ,20)
#T0=-0.9336/0.0034
