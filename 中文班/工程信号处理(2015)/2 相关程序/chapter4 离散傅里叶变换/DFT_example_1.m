%矩形序列的DTFT与DFT
clc
clear
N = 10;
x = ones(1,N);
figure
stem([0 0 x 0 0 0])

dw = 0.001;
w_end = pi;
w = [-w_end : dw : w_end];
X = sin(0.5*N*w)./sin(0.5*w);
figure
plot(w,abs(X))

w = [0 : dw : 2*w_end];
X = sin(0.5*N*w)./sin(0.5*w);
k = [0:1:2*N-1];
Xk = sin(0.5*pi*k)./sin(0.5*pi*k/N);
wk = 2*pi*k/length(k);
figure
plot(w,abs(X))
hold on
stem(wk,abs(Xk))

figure
plot(w,X)
hold on
stem(wk,Xk)


