function B = erlangB(rho, m)
if (fix(m)~=m) | (m <= 0)
    msg = 'm should be positive integer'
    return
end
if rho<0
    msg = 'rho should be positive'
end

seq = 0:1:m;
