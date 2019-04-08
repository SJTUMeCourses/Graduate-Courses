%Hilbert transform: frequency-modulated signal
clc
clear
Ac=1; Am=4; fm=1; fc=8;
t=0:0.001:4;                                %  
x=Ac*cos(2*pi*fc*t + Am*sin(2*pi*fm*t));     % Expression of the frequency-modulated signal
a=hilbert(x);                                % Create the analytic signal
fx=diff(unwrap(angle(a)))./diff(t)/(2*pi);   % Compute the instantaneous frequency in Hz.

figure(1)
plot(t, abs(a), t, x, 'g:'); 
axis([0 4 -1.5 1.5])
xlabel('Time (s)');
ylabel('\itA x\rm(\itt\rm)')               %Plot the instantaneous amplitude Ax(t). Note that the envelope is Ax (t) ¡Ö Ac = 1.

figure(2)
plot(t, unwrap(angle(a))); 
axis([0 4 0 220])
xlabel('Time (s)');
ylabel('\it\phi x\rm(\itt\rm)')           %Plot the instantaneous (unwrapped)phase ¦Õx(t).

figure(3)
plot(t(2:end),fx); 
axis([0 4 0 13])
xlabel('Time (s)'); 
ylabel('\itf x\rm(\itt\rm)')               %Plot the instantaneous frequency,where fx (t) = ¦Øx (t)/2¦Ð.