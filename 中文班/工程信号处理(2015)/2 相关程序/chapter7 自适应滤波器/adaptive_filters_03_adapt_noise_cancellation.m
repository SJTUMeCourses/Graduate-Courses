clc
clear
%SANC from matlab
delay  = 100;                              % Number of samples of delay
ntr= 5000;                           % Number of iterations
v  = sin(2*pi*0.05*[1:ntr+delay]);       % Sinusoidal signal
n  = randn(1,ntr+delay);                 % Noise signal
x  = v(1:ntr)+n(1:ntr);              % Input signal (delayed desired 
                                     % signal)
d  = v(1+delay:ntr+delay)+n(1+delay:ntr+delay);      % Desired signal
% mu = 0.0001;                         % Sign-data step size  change to test
mu = 0.00001; 
ha = adaptfilt.lms(1024,mu);
[y,e] = filter(ha,x,d); 
subplot(2,1,1); 
plot(1:ntr,[d;y;v(1+delay:ntr+delay)]);
axis([ntr-100 ntr -3 3]);
title('Adaptive Line Enhancement of a Noisy Sinusoidal Signal');
legend('Observed','Enhanced','Original');
xlabel('Time Index'); ylabel('Signal Value');
[pxx,om] = pwelch(x(ntr-1000:ntr));
pyy = pwelch(y(ntr-1000:ntr));  
subplot(2,1,2); 
plot(om/pi,10*log10([pxx/max(pxx),pyy/max(pyy)]));
axis([0 1 -60 20]);
legend('Observed','Enhanced'); 
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Power Spectral Density'); grid on;