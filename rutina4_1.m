clear;clc
lim=6
y=-lim:lim;	%	pick	values	of	y
t=-lim:.4:lim;	%	pick	values	of	t
[tt,yt]=meshgrid(t,y);	%	create	a	2-d	array	of	samples	of	t	and	y
#dy=6-yt;	%	create	dy/dt
#syms y(t);
dy= (yt+(t.^2).*sin(t))./t;
dt=ones(size(dy));	%	create	corresponding	time	coordinates
figure, quiver(tt,yt,dt,dy,0.1,'b')	%	quiver	displays	the	directional	arrows
xlabel('time'),ylabel('y(t)'),	axis	tight
title('(y + (t.^2).*sin(t))/t')
hold	on
plot(t,0*ones(length(t)),'-r','linewidth',0.5)
plot(0*ones(length(yt)),yt,'-r','linewidth',0.5)
CC=[-2:2];%	values	of	C
%	now	plot	the	solution
tt=t;
clear	t
syms	y(t)	C
ys=dsolve(diff(y,t)==(y + (t.^2).*sin(t))./t);	%	get	the	symbolic	solution
vars=symvar(ys);%	find	the	symbolic	variables
ys=subs(ys,vars(1),C);	%	replace	the	unknown	constant	with	C
yss=function_handle(rhs(ys)) #create	in-line	function	for	plotting	the	solution
#yss=MATLABFunction(ys);	%	create	in-line	function	for	plotting	the	solution
for	k=1:length(CC)
		C=CC(k);
    ysS=yss(C,tt);
    plot(tt,ysS)
end;
grid on