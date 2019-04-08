% ¡¡Design of
%           Reduced-Order State Observer by Pole Placement
%
%¡¡¡¡This example is taken from Exercise 5-12, p229.
%
%      This example is open-loop unstable, and therefore not appropriate for 
%   demonstration on class.
%
% HLJin
% created on:  22 Dec, 2012
% last updated: 4 Jun, 2015
%
clear all,
clc,

% The original system matrices are
A = [0  1  0; 0  0  1; 0  0  0],
B = [0; 0; 1],
C = [1 0 0],

% Step 1. 
% Check observability
N = [C;  C*A;  C*A*A]
rank_N = rank(N)
if rank_N < 3
    disp('The system is not controllable'); return;
end

% Step 2. 
% Design transformation such that x3 is messured signal 
T = [0 0 1; 0 1 0; 1 0 0],
inv_T = inv(T),
A_ = inv_T * A * T,
B_ = inv_T * B,
C_ = C * T,

% Step 2.
% Pole assignment for reduced-order state observer
% the two desired poles are placed at 
%            s_1 = -4
%            s_2 = -5
n=3; m=1; 
A11 = A_(1:n-m, 1:n-m),
A12 = A_(1:n-m, n-m+1:n),
A21 = A_(n-m+1:n, 1:n-m),
A22 = A_(n-m+1:n, n-m+1:n),

B_1 = B_(1:n-m, :),
B_2 = B_(n-m+1:n, :),
pole_esti_desired = [-4 -5],
G = acker(A11', A21',  pole_esti_desired )',
% Ckeck the eigenvalues of the closed system
eigenvalue_esti = eig(A11-G*A21),

% System matrices of the reduced-order observer
AA = A11 - G*A21,
BB = B_1 - G*B_2,
GG = (A11 - G*A21)*G + (A12-G*A22),
