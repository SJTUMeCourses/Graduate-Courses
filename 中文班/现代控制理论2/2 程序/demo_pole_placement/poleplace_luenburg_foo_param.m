% Design of
%           Full-Order State Observer by Pole Placement
%
%    See example [p50--52, Lecture Note] 
%
% HLJin
% created on:  22 Dec, 2012
% last updated: 4 Jun, 2105
%
clear all, 
clc,

% The system matrices are
A = [0  -20.6; 1 0],
B = [0; 1],
C = [0 1],

% Step 1.
% Check observability
N = [C; C*A],
rank_N = rank(N),

if rank_N < 2
    disp('The system is not observable'); return;
end

% Step 2.
%
% Pole assignment for full-order state observer
% the desired poles are placed at 
%              s_1 = -1.8 + j2.4
%              s_2 = -1.8 - j2.4
%

phi_A = A^2 + 2*1.8*A + (1.8*1.8+2.4*2.4)*eye(2),
G = phi_A*inv(N)*[0; 1]

% Step 3. 
% Observer system matrix (A - GC) is
A_GC = A-G*C,
% Ckeck the eigenvalues of the closed system
eigenvalue_obsv = eig(A_GC),
