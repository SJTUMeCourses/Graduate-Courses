%-------------------------------------------------------------------------
% BEGIN: function optimalBolzaContinuous.m
%-------------------------------------------------------------------------
function output = optimalBolzaContinuous(input)

% t = input.phase.time;
%x1 = input.phase.state(:,1);
 x2 = input.phase.state(:,2);
  u = input.phase.control;

% -------- dynamics --------
dx1 = x2;
dx2 = -x2 + u;
output.dynamics = [dx1, dx2];

% -------- path --------
% output.path = [];

% -------- integrand --------
output.integrand = 0.5*(2.0 + u.^2);
%-------------------------------------------------------------------------
% END: function optimalBolzaContinuous.m
%-------------------------------------------------------------------------
