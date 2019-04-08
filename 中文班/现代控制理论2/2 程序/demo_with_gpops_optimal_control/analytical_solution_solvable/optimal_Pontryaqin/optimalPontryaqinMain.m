%=====================================================
% BEGIN: script optimalPontryaqinMain.m
%-----------------------------------------------------
% Pontryaqin  --- Simple optimal control example
%
%  本例题及其分析解见：第6章_最优控制.ppt（第47页）
%
% HLJin,
% initial, 18 Feb 2016
% revised, 27 April 2016
%-----------------------------------------------------
clc; clear all;

%-------------------------------------------------------------------------%
%----------------- Provide All Bounds for Problem ------------------------%
%-------------------------------------------------------------------------%
t0 = 0.0;  % fixed initial time
tf = 1.0;  % fianl time, either fixed or free, see below

x10 = 1.0;
x20 = 0.0;

x1min = -1000.0; x1max = -x1min;
x2min = -1000.0; x2max = -x2min;
umin = -1.0; umax = -umin;

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
bounds.phase.finaltime.lower = tf;
bounds.phase.finaltime.upper = tf;

%-------------------------------------------------------------------------%
%---------------------- Provide Guess of Solution ------------------------%
%-------------------------------------------------------------------------%
guess.phase.time = [t0; tf];
guess.phase.state(:,1) = [x10; x20];
guess.phase.state(:,2) = [x20; x20];
guess.phase.control = [0; 0];

%-------------------------------------------------------------------------%
%------------- Assemble Information into Problem Structure ---------------%        
%-------------------------------------------------------------------------%
setup.name = 'Optimal-Pontryaqin-Problem';
setup.functions.continuous = @optimalPontryaqinContinuous;
setup.functions.endpoint = @optimalPontryaqinEndpoint;
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

optimalPontryaqinPlot;
%-------------------------------------------------------
% END: script optimalPontryaqinMain.m
%-------------------------------------------------------
