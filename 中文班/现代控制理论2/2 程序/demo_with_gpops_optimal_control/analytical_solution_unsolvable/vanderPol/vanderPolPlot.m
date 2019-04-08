%  vanderPolPlot.m
%
% HLJin,
% initial, 12 June 2014.
% revised, 28 April 2016
%-----------------------------------------------------

% -------------  extract data  -------------
solution = output.result.solution;
 t = solution.phase.time;
x1 = solution.phase.state(:,1);
x2 = solution.phase.state(:,2);
 u = solution.phase.control;

% --------------  plot below  --------------- 
figure(1), clf;
plot(t,x1,'ro', t,x2,'r*', t, u, 'bs'); hold on;
legend('x1', 'x2', 'u');

figure(2); clf;
plot(x1,x2,'ro', linspace(-1.0,0,2),linspace(-1.0,0,2)+1); hold on;
ylabel('x2');  xlabel('x1'); 

% -------------  extract data  -------------
interpsolution = output.result.interpsolution;

 t = interpsolution.phase.time;
x1 = interpsolution.phase.state(:,1);
x2 = interpsolution.phase.state(:,2);
 u = interpsolution.phase.control;

% --------------  plot below  --------------- 
figure(1);
plot(t, x1, 'r', t, x2, 'r', t,u, 'b'); 
grid on;

figure(2);
plot(x1,x2,'r'); grid on;
