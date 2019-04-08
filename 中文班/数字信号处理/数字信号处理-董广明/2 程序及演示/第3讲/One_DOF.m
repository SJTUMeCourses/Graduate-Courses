wn = 2*pi*10;          % undamped natural frequency
Kesi = 0.1;               % damping ratio
Ts = 1/1000;            % sampling period
N=round(1/Ts);
a=[0, 0, Ts*Ts];
b=[1, (2*Kesi*wn*Ts-2), (1-2*Kesi*wn*Ts+wn*wn*Ts*Ts)];
figure
zplane(a,b)           % 绘制系统的零极点图
figure
[h,t]=impz(a,b,N,1/Ts);
plot(t,h)                % 绘制系统的脉冲响应
figure
freqz(a,b,N,1/Ts);   % 绘制系统的幅频和相频响应