% 周期方波示例
clc
clear
Fs = 1000;
T = 2;  %周期
A = 1;  %信号幅值
tl = [-T/2+1/Fs : 1/Fs : -0.5]';
xl = zeros(length(tl),1);
tc = [-0.5+1/Fs : 1/Fs : 0.5]';
xc =ones(length(tc),1);
tr = [0.5+1/Fs : 1/Fs : T/2]';
xr = zeros(length(tr),1);
t = [tl;tc;tr];
x = [xl;xc;xr];
% figure
% plot(t,x)
M = 2;  %周期数 2*M+1
P = x*ones(1,2*M+1);
xp = P(:);
tp = [-T/2-M*T+1/Fs : 1/Fs : T/2+M*T];
% figure
% plot(tp,xp)

OMEGA = 2*pi/T;   % 基础圆频率
N = round(20*pi/OMEGA);            % 级数个数 2*N+1
U = zeros(2*N+1,length(tp));
cn = zeros(2*N+1,1);
for n = -N:1:N
    k = n+N+1;
    if n == 0
        cn(k) = A/T;
    else
        cn(k) = (A*2/(n*OMEGA*T))*sin(n*OMEGA/2);
    end
    U(k,:) = cn(k)*exp(i*n*OMEGA*tp);
end
u = sum(U);
figure
plot(tp,xp)
hold on
plot(tp,u,'r')

figure
stem([-N:N]*OMEGA,T*cn)


