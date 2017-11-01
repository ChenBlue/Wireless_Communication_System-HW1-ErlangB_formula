function rho = largeErlangRho(B, m)
% Use function in largeErlangBdiff.m and largeErlangB.m to implement
% Newton's method.

if(fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
end
if(B<0 | B>1)
    msg = 'B should be between 0 and 1'
end
% Initial guess
x = m;

for i=1:200
    y = largeErlangB(x, m);
    yerror = y - B;
    if(abs(yerror)<10^-6)
        break
    end
    yprime = largeErlangBdiff(x, m);
    xnext = x-(yerror/yprime);
    x = xnext;
    if x<0
        x=m*rand(1);
    end
end
if i==200
    msg = 'Cannot find solution after 200 iteration'
end
rho = x;