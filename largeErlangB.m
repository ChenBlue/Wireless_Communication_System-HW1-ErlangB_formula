function B = largeErlangB(rho, m)
% B: Blocking probability, rho: total offered traffic, m: channel number
% Rewrite Erlang-B formula to avoid factorial of large channel number. 
% The continuout product part is implemented in seq_product.m
if (fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
    return
end
if rho<0
    msg = 'rho should be positive'
end

sum = 0;
for i=0:m
    sum = sum + seq_product(m,i,rho);
end

B = 1/sum;