function product = seq_product(m,k,rho)
iter = 0:k;
product = prod((m-iter)./rho,2);