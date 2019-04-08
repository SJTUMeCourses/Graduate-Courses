%Hilbert transform: amplitude-modulated signal
clc
clear
Ac=1; Am=0.5; fm=1; fc=10;
t=0:0.001:3;
x=(Ac+Am*cos(2*pi*fm*t)).*cos(2*pi*fc*t);      %Expression of the amplitude-modulated signal x(t)
a=hilbert(x);                                  %Create the analytic signal. Note that, in MATLAB, the function ¡®hilbert¡¯creates the analytic signal.
fx=diff(unwrap(angle(a)))./diff(t)/(2*pi);     %This is an approximate derivative, which computes the instantaneous frequency in Hz.

figure(1)
plot(t, abs(a), t, x, 'g:')
axis([0 3 -2 2])
xlabel('Time (s)'); ylabel('\itA x\rm(\itt\rm)')    %Plot the instantaneous amplitude Ax(t).

figure(2)
plot(t, unwrap(angle(a)))
axis([0 3 0 200])
xlabel('Time (s)'); ylabel('\it\phi x\rm(\itt\rm)') %Plot the instantaneous (unwrapped) phase ¦Õx(t)

figure(3)
plot(t(2:end),fx)
axis([0 3 8 12])
xlabel('Time (s)'); ylabel('\itf x\rm(\itt\rm)')    %Plot the instantaneous frequency, where fx (t) = ¦Øx (t)/2¦Ð.
                                                    %Note that fx (t) estimates fc = 10 reasonably well, except small regions at the beginning and end.