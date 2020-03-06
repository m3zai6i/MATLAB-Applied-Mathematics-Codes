clc
clear
close all

%% Declaring Functions
fun=@(t,x)[4*x(1)-7*x(1)*x(2);-9*x(2)+7*x(1)*x(2)];
x0=4;
y0=12;
Y0=[x0;y0];
tspan=[0 5];
[T,Y]=ode45(fun,tspan,Y0);

%% Display of Data
plot(T,Y)
title('Predator Prey using ode45')
xlabel('x')
ylabel('y(x)')
