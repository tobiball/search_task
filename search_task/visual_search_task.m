%% enter subject id
subject_id = input('Subject number: ','s');

%% user communication config
intro = {
         'Welcome to this behavioural experiment!'
         'In the following you will be shown figures containing symbols'
         'with different colours and shapes.'
         ''
         'You are supposed to identify, if there is a unique symbol (target).'
         ''
         'Press ''y'' if you see a target and ''n'' if the target is absent.'
         ''
         'Please try to be precise and fast!'
         ''
         'You will start with some practice runs.'
         'Unlike in the experiment you will know, if you were correct here.'
         ''
         'You will be informed once the real experiment starts.'
         ''
         'Whenever there is instructions on the screen,'
         'press any key to continue.'
         };
experiment_start = {
                    'The experiment starts now!'
                    };
breaking = {
            'Please take a short break of between 1 - 5 minutes.'
            ''
            'When you are ready to continue press any key.'
            };
warning = {
            'Looks like you got some trials wrong'
            ''
            'Remember to press ''y'' when you see a target and ''n'' when not'
            };
outro = {
         'The experiment has now ended.'
         ''
         'Thank you for your contribution to science :)'
         };

%% figure config
fig = figure('units','normalized','outerposition',[0 0 1 1],'Name','VISUAL SEARCH TASK','NumberTitle','off');
set(gca,'visible','off');
set(fig, 'MenuBar', 'none');
set(fig, 'ToolBar', 'none');

%% structure config
data_size = 600;
data(data_size) = struct();

%% intro and practice
show_text(intro);
correctnes = 0;   
%practice trials
for ntest = 1:50
    [n, cond, target] = rnd_config;
    [time, correct, answer] = do_experiment(n, cond, target);
    if correct
        show_text('Correct')
        correctnes = correctnes + 1;
    else
        show_text('Inocorrect')
    end
    if ntest >= 10 && correctnes/ntest > 0.7
        break
    end
end

%% experiment
ns_correct = zeros(3,4);
break_count = 0;
warning_count = 0;
warning_flag = 1;
stop_flag = 0;
show_text(experiment_start);
for nTrial = 1:608
    if break_count > 70                %user break
        break_count = 0;
        tic;
        show_text(breaking);
        break_time = toc;        %measures when break is over
        data(nTrial).subject_id = subject_id;
        data(nTrial).trial_id = nTrial;
        data(nTrial).condition = 'break';
        data(nTrial).time = break_time;
    else                         %trial
        [n, cond, target, nd, cd] = rnd_config;
        [time, correct, answer, hit] = do_experiment(n, cond, target);
        data(nTrial).subject_id = subject_id;
        data(nTrial).trial_id = nTrial;
        data(nTrial).condition = cond;
        data(nTrial).set_size = n;
        data(nTrial).target = target;
        data(nTrial).answer = answer;
        data(nTrial).correct = correct;
        data(nTrial).hit = hit;
        data(nTrial).time = time;
        break_count = break_count + 1;
    if warning_flag == 1
        warning_count = warning_count + 1;
        if warning_count == 51
            warning_count = 1;
        end
        warning_vector(warning_count) = correct;
        if length(warning_vector) == 50 && sum(warning_vector)/50 < 0.7
            show_text(warning)
            warning_flag = 0;
        end
    end
    if hit
        ns_correct(cd,nd) = ns_correct(cd,nd)+1;
        for cn = 1:12              %This loop checks if all conditions have 20 hit trials yet and sets a break
            if ns_correct(cn) >= 20
                stop_flag = 1;    %flag when the limit is reached
            else
                stop_flag = 0;
                break
            end
        end
    end
    end
if stop_flag == 1
    break
end
end

%% Save
file_name = strcat(subject_id, '_.mat');
save (file_name, 'data')
show_text(outro)
close