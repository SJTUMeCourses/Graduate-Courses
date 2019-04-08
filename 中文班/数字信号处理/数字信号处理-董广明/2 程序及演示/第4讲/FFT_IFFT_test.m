clc
clear

N = 256;
xn = sin(0.2*pi*[1:N]')+sin(0.15*pi*[1:N]');
% xn = sin(0.2*pi*[1:N]');
Nfft1 = 4096;
Xk1 = fft(xn,Nfft1);
xn1 = ifft(Xk1);
figure
plot(xn)
hold on
plot(xn1,'r')
hold off

N = 256;
xn = sin(0.2*pi*[1:N]')+sin(0.15*pi*[1:N]');
% xn = sin(0.2*pi*[1:N]');
Nfft2 = 256;
Xk2 = fft(xn,Nfft2);
xn2 = ifft(Xk2);
figure
plot(xn)
hold on
plot(xn2,'r')
hold off

w1 = [-pi:2*pi/Nfft1:(pi-2*pi/Nfft1)];
figure
plot(w1,abs(fftshift(Xk1)))
hold on
w2 = [-pi:2*pi/Nfft2:(pi-2*pi/Nfft2)];
plot(w2,abs(fftshift(Xk2)),'r')

