clc
clear
h = [1,0,-1];
x = [1:1:10];
L = length(h) + length(x) - 1;
x = [x zeros(1,L-length(x))];
N = 4;
y1 = fftfilt(h,x,N);
y2 = real(ifft(fft(h,L).*fft(x,L)));
plot(y1-y2)


