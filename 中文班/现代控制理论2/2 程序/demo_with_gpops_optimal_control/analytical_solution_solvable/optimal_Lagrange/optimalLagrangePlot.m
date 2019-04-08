%-------------------------------------------------------------------------
%  optimalLagrangePlot.m
%
% HLJin
% initial, 17 March 2016
% revised, 28 April 2016
%-------------------------------------------------------------------------
solution = output.result.solution;

%----------------  extract data  ------------------
t = solution.phase(1).time;
x = solution.phase(1).state;
u = solution.phase(1).control;

lmd = solution.phase(1).costate;

%----------------  plot below  ------------------
plotfontsize = 16;
plotlinewidth = 2;

figure(1); clf;

set(gca,'FontSize',plotfontsize);
plot(t,x,'r', t,u,'m', 'LineWidth',plotlinewidth);   
legend('x(t)','u(t)', 'Location','NorthEast');
axis([0,2,-2,4]);
grid on;
