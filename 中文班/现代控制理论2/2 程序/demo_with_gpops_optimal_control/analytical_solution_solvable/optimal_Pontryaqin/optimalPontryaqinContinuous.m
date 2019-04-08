%-------------------------------------------------------------------------
% BEGIN: function optimalPontryaqinContinuous.m
%-------------------------------------------------------------------------
function output = optimalPontryaqinContinuous(input)

% t = input.phase.time;
 x1 = input.phase.state(:,1);
%x2 = input.phase.state(:,2);
  u = input.phase.control;

% -------- dynamics --------
dx1 = -x1 + u;
dx2 = x1;
output.dynamics = [dx1, dx2];

% -------- path --------
% output.path = [];

% -------- integrand --------
% output.integrand = [];
%-------------------------------------------------------------------------
% END: function optimalPontryaqinContinuous.m
%-------------------------------------------------------------------------
