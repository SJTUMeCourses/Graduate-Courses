clc
clear
N=512;
fs=5120;
n=0:(N-1);
t=n/fs;
x=cos(2*pi*1040*t)+2*cos(2*pi*1065*t)+3*cos(2*pi*1070*t);
Xk=fft(x);  
figure
plot([0:fs/N:fs/N*(N/2-1)],abs(Xk(1:N/2)))
axis([1000,1100,0,1000]);
set(gca, 'XTickMode', 'manual', 'XTick', [1000, 1040,1050, 1065, 1070, 1100]); grid;

N=5120;
fs=5120;
n=0:(N-1);
t=n/fs;
x=cos(2*pi*1040*t)+2*cos(2*pi*1065*t)+3*cos(2*pi*1070*t);
Xk=fft(x);  
figure
plot([0:fs/N:fs/N*(N/2-1)],abs(Xk(1:N/2)))
axis([1000,1100,0,10000]);
set(gca, 'XTickMode', 'manual', 'XTick', [1000, 1040,1050, 1065, 1070, 1100]); grid;

f0=1050;%移动的频率
N=5120;
fs=5120;
n=0:(N-1);
t=n/fs;
x=cos(2*pi*1040*t)+2*cos(2*pi*1065*t)+3*cos(2*pi*1070*t);
h=exp(-j*2*pi*f0*t);
y=x.*h; %数字变频，把f0=1050点移动到原点
[b,a] = butter(9,200/fs);
g = filter(b,a,y);
r=resample(g,1,10); %重新采样，采样频率为fs/N
fs1=fs/10;
N1=N/10;
Yk=fftshift(fft(r));     %快速傅里叶变换
w=[f0-N1*fs1/(2*N1):fs1/N1:f0+(N1-1)*fs1/(2*N1)];
figure
plot(w,abs(Yk));
axis([1000,1100,0,1000]);
set(gca, 'XTickMode', 'manual', 'XTick', [1000, 1040,1050, 1065, 1070, 1100]); grid;
