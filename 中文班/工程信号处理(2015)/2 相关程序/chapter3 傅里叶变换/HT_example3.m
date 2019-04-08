% Hilbert transform: estimation of damping coefficient
clc
clear

A=1; zeta=0.01; fn=10; wn=2*pi*fn;
wd=wn*sqrt(1-zeta^2); 
phi=0; 
t=0:0.001:6;

x=A*exp(-zeta*wn*t).*sin(wd*t+phi);       %Expression of the signal
a=hilbert(x);                             %Create the analytic signal
ax=log(abs(a));                           %Compute ln Ax (t). Note that ¡®log¡¯ in MATLAB denotes the natural logarithm.

figure(1)
plot(t, abs(a), t, x, 'g:'); 
axis([0 6 -1.5 1.5])
xlabel('Time (s)');
ylabel('\itA x\rm(\itt\rm)')              % Plot the instantaneous amplitude Ax(t)

figure(2)
plot(t, ax); 
axis([0 6 -6 1])
xlabel('Time (s)');
ylabel('ln\itA x\rm(\itt\rm)')            % Plot ln Ax (t) versus time

p=polyfit(t(1000:4000), ax(1000:4000), 1); %¡®polyfit¡¯ finds the coefficients of a polynomial that fits the data in the least squares sense. 
                                           % In this example, we use a polynomial of degree 1 (i.e. linear regression). 
                                           % Also, we use the data set in the well-defined region only (i.e. 1 to 4 seconds).
                                           
format long
zeta_est=-p(1)/wn                          % ¡®format long¡¯ displays the number with 15 digits.
                                           %  The first element of the vector p represents the slope of the graph in Figure (b) below.
                                           %  Thus, the ¦Æ can be estimated by dividing ?p(1) by the natural frequency ¦Øn .