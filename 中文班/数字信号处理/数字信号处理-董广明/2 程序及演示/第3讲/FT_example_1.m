%单边指数信号的FT频谱示例
clc
clear

dt = 0.001;
t_end = 2;
t = [0 : dt : t_end];
a = 2;
ft = exp(-a*t);
figure
plot(t,ft)

dw = 0.001;
w_end = 10;
w = [-w_end : dw : w_end];
Fw = 1./(a+j*w);

figure;
plot(w,abs(Fw));
figure
plot(w,phase(Fw));

