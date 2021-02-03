function [] = Treisman_exp(n,cond,target)
% This function creates a figure with n objects, with or without a
% target for a disjunctive or conjunctive visual search
% INPUT:
% n = number of objects (target + distractors)
% cond = 'c' of 'dcol' of 'dsym'
% (cond search: conjunctive, disjunctive with colour or with symbol)
% target = 0 or 1 (target is absent or present)

%%input check
if rem(n, 4) ~= 0 || n <= 1 || ~ismember(cond,{'c','dcol','dsym'}) || ~ismember(target,[0,1])
    error('Invalid input: n = %d, cond = %s, target = %d',n,cond,target)
end

%%colour and symbol assignment and unique coordinate creation
[tcol, tsym, dcol, dsym] = target_gen();
cord = rnd_coordinates(n);

%% figure creation
% if statement states condition
    %for loops iterats through number of stimuli
        %if statements determine number of stimuli of specific type
if strcmp(cond,'c')
    for i = 1:n
        if i <= n/4
            put_symbol_inFigure(cord(i,:),dsym,dcol)
        elseif i <= n/2%for loop iterates through number of stimuli
            put_symbol_inFigure(cord(i,:),tsym,dcol)
        elseif i <= n-1 
            put_symbol_inFigure(cord(i,:),dsym,tcol)
        else
            if target == 1
                put_symbol_inFigure(cord(i,:),tsym,tcol)
            end
        end
    end
elseif strcmp(cond,'dcol')
    for i = 1:n
        if i <= n/2
            put_symbol_inFigure(cord(i,:),dsym,dcol)
        elseif i <= n-1 
            put_symbol_inFigure(cord(i,:),tsym,dcol)
        else
            if target == 1
                put_symbol_inFigure(cord(i,:),tsym,tcol)
            end
        end
    end
else
    for i = 1:n
        if i <= n/2
            put_symbol_inFigure(cord(i,:),dsym,dcol)
        elseif i <= n-1 
            put_symbol_inFigure(cord(i,:),dsym,tcol)
        else
            if target == 1
                put_symbol_inFigure(cord(i,:),tsym,tcol)
            end
        end
    end
end
end