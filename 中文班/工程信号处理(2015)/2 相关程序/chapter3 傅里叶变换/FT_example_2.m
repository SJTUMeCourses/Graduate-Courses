%矩形方波信号的FT频谱示例

dw = 0.001;
w_end = 10;
w = [-w_end : dw : w_end];
T = 1;
Fw = sinc(T*w/2);

figure;
plot(w,Fw);

figure
plot(w,abs(Fw))