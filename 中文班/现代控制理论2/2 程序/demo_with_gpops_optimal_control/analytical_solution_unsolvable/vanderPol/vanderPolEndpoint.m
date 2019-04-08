%----------------------------------------------------------
% BEGIN: function vanderPolEndpoint.m
%----------------------------------------------------------
function output = vanderPolEndpoint(input)

%t0 = input.phase.initialtime;
%tf = input.phase.finaltime;

%x0 = input.phase.initialstate;
 xf = input.phase.finalstate;

% ------- eventgroup -------
psi = -xf(1) + xf(2) - 1.0;
output.eventgroup.event = psi;

% -------  objective  -----
  q = input.phase.integral;
output.objective = q;
%--------------------------------------------------------
% END: function vanderPolEndpoint.m
%---------------------------------------------------------
