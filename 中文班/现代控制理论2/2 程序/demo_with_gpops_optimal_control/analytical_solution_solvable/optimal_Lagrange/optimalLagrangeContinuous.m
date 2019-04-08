%-------------------------------------------------------------------------
% BEGIN: function optimalLagrangeContinuous.m
%-------------------------------------------------------------------------
function output = optimalLagrangeContinuous(input)

%t = input.phase.time;
x = input.phase.state;
u = input.phase.control;

% -------- dynamics --------
xdot = -x + u;
output.dynamics = xdot;

% -------- path --------
% output.path = [];

% -------- integrand --------
output.integrand = 1.0 + u.^2;
%-------------------------------------------------------------------------
% END: function optimalLagrangeContinuous.m
%-------------------------------------------------------------------------
