%--------------------------------------------------------------------------
% 利用Chebyshev最佳一致逼近方法，设计一个低通FIR滤波器，
% 要求通带边界频率wp  = 0.6π，阻带边界ws = 0.7π
%-------------------------------------------------------------------------
clear all;

f=[0 .6 .7 1];
% 给定频率轴分点；
A=[1 1  0 0];
% 给定在这些频率分点上理想的幅频响应；
weigh=[1 10];	
% 给定在这些频率分点上的加权；

b=remez(32,f,A,weigh);
% 设计出切比雪夫最佳一致逼近滤波器；
%
[h,w]=freqz(b,1,256,1);
h=abs(h);
h=20*log10(h);
figure(1)
stem(b,'.');grid;
figure(2)
plot(w,h);grid;
  