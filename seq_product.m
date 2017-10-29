function product = seq_product(m,k,rho)
iter = 0:m-k-1;
product = prod((m-iter)./rho,2);