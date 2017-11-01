function rho = erlangRho(B, m)
% ERLANGRHO. Newton-Raphson iteration of total offered traffic load
% rho is the total offered traffic load in Erlangs
% B is the blocking probability
% m is the number of channels (must be a positive integer)

if(fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
end
if(B<0 | B>1)
    msg = 'B should be between 0 and 1'
end
% Initial guess
x = m;

% Start iteration
for i=1:200
    y = erlangB(x, m);
    yerror = y - B;
    if(abs(yerror)<10^-6) % Set a criterion to break out
        break
    end
    yprime = erlangBdiff(x, m);
    xnext = x-(yerror/yprime); 
    x = xnext;
    if x<0  % don't allow An to go negative
        x=m*rand(1);  %try another guess
    end
end
if i==200
    msg = 'Cannot find solution after 200 iteration'
end
rho = x;