% ÖÜÆÚ¾â³Ý²¨Ê¾Àý
clc
clear
Fs = 1000;
T = 2;
A = 2;
t = [-T/2+1/Fs : 1/Fs : T/2]';
x = A/T*t;
% figure
% plot(t,x)
M = 2;
P = x*ones(1,2*M+1);
xp = P(:);
tp = [-T/2-M*T+1/Fs : 1/Fs : T/2+M*T]';
% figure
% plot(tp,xp)

OMEGA = 2*pi/T;
N = 100;
U = zeros(N,length(tp));
for n = 1:1:N
    if mod(n,2)
        U(n,:) = A/(n*pi)*sin(n*OMEGA*tp);
    else
        U(n,:) = -A/(n*pi)*sin(n*OMEGA*tp);
    end
end
u = sum(U);
figure
plot(tp,xp)
hold on
plot(tp,u,'r')