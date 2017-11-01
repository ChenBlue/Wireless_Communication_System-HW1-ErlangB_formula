function Bdiff = erlangBdiff(rho, m)
% Bdiff = ERLANGBDIFF(rho, m) 1st derivative of Erlang-B blocking probability with respect to
% rho (total traffic load in Erlangs)
% Mainly a helper function for Newton's method used in ERLANGRHO
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

% d(u/v)/dx = (v*du/dx - u*dv/dx)/v^2
Bdiff = (dx*y-x*dy)/(y^2);