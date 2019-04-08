% 矩形窗
% 含频域抽样点的讨论
clc
clear
N = 16;
xn = ones(N,1);
Nfft1 = 8192;
w1 = [-pi:2*pi/Nfft1:(pi-2*pi/Nfft1)];
Xk1 = fft(xn,Nfft1);
figure
plot(w1,abs(fftshift(Xk1)))
hold on
Nfft2 = 8;
w2 = [-pi:2*pi/Nfft2:(pi-2*pi/Nfft2)];
Xk2 = fft(xn,Nfft2);
stem(w2,abs(fftshift(Xk2)),'r')

% yn = ones(Nfft1,1);
% fs = Nfft1/N;
% w = [-fs*pi:2*pi*fs/Nfft1:fs*(pi-2*pi/Nfft1)];
% Yk = fft(yn);
% figure
% plot(w,abs(fftshift(Yk)))