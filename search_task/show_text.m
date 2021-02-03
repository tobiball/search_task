function [] = show_text(txt)
%INPUT string to pe displayed
%Displays input text and pauses script
txt_dsp = text(0,0.6,txt,'FontSize',30);
pause
set(txt_dsp, 'Visible', 'off')
end

