function [n, cond, target, n_deter, cond_deter] = rnd_config()
%OUTPUT random set size, a condtion, and a boolean for target,
%integers indicating postition in selection vector
n_vec = [8, 24, 40, 56];
n_deter = randi(4);
n = n_vec(n_deter);

cond_arr = {'c', 'dcol','dsym'};
cond_deter = randi(3);
cond = cond_arr{cond_deter};

target_vec = [0,1,1,1,1];
target_deter = randi(5);
target = target_vec(target_deter);
end

