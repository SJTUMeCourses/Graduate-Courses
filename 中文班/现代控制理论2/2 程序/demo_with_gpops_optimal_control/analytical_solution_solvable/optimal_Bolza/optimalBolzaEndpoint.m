%-------------------------------------------------------------------------
% BEGIN: optimalBolzaEndpoint.m
%-------------------------------------------------------------------------
function output = optimalBolzaEndpoint(input)

With_final_state_constraint = input.auxdata;

%t0 = input.phase.initialtime;
%tf = input.phase.finaltime;

%x0 = input.phase.initialstate;
 xf = input.phase.finalstate;
 
% -------- eventgroup --------
switch(With_final_state_constraint)
    case{'YES'}
        psi = xf(1) + 2.0*xf(2) - 6.0;
        output.eventgroup.event = psi;
    case{'NO'}
        output.eventgroup.event = [];
end

% -------- objective --------
  q = input.phase.integral;
phi = 0.5*(xf(1)-5.0)^2 + 0.5*(xf(2)-2.0)^2;
output.objective = phi + q;
%-------------------------------------------------------------------------
% BEGIN: optimalBolzaEndpoint.m
%-------------------------------------------------------------------------
