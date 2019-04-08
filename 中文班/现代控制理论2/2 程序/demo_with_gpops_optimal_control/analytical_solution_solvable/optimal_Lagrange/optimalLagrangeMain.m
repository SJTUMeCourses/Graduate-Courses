%=====================================================
% BEGIN: script optimalLagrangeMain.m
%-----------------------------------------------------
% optimal control problem --- Lagrange-type
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

x0 = 3.0;  % fixed initial state
xf = 0.0;  % fixed final state

xMin = -10.0; xMax = -xMin;
uMin = -10.0; uMax = -uMin;

Final_time_fixed_or_free = 'FIXED';  %either 'FIXED' or 'FREE'

%-------------------------------------------------------------------------%
%----------------------- Setup for Problem Bounds ------------------------%
%-------------------------------------------------------------------------%
bounds.phase.initialstate.lower = x0;
bounds.phase.initialstate.upper = x0;
bounds.phase.state.lower = xMin;
bounds.phase.state.upper = xMax;
bounds.phase.finalstate.lower = xf; 
bounds.phase.finalstate.upper = xf;

bounds.phase.control.lower = uMin; 
bounds.phase.control.upper = uMax;

bounds.phase.initialtime.lower = t0;
bounds.phase.initialtime.upper = t0;
switch(Final_time_fixed_or_free)
    case{'FIXED'}
        bounds.phase.finaltime.lower = tf; % final time fixed with Tf = 2; 
        bounds.phase.finaltime.upper = tf;
    case{'FREE'}
        tfMin = 0.1;   tfMax = 2.9;
        bounds.phase.finaltime.lower = tfMin; % final time free 
        bounds.phase.finaltime.upper = tfMax;
end

bounds.phase.integral.lower = 0;
bounds.phase.integral.upper = 10000;

%-------------------------------------------------------------------------%
%---------------------- Provide Guess of Solution ------------------------%
%-------------------------------------------------------------------------%
guess.phase.time = [t0; tf]; % initial guess Tf = 2, whether 'fixed' or 'free'
guess.phase.state = [x0; xf];
guess.phase.control = [0; 0];

guess.phase.integral = 0;

%-------------------------------------------------------------------------%
%------------- Assemble Information into Problem Structure ---------------%        
%-------------------------------------------------------------------------%
setup.name = 'Optimal-Lagrange-Problem';
setup.functions.continuous = @optimalLagrangeContinuous;
setup.functions.endpoint = @optimalLagrangeEndpoint;
setup.bounds = bounds;
setup.guess = guess;
% ---- optional fields ---- 
%setup.auxdata = [];
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

optimalLagrangePlot;
%-------------------------------------------------------
% END: script optimalLagrangeMain.m
%-------------------------------------------------------
