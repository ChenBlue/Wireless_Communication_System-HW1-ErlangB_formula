function Bdiff = erlangBdiff(rho, m)
if(fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
end
seq = 0:1:m;
x = rho^m;
seq_sum = sum((rho.^seq)./factorial(seq));
y = factorial(m)*seq_sum;

seq = 1:1:m;
dseq_sum = sum((rho.^(seq-1))./factorial(seq-1));
dx = m*(rho^(m-1));
dy = factorial(m)*dseq_sum;

Bdiff = (dx*y-x*dy)/(y^2);