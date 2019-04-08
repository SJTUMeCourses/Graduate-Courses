function y = cirshift(x,m,N)

%   x = 
  x = [x zeros(1,N-length(x))];    %x为行向量 x<N
  n = [0:1:N-1];
  n = mod(n-m,N);
  y = x(n+1);
end