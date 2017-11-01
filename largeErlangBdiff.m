function Bdiff = largeErlangBdiff(rho, m)
% Bdiff = LARGEERLANGBDIFF(rho, m) 1st derivative of Erlang-B blocking probability with respect to
% rho (total traffic load in Erlangs)
% The derivative equation is derived from modified Erlang-B formula in 
% largeErlangB.m
% Mainly a helper function for Newton's method used in LARGEERLANGRHO
if (fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
    return
end
if rho<0
    msg = 'rho should be positive'
end

sum = 0;
sum1 = 0;
for i=0:m
    sum = sum + seq_product(m,i,rho);
    sum1 = sum1 + seq_product(m,i,rho)*(i-m)/rho;
end

Bdiff = -sum1/(sum^2);