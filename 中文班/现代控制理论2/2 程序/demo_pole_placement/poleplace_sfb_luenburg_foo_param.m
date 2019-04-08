% Design of
%                      State Feedback and
%           Full-Order State Observer by Pole Placement
%
%    See example [p67-70, Lecture Note] 
%
% HLJin
% created on:  22 Dec, 2012
% last updated: 4 Jun, 2015
%
clear all, 
clc,

% The system matrices are
A = [0  1; 0  -5],
B = [0; 100],
C = [1 0],

% Step 1.
% Check controlability and design state feedback law u = Kx
M = [B  A*B],
rank_M = rank(M),
if rank_M < 2
    disp('The system is not controllable'); return;
end
% Pole assignment for state feedback
% the desired pole are placed at 
%       s_1 = -7.07 + j7.07
%       s_2 = -7.07 - j7.07
%
sigma = 5*sqrt(2); omega = 5*sqrt(2);
p = [ -sigma + j*omega, -sigma - j*omega]
K = acker(A, B, p),
% Ckeck the eigenvalues of the closed system
eigenvalue_ctrl = eig(A-B*K),

% Step 2.
% Check observability and design a full-order observer
N = [C; C*A],
rank_N = rank(N),
if rank_N < 2
    disp('The system is not observable'); return;
end

%
% Pole assignment for full-order state observer
% the desired poles are placed at 
%              lambda_1 = -50
%              lambda_2 = -50
%
lambda_1 = -50; lambda_2 = -50;  % ×´Ì¬¹À¼ÆÎó²îË¥¼õ¿ì£¬µ«ÐÅºÅÕñµ´¾çÁÒ
%lambda_1 = -5; lambda_2 = -5;    % ×´Ì¬¹À¼ÆÎó²îË¥¼õÂý£¬µ«ÐÅºÅÕñµ´Æ½»º
p = [lambda_1, lambda_2],
G = acker(A', C', p)'
% Ckeck the eigenvalues of the closed system (A-GC)
A_GC = A-G*C,
eigenvalue_obsv = eig(A_GC),
