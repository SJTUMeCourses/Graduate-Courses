clc
clear
x1 = ones(1,4);
x2 = ones(1,6);
N = 6;
y = circonv(x1,x2,N);
n = 0:1:N-1;
m = 0:1:11;
figure
subplot(421)
stem([0:length(x1)-1],x1);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
subplot(423)
stem([0:length(x2)-1],x2);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
subplot(425)
stem(n,y);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
N = 7;
y = circonv(x1,x2,N);
n = 0:1:N-1;
subplot(427)
stem(n,y);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
N = 8;
y = circonv(x1,x2,N);
n = 0:1:N-1;
subplot(422)
stem(n,y);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
N = 9;
y = circonv(x1,x2,N);
n = 0:1:N-1;
subplot(424)
stem(n,y);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
N = 10;
y = circonv(x1,x2,N);
n = 0:1:N-1;
subplot(426)
stem(n,y);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
y = conv(x1,x2);
n = 0:1:length(y)-1;
subplot(428)
stem(n,y);
axis([0,11,0,4]);
set(gca, 'XTickMode', 'manual', 'XTick', m); grid;
% N = 11;
% y = circonv(x1,x2,N);
% n = 0:1:N-1;
% subplot(428)
% stem(n,y);
% axis([0,11,0,4]);
% set(gca, 'XTickMode', 'manual', 'XTick', m); grid;