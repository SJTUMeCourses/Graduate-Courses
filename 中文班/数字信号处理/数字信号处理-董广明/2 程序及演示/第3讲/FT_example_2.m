%���η����źŵ�FTƵ��ʾ��

dw = 0.001;
w_end = 10;
w = [-w_end : dw : w_end];
T = 1;
Fw = sinc(T*w/2);

figure;
plot(w,Fw);

figure
plot(w,abs(Fw))