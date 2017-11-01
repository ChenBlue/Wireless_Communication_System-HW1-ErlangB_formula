function B = erlangB(rho, m)
% ERLANGB Erlang-B blocking probability of a telecommunications systems
% with m channel numbers and total traffic load rho
% elements of rho must be real and positive
% m must be a scalar positive integer.
% By Erlang-B formula then can derive Blocking probability
if (fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
    return
end
if rho<0
    msg = 'rho should be positive'
end
seq = 0:1:m;
seq_sum = sum((rho.^seq)./factorial(seq));
B = (rho^m)/(factorial(m)*seq_sum);