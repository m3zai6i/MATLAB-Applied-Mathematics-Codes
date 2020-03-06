%% Shahzaib Asif
% sasif.mscse19s@rcms.nust.edu.pk

clc
clear
close all

%% Declaring Functions
dydx = @(x,y)[y(2);-(y(1))];
bcfcn = @(ya,yb)[ya(1) yb(1)-2];
initial_guess=[-2 0];
solinit = bvpinit(linspace(0,5,50),initial_guess);
sol = bvp4c(dydx,bcfcn,solinit);

%% Display of Data
plot(sol.x,sol.y(1,:))
title('Second-order BVP using bvp4c')
xlabel('x')
ylabel('y(x)')
