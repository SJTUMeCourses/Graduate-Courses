%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab demo program for the course: Statistical Signal Processing (2007-2008)
% Instructor: Jiandong Wang, jiandong@coe.pku.edu.cn
% College of Engineering, Peking University
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Loading the Signal of Interest
% We'll first load in a signal of interest, a short clip from Handel's Hallelujah chorus.
close all;
clear all;

load handel
v = y'/2;
figure(1);
plot((1:length(v))/Fs,v);
xlabel('Time [sec]');
ylabel('Amplitude');
title('Signal of Interest, v(n)');

pause;

%% Listening to the Sound Clip
% You can listen to the signal of interest using MATLAB's SOUND function.

p8 = audioplayer(v,Fs);
playblocking(p8);

%break;
pause;


%% Measured Signal with FM Noise Source
% An FM-modulated sinusoidal signal is added as our noise source.

eta = 0.5*sin(2*pi*1000/Fs*(1:length(v))+...
    10*sin(2*pi/Fs*(1:length(v))));

figure(2);
plot((1:length(eta))/Fs,eta);
xlabel('Time [sec]');
ylabel('Amplitude');
title('Noise Signal');

s = v + eta;
figure(3);
plot((1:length(s))/Fs,s);
xlabel('Time [sec]');
ylabel('Amplitude');
title('Measured Signal');

pause;
%% Listening to the Music + Noise Signal
% Let's listen to the music+noise signal s(n) = v(n) + eta(n) now...

p8 = audioplayer(s,Fs);
playblocking(p8);

pause;
% The "warble" in the signal is clearly audible.  A fixed-coefficient notch
% filter won't remove the FM-modulated sinusoid.  Let's see if the Block
% LMS-based adaptive filter can. 

D = 100;
% D = 0;
L  = 32;
N = 32;
ntr = N*floor((length(v)-D)/N);
leak = 1; % No leakage
mu = 0.005;
x = s(1:ntr);
d = s(1+D:ntr+D);
%h = adaptfilt.blms(L,mu,leak,N);
 h = adaptfilt.rls(L, 0.99);
%h = adaptfilt.nlms(L);

%% Running the Adaptive Filter
% We now filter the noisy music signal with the adaptive filter and compare
% the error to the noiseless music signal.

[y,e] = filter(h,x,d);
figure(4);
%plot(1/Fs:1/Fs:ntr/Fs,v(1+D:ntr+D),...
%    1/Fs:1/Fs:ntr/Fs,e,1/Fs:1/Fs:ntr/Fs,e-v(1+D:ntr+D));
subplot(2,1,1); plot(1/Fs:1/Fs:ntr/Fs,v(1+D:ntr+D),...
    1/Fs:1/Fs:ntr/Fs,e);
xlabel('Time [sec]');
ylabel('Amplitude');
legend('Noiseless Music Signal v(n)', 'Error Signal e(n)');

subplot(2,1,2); plot(1/Fs:1/Fs:ntr/Fs,e-v(1+D:ntr+D));

xlabel('Time [sec]');
ylabel('Amplitude');
title('Difference e(n)-v(n)');
%legend('Noiseless Music Signal v(n)',...
%  'Error Signal e(n)','Difference e(n)-v(n)');

pause; 

figure(5);
plot(1/Fs:1/Fs:ntr/Fs, e,'r');
xlabel('Time [sec]');
ylabel('Amplitude');
title('Signals');
legend('Error Signal e(n)');


pause;

%% Listening to the Error Signal
% If you listen to the error signal you will notice that the residual is
% fairly large, but the music masks the warble tone somewhat.  

p8 = audioplayer(e,Fs);
playblocking(p8);

% Better performance might be obtained with a more advanced algorithm, such as 
% the Block Affine Projection (BAP) algorithm or one of the frequency-domain
% adaptive filters found in the Filter Design Toolbox.  Type "help adaptfilt" 
% to learn about the other adaptive filter algorithms.
