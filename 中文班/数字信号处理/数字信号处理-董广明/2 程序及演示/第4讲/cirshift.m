function y = cirshift(x,m,N)

%   x = 
  x = [x zeros(1,N-length(x))];    %xΪ������ x<N
  n = [0:1:N-1];
  n = mod(n-m,N);
  y = x(n+1);
end