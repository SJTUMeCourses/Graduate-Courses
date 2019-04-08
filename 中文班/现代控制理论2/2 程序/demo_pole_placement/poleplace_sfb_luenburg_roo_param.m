% Design of
%                         State Feedback and
%           Reduced-Order State Observer by Pole Placement
%
%    This example is taken from 
%           Example 10-8, p587-589, Mordern Control Engineering, 5th Ed.
%
%    See also: [主题09_状态空间法与设计, p106-107]
%
% HLJin
% created on:  22 Dec, 2012
% last updated: 4 Jun, 2015
%
clear all,
clc,

% The original system matrices are
A = [0  1  0; 0  0  1; -6  -11  -6],
B = [0; 0; 1],
C = [1 0 0],

% Step 1. 
% Check controllability
M = [B  A*B  A*A*B]
rank_M = rank(M)
if rank_M < 3
    disp('The system is not controllable'); return;
end
% Pole assignment for state feed back
% the desired poles are placed at
%  $s_1 = -2 + j*2*sqrt(3) $, $s_2 = -2 - j*2*sqrt(3) $, $s_3 = -6$
pole_ctrl_desired = [-2+j*2*sqrt(3)  -2-j*2*sqrt(3)  -6],
K = acker(A, B, pole_ctrl_desired),
% Ckeck the eigenvalues of the closed system
eigenvalue_ctrl = eig(A-B*K),

% Step 2.
% Pole assignment for reduced-order state observer
% the two desired poles are placed at $s_1 = s_2 = -10$
%
m=1; n=3;
Aaa = A(m,m),
Aab = A(m, (n-m):n),
Aba = A((n-m):n, m),
Abb = A((n-m):n, (n-m):n),
Ba = B(m),
Bb = B((n-m):n),
pole_esti_desired = [-10 -10],
G = acker(Abb', Aab',  pole_esti_desired )',
% Ckeck the eigenvalues of the closed system
eigenvalue_esti = eig(Abb-G*Aab),

% System matrices of the reduced-order observer
AA = Abb - G*Aab,
BB =  Bb - G*Ba,
GG =(Abb - G*Aab)*G + (Aba - G*Aaa),
CC = [zeros(m, n-m); eye(n-m)],
DD = [eye(m); G],
