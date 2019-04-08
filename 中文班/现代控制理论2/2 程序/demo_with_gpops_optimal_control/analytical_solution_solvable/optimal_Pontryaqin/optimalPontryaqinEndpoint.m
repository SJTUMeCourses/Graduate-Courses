%----------------------------------------------------------
% BEGIN: function optimalPontryaqinEndpoint.m 
%----------------------------------------------------------
function output = optimalPontryaqinEndpoint(input)

%t0 = input.phase.initialtime;
%tf = input.phase.finaltime;

%x0 = input.phase.initialstate;
 xf = input.phase.finalstate;

% -------- eventgroup --------
% output.eventgroup.event = [];

% -------- objective --------
phi = xf(2);
output.objective = phi;
%----------------------------------------------------------
% END: function optimalPontryaqinEndpoint.m 
%----------------------------------------------------------
