clc
clear
n = 0:7;x=10*(0.8).^n;
for i = 1:1:8
    y = cirshift(x,i,8);
    figure(i)
    subplot(211);stem(n,x);
    subplot(212);stem(n,y);
end