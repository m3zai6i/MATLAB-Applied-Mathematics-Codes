%% Shahzaib Asif
% sasif.mscse19s@rcms.nust.edu.pk

clc
clear
close all

%% Declaring Functions
fun=@(t,y)[-3*y(1)*y(1)];
y0=1;
Y0=[y0];
tspan=[0 5];
[T,Y]=ode45(fun,tspan,Y0);

%% Display of Data
plot(T,Y)  
title('Nonlinear using ode45')
xlabel('x')
ylabel('y(x)')
