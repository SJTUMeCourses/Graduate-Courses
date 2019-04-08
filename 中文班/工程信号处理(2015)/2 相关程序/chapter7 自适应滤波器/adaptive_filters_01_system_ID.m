% Example: System identification with LMS adaptive filter.

clc;
clear;


%% Simulation scenario #1: abrupt change of parameters
%rand('state',sum(100*clock));
randn('seed', 1);
x1  = randn(1,500);     % Input to the filter
% x1 = filter(1, [1 -0.9], x1);  
% b1  = fir1(31,0.5);     % FIR system to be identified
b1 = [1 0.2 -0.3];
n1  = 0.1*randn(1,500); % Observation noise signal
d1  = filter(b1,1,x1)+n1;  % Desired signal
% d1 = filter([0.0675 0.1349  0.0675], [1 -1.1430, 0.4128], x1) + n1;

x2  = randn(1,500);     % Input to the filter
% x2  = filter(1, [1 0.9], x2);
b2 = [1 -0.2 0.3];
n2  = 0.1*randn(1,500); % Observation noise signal
d2  = filter(b2,1,x2)+n2;  % Desired signal

x3  = randn(1,500);     % Input to the filter
% x2  = filter(1, [1 0.9], x2);
b3 = [1 0.2 -0.3];
n3  = 0.1*randn(1,500); % Observation noise signal
d3  = filter(b3,1,x3)+n3;  % Desired signal

d = [d1, d2, d3];
x = [x1, x2, x3];

% % Simulation scenario #2: time-varying parameters
% randn('seed', 1);
% x  = randn(1,1500);     % Input to the filter
% % a0  = cos(-0.5:0.005:0.5);
% % a = [-0.5*ones(1, 150), a0, -0.5*ones(1, 500-length(a0)-150)];  % time-varying parameter
% a = sin(2*pi*(0.001:0.001:1.5));
% xn = x; 
% xn_1 = [0 x(1:end-1)];
% dn = xn + xn_1.*a; % Noise-free output
% n = 0.1*randn(1,1500); % Observation noise signal
% d = dn + n; % Noise-corrupted output


L = length(d);


%% LMS adaptive filter via Matlab adaptfilt.lms and filter
mu = 0.1;            % LMS step size
% M = 30;  % order of the adaptive filter
M = 3;  % order of the adaptive filter
% M = 2;  % order of the adaptive filter
h_lms = adaptfilt.lms(M,mu);
%h_lms = adaptfilt.nlms(M);  % normalized adaptive LMS filter
[y_lms,e_lms] = filter(h_lms,x,d);  
figure(1); subplot(2,1,1); plot(1:L,d, 'r:');
hold on; plot(1:L,y_lms, 'g');
title('System Identification of an FIR filter via adaptfilt.lms');
legend('Desired signal d ','Filter output y');
xlabel('time index'); ylabel('signal value');
subplot(2,1,2); plot(1:L,e_lms);
legend('Error'); xlabel('time index'); ylabel('signal value');


%% Learning history of Matlab adaptfilt.lms and filter
b_lms_h = [];
e_lms_s_h = [];
for j = 1:L
    h_lms = adaptfilt.lms(M,mu);
    xj = x(1:j);
    dj = d(1:j);
    [y_lms_j,e_lms_j] = filter(h_lms,xj,dj);
    e_lms_s_h = [e_lms_s_h, e_lms_j(j)];
    b_lms_h = [b_lms_h, h_lms.Coefficients'];
end 
nplot = M;
figure(2);
for i=1:nplot
     subplot(nplot, 1, i); plot(1:L, b_lms_h(i,:)'); % learning process of FIR coeff.
     xlabel('time index'); ylabel('coeff.'); grid on;
     if i==1
         title('Learning history of the FIR coefficients via h_lms');
     end
end
