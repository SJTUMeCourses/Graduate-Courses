% optimalBolzaPlot.m
%
% HLJin
% initial£º 18 Feb 2016
% revised£º 28 April 2016
%-------------------------------------------------------------------------
solution = output.result.solution;

%----------------  extract data  ------------------
   t = solution.phase.time; 
  x1 = solution.phase.state(:,1);
  x2 = solution.phase.state(:,2);
   u = solution.phase.control;

lmd1 = solution.phase.costate(:,1);
lmd2 = solution.phase.costate(:,2);

%-----------------  plot below  ------------------
plotfontsize = 16;
plotlinewidth = 2;

figure(1); clf;

subplot(1,2,1);
set(gca,'FontSize',plotfontsize);
plot(t,x1,'b', t,x2,'g', t,u,'m', 'LineWidth',plotlinewidth);   
legend('x_1(t)','x_2(t)','u(t)', 'Location','best');
switch(Final_time_fixed_or_free)
    case{'FIXED'}
        axis([0,2,-0.2,3.2]);
    case{'FREE'}
        axis([0,4,-0.2,4.2]);
end
grid on;

subplot(1,2,2);
set(gca,'FontSize',plotfontsize);
plot(t,lmd1,'y', t,lmd2,'r', 'LineWidth',plotlinewidth);
legend('\lambda_1(t)','\lambda_2(t)', 'Location','best');
switch(Final_time_fixed_or_free)
    case{'FIXED'}
        axis([0,2,-3.2,0]);
    case{'FREE'}
        axis([0,4,-3.2,0]);
end
grid on;

figure(2); clf;
plot(x1,x2, linspace(0,6,2),(6-linspace(0,6,2))/2); grid on;
ylabel('x2'); xlabel('x1'); 
