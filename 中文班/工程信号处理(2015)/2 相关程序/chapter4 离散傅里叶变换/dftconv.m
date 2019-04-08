
clc
clear
h = ones(1,4); x = ones(1,6);
N=length(x)+length(h)-1;
n=0:N-1;
X=fft(x,N);
H=fft(h,N);
Y=X.*H;
y=real(ifft(Y,N));
figure;
stem(n,y);


