rho_ans = [0.01 1 erlangRho(0.01,1)];
for B = [0.01 0.03 0.05 0.1]
    for m = 1:20
        if m==1 & B==0.01
            continue
        end
        rho_ans = cat(1, rho_ans, [B m erlangRho(B,m)]);
    end        
end

rho_ans