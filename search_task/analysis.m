%this script plots the data from the search task experiment
n_vec = [8, 24, 40, 56];
cond_arr = {'c', 'dcol','dsym'};

RT = [data(:).time];
ss = [data(:).set_size];
c = {data(:).condition};
count = 0;
count2 = 0;
for i = cond_arr
    for j = n_vec
        if count == 4
            count = 0;
        end
        count = count + 1;
        rtcn = RT(ss == j & strcmp(c,i));
        if strcmp(i,'c')
            sym = 'o';
            lin = '-';
        elseif strcmp(i,'dcol')
            sym = 'go';
            lin = '-g';
        else
            sym = 'ro';
            lin = '-r';
        end
        plot(j,rtcn,sym);  
        hold on
        vec(count) = mean(rtcn);
    end
    plot(n_vec,vec,lin)
    hold on
end
xlabel('Set Size')
ylabel('Reaction time in seconds')
legend('conjunction','pop-out colour','pop-out symbol')