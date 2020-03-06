%% Shahzaib Asif
% sasif.mscse19s@rcms.nust.edu.pk

clc
clear
close all
% Solving y''-4y'+4y=0 ; y(0)=1, y'(0)=2
%% Declaring Variables
f1 = @(u,x,y)u;
f2 = @(u,x,y)4*u-4*y;
%% Initial Values
a = 2;
x0 = 0;
y0 = 1;
u0 = 2;
h = 0.1;
%% Setting Range
x = x0:h:a;
y(1) = y0;
u(1) = u0;
N = (a-x0)/h;
%% Iterations using Euler's Method
for n=1:N
    y(n+1) = y(n) + h.*f1(u(n),x(n),y(n));
    u(n+1) = u(n) + h.*f2(u(n),x(n),y(n));
    
    % Error Calculation
    % e(n+1) = abs((y(n)-y(n+1))/y(n+1));
end
%% Display of Data
%[y',u']
temp = y;
subplot(3,1,1)
plot(x,y)
title('Eulers Method')
xlabel('x')
ylabel('y(x)')
%--------------------------------------------------------------

%% Iterations using RK-4 Method
for n=1:N
    
    m1 = f1(u(n),x(n),y(n));
    k1 = f2(u(n),x(n),y(n));
    m2 = f1((u(n)+0.5*h),(x(n)+0.5*h*m1),(y(n)+0.5*h*k1));
    k2 = f2((u(n)+0.5*h),(x(n)+0.5*h*m1),(y(n)+0.5*h*k1));
    m3 = f1((u(n)+0.5*h),(x(n)+0.5*h*m2),(y(n)+0.5*h*k2));
    k3 = f2((u(n)+0.5*h),(x(n)+0.5*h*m2),(y(n)+0.5*h*k2));
    m4 = f1((u(n)+h),(x(n)+h*m3),(y(n)+h*k3));
    k4 = f2((u(n)+h),(x(n)+h*m3),(y(n)+h*k3));
    
    y(n+1) = y(n) + (1/6)*(m1+2*m2+2*m3+m4)*h;
    u(n+1) = u(n) + (1/6)*(k1+2*k2+2*k3+k4)*h; 

end
%% Display of Data
[temp',y']
subplot(3,1,2)
plot(x,y)
title('RK-4 Method')
xlabel('x')
ylabel('y(x)')

%% Actual Solution using dsolve
syms y(t) a b x
eqn = diff(y,t,2) - 4*diff(y,t) + 4*y == 0;

Dy = diff(y,t);
cond = [y(0)==1, Dy(0)==2];
ySol(t) = dsolve(eqn,cond)

%% Display of Data
t = 0:0.1:2;
subplot(3,1,3)
plot(t,ySol(t))
title('Actual Solution Graph')
xlabel('x')
ylabel('y(x)')

%% Shahzaib Asif
% sasif.mscse19s@rcms.nust.edu.pk
