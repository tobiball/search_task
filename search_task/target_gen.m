function [tcol, tsym, dcol, dsym] = target_gen()
%OUTPUT either r or b & X or O at random
colours = ['r','b'];
symbols = ['X','O'];
rndnum1 = randi(2);
rndnum2 = randi(2);
vec = [2 1];
tcol = colours(rndnum1);
tsym = symbols(rndnum2);
dcol = colours(vec(rndnum1));
dsym = symbols(vec(rndnum2));
end

