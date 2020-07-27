clear;clc
lim=5;
y=-lim:lim;	%	pick	values	of	y
t=-lim:.3:lim;	%	pick	values	of	t
[tt,yt]=meshgrid(t,y);	%	create	a	2-d	array	of	samples	of	t	and	y
#dy=6-yt;	%	create	dy/dt
dy= yt;
dt=ones(size(dy));	%	create	corresponding	time	coordinates
figure, quiver(tt,yt,dt,dy,0.5,'b')	%	quiver	displays	the	directional	arrows
xlabel('time'),ylabel('y(t)'),	axis	tight
title('dy/dx=y')
hold	on
plot(0*ones(length(yt)),yt,'-r','linewidth',0.1)
CC=[-lim:lim];%	values	of	C
%	now	plot	the	solution
tt=t;
clear	t
syms	y(t)	C
ys=dsolve(diff(y,t)==y)	%	get	the	symbolic	solution
vars=symvar(ys);%	find	the	symbolic	variables
ys=subs(ys,vars(1),C)	%	replace	the	unknown	constant	with	C
yss=function_handle(rhs(ys)) #create	in-line	function	for	plotting	the	solution
#yss=MATLABFunction(ys);	%	create	in-line	function	for	plotting	the	solution
for	k=1:length(CC)
		C=CC(k);
    ysS=yss(C,tt);
    plot(tt,ysS)
end;
grid on