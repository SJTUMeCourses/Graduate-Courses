%=====================================================
% BEGIN: script optimalBolzaMain.m
%-----------------------------------------------------
% optimal control problem --- Bolza-type 
%
% HLJin,
% initial, 17 March 2016
% revised, 28 April 2016
%-----------------------------------------------------
clc; clear all;

%-------------------------------------------------------------------------%
%----------------- Provide All Bounds for Problem ------------------------%
%-------------------------------------------------------------------------%
t0 = 0.0;  % fixed initial time
tf = 2.0;  % fianl time, either fixed or free, see below

x10 = 0.0;
x20 = 0.0;

x1min = -10.0; x1max = -x1min;
x2min = -10.0; x2max = -x2min;
umin = -10.0; umax = -umin;

Final_time_fixed_or_free = 'FIXED'; % either 'FIXED' or 'FREE'
With_final_state_constraint = 'YES'; % either 'YES or 'NO'

%-------------------------------------------------------------------------%
%----------------------- Setup for Problem Bounds ------------------------%
%-------------------------------------------------------------------------%
bounds.phase.initialstate.lower = [x10, x20];
bounds.phase.initialstate.upper = [x10, x20];
bounds.phase.state.lower = [x1min, x2min];
bounds.phase.state.upper = [x1max, x2max];
bounds.phase.finalstate.lower = [x1min, x2min];
bounds.phase.finalstate.upper = [x1max, x2max];

bounds.phase.control.lower = umin;
bounds.phase.control.upper = umax;

bounds.phase.initialtime.lower = t0;
bounds.phase.initialtime.upper = t0;
switch(Final_time_fixed_or_free)
    case{'FIXED'}
        bounds.phase.finaltime.lower = tf; % final time fixed with Tf = 2; 
        bounds.phase.finaltime.upper = tf;
    case{'FREE'}
        tfMin = 0.1;   tfMax = 9.9;
        bounds.phase.finaltime.lower = tfMin; % final time free 
        bounds.phase.finaltime.upper = tfMax;
end

bounds.phase.integral.lower = 0;
bounds.phase.integral.upper = 10000;

%-------------------------------------------------------------------------%
%---------------------- Provide Guess of Solution ------------------------%
%-------------------------------------------------------------------------%
guess.phase.time = [t0; tf];   % initial guess Tf = 2, whether 'fixed' or 'free' 
guess.phase.state(:,1) = [x10; x20];
guess.phase.state(:,2) = [x20; x20];
guess.phase.control = [0; 0];

guess.phase.integral = 0;

%-------------------------------------------------------------------------%
%------------- Set up Event Constraints That Link Phases -----------------%
%-------------------------------------------------------------------------%
switch(With_final_state_constraint)
    case{'YES'}
        bounds.eventgroup.lower = 0;
        bounds.eventgroup.upper = 0;
    case{'NO'}
        bounds.eventgroup.lower = [];
        bounds.eventgroup.upper = [];
end

%-------------------------------------------------------------------------%
%------------- Assemble Information into Problem Structure ---------------%        
%-------------------------------------------------------------------------%
setup.name = 'Optimal-Bolza-Problem';
setup.functions.continuous = @optimalBolzaContinuous;
setup.functions.endpoint = @optimalBolzaEndpoint;
setup.bounds = bounds;
setup.guess = guess;
% ---- optional fields ---- 
setup.auxdata = With_final_state_constraint;  % auxdata: user defined 
%setup.derivatives.supplier = 'sparseFD';
%setup.derivatives.derivativelevel = 'first';
%setup.derivatives.dependencies = 'sparseNaN';
%setup.scales.method = 'none';
%setup.method = 'RPMintegration';
%setup.mesh.method = 'hp1';
%setup.mesh.tolerance = 1e-6;
%setup.mesh.maxiteration = 45;
%setup.mesh.colpointsmin = 4;
%setup.mesh.colpointsmax = 10;
%setup.mesh.phase.colpoints = 4*ones(1,10);
%setup.mesh.phase.fraction =  0.1*ones(1,10);
%setup.nlp.solver = 'snopt';
%setup.displaylevel = 2;

%-------------------------------------------------------------------------%
%----------------------- Solve Problem Using GPOPS-II --------------------%
%-------------------------------------------------------------------------%
output = gpops2(setup);

%-------------------------------------------------------------------------%
%--------------------- Extract Various Results from Output ---------------%
%-------------------------------------------------------------------------%
totaltime = output.totaltime,
objective = output.result.objective,
finaltime = max(output.result.solution.phase.time),

optimalBolzaPlot;
%-------------------------------------------------------
% END: script optimalBolzaMain.m
%-------------------------------------------------------
