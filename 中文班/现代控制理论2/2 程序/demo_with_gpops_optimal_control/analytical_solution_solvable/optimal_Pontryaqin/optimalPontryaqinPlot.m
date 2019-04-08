% optimalPontryaqinPlot.m
%
% HLJin
% initial£º 18 Feb 2016
% revised£º 27 April 2016
%-------------------------------------------------------------------------
solution = output.result.solution;

%----------------  extract data  ------------------
   t = solution.phase.time; 
  x1 = solution.phase.state(:,1);
  x2 = solution.phase.state(:,2);
   u = solution.phase.control;

lmd1 = solution.phase.costate(:,1);
lmd2 = solution.phase.costate(:,2);

%----------------  plot below  ------------------
plotfontsize = 16;
plotlinewidth = 2;

figure(1); clf;

subplot(1,2,1);
set(gca,'FontSize',plotfontsize);
plot(t,x1,'r', t,x2,'b', t,u,'m', 'LineWidth',plotlinewidth);   
legend('x_1(t)','x_2(t)','u(t)', 'Location','NorthEast');
axis([0,1,-1.2,1.2]);
grid on;

subplot(1,2,2);
set(gca,'FontSize',plotfontsize);
plot(t,lmd1,'r', t,lmd2,'b', 'LineWidth',plotlinewidth);
legend('\lambda_1(t)','\lambda_2(t)', 'Location','best');
axis([0,1,-1.2,1.2]);
grid on;
