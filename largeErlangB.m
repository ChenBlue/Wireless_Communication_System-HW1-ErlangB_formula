function B = largeErlangB(rho, m)
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