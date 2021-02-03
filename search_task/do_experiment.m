function [reactionTime, correct, button, hit] = do_experiment(n, cond, target)
%this function shows a stimulus and lets the participant give a response to the 
% question whether the target is absent or present. Measures the reaction time and checks whether response was correct. 
%INPUT:
% n = number of objects (target + distractors)
% cond = 'c' of 'dcol' of 'dsym'
% (cond search: conjunctive, disjunctive with colour or with symbol)
% target = 0 or 1 (target is absent or present)
 
%before the experiment starts, explain to the participant that a figure is
%going to appear and they have to answer the question on the figure & that
%reaction time will be measured. 
 
 
%fprintf('A graph will appear on the screen.\n You will have to answer the question on the graph and follow the %instructions!\n')
 
%call previously made function to create the stimuli figure 
Treisman_exp(n,cond,target)
 
%start measuring the reaction time
 
tic
pause
 
% RT is computed from question to reaction whatever answer is correct or
%incorrect
 
reactionTime = toc;
cla
 
% save the button that was pressed
button = lower(get(gcf, 'CurrentCharacter'));
if ~ismember(button,{'y','n'})
    show_text({'You pressed a wrong key, only y and n are allowed'
               'Press any key to start the next trial'})
end

hit = 0;
correct = 0;
if target == 1 && strcmp(button, 'y')
    correct = 1;
    hit = 1;
elseif target == 0 && strcmp(button, 'n')
    correct = 1;  
end
end

