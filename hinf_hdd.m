% H_infinity design for the Disk Drive System
%
nmeas = 1;
ncon = 1;
gamRange = [0 10];
% gmin = 0;
% gmax = 10;
tol = hinfsynOptions('Display','on');
hin_ic = sys_ic.Nom;
[K_hin,clp_hin,gopt] = hinfsyn(hin_ic,nmeas,ncon,gamRange,tol);
gmin = 1.1*gopt;
gamRange = [gmin 10];
[K_hin,clp_hin,gfin] = hinfsyn(hin_ic,nmeas,ncon,gamRange,tol);
disp(' ')
get(K_hin)
disp(' ')
disp('Closed-loop poles')
sp = pole(clp_hin)
omega = logspace(-2,6,100);
sigma(clp_hin,omega)
title('Singular Value Plot of clp')
xlabel('Frequency (rad/sec)')
ylabel('Magnitude')
K = K_hin;