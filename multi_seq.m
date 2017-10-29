function product = multi_seq(m,k,rho)
iter = 0:k;
product = prod((m-iter)./rho)