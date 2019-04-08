
clc
clear
wn = 2*pi*10;              % undamped natural frequency
Kesi = 0.02;               % damping ratio
Ts = 1/100000;             % sampling period
a = [0, 0, Ts*Ts];
b = [1, (2*Kesi*wn*Ts-2), (1-2*Kesi*wn*Ts+wn*wn*Ts*Ts)];

figure
[x,t] = impz(a,b,[],1/Ts);
plot(t,x)                 % 绘制系统的脉冲响应

a = hilbert(x);                             %Create the analytic signal
ax = log(abs(a));                           %Compute ln Ax (t). Note that ‘log’ in MATLAB denotes the natural logarithm.

figure
plot(t, abs(a), t, x, 'g:'); 
xlabel('Time (s)');
ylabel('\itA x\rm(\itt\rm)')              % Plot the instantaneous amplitude Ax(t)

figure
plot(t, ax); 
xlabel('Time (s)');
ylabel('ln\itA x\rm(\itt\rm)')            % Plot ln Ax (t) versus time

p = polyfit(t(1/Ts:4/Ts), ax(1/Ts:4/Ts), 1); %‘polyfit’ finds the coefficients of a polynomial that fits the data in the least squares sense. 
                                           % In this example, we use a polynomial of degree 1 (i.e. linear regression). 
                                           % Also, we use the data set in the well-defined region only (i.e. 1 to 4 seconds).
                                           
zeta_est = -p(1)/wn                          