function product = seq_product(m,k,rho)
% continuous product in Erlang-B formula
iter = 0:m-k-1;
product = prod((m-iter)./rho,2);