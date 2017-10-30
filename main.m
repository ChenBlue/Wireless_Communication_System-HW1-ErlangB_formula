rho_ans = [0.01 1 largeErlangRho(0.01,1)];
for B = [0.01 0.03 0.05 0.1]
    for m = [1:20 200:220]
        if m==1 & B==0.01
            continue
        end
        rho_ans = cat(1, rho_ans, [B m largeErlangRho(B,m)]);
    end        
end

rho_ans

p1 = plot(rho_ans(1:20,2), rho_ans(1:20,3), rho_ans(42:61,2), rho_ans(42:61,3),'--',rho_ans(83:102,2), rho_ans(83:102,3),rho_ans(124:143,2), rho_ans(124:143,3),'-.')
title('Total offer traffic load for channel number 1~20')
xlabel('Channel Number')
ylabel('Total offer traffic load (Erlangs)')
p1(1).Marker = '.'
p1(2).Marker = '.';
p1(3).Marker = '.';
p1(4).Marker = '.';
legend('1%','3%', '5%', '10%')

figure;
p2 = plot(rho_ans(21:41,2), rho_ans(21:41,3), rho_ans(62:82,2), rho_ans(62:82,3),'--',rho_ans(103:123,2), rho_ans(103:123,3),rho_ans(144:164,2), rho_ans(144:164,3),'-.')
title('Total offer traffic load for channel number 200~220')
xlabel('Channel Number')
ylabel('Total offer traffic load (Erlangs)')
p2(1).Marker = '.'
p2(2).Marker = '.';
p2(3).Marker = '.';
p2(4).Marker = '.';
legend('1%','3%', '5%', '10%')

