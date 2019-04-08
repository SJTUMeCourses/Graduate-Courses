clc
clear
Ts = 0.001;
fs = 1/Ts;
N = 512;
t = [0:Ts:(N-1)*Ts];
DataVec = sin(2*pi*100*t)+sin(2*pi*200*t)+sin(2*pi*205*t);
FreqVec = fft(DataVec);
DataVec_window = DataVec.*hamming(N)';
FreqVec_window = fft(DataVec_window);

% f = [0:fs/N:(N-1)*fs/N];
% figure
% plot(f,abs(FreqVec))
% f_sym = [-N*fs/(2*N):fs/N:(N-1)*fs/(2*N)];
% figure
% plot(f_sym,abs(fftshift(FreqVec)))
f_half = [0:fs/N:(N-1)*fs/(2*N)];
figure
plot(f_half,abs(FreqVec(1:N/2)))
hold on
plot(f_half,abs(FreqVec_window(1:N/2)),'r')
xlabel('Frequency(Hz)')
ylabel('Amplitude')