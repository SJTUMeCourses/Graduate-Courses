clc
clear
N = 6; M = 4;                        % 序列长度及采样点数
xn1 = ones(N,1);                    % 矩形序列
% k = 0:1:M-1;                          %  频域离散
% wk = 2*pi*k/M;
% Xk = 0;                                  %频域离散后的DTFT计算
% for n = 1:1:N 
%     Xk = Xk + xn1(n)*exp(-j*(n-1)*wk);
% end
Xk = fft(xn1,M);
xn2 = real(ifft(Xk,M));               % M点IDFT计算
figure;                                  % 显示
subplot(211);stem([0:N-1],xn1); ylabel('xn1'); 
subplot(212);stem([0:M-1],xn2); ylabel('xn2');
% 
% xn1_p = xn1*ones(1,3);
% xn1_p = (xn1_p(:))';
% subplot(211);stem([0:length(xn1_p)-1],xn1_p);
% set(gca, 'XTickMode', 'manual', 'XTick', [0, N-1,2*N-1,3*N-1]); grid;
% 
% xn2_p = xn2'*ones(1,3);
% xn2_p = (xn2_p(:))';
% subplot(212);stem([0:length(xn2_p)-1],xn2_p);
% set(gca, 'XTickMode', 'manual', 'XTick', [0, M-1,2*M-1,3*M-1]); grid;

% Xk = fft(xa,M);

