%----------------------------------------------------------
% BEGIN: function vanderPolContinuous.m
%----------------------------------------------------------
function output = vanderPolContinuous(input)

x1 = input.phase.state(:,1);
x2 = input.phase.state(:,2);
 u = input.phase.control;

% -------- dynamics --------
dx1 = x2;
dx2 = -x1 + (1-x1.^2).*x2 + u;
output.dynamics = [dx1, dx2];

% -------- path --------
% output.path = [];

% -------- integrand --------
output.integrand = 0.5*(x1.*x1+ x2.*x2+u.*u);
%--------------------------------------------------------
% END: function vanderPolContinuous.m
%---------------------------------------------------------
