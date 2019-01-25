function Vowel_Synthesis_GUI25
% Modifiable runGUI file
clc;
clear all;

% USER - ENTER FILENAME
fileName = 'Vowel_Synthesis.mat';    
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

% USER - ENTER PROPER CALLBACK FILE
Callbacks_Vowel_Synthesis_GUI25(f,temp);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI Lite 2.5 for vowel synthesis
% 2 Panels
%   #1 - data/parameters
%   #2 - graphics
% 8 Graphic Panels
%   #1 - pitch period contour
%   #2 - pitch excitation signal
%   #3 - glottal pulse
%   #4 - vowel impulse response
%   #5 - vowel frequency response
%   #6 - vowel waveform
%   #7 - vowel log frequency response
%   #8 - vowel linear frequency response
% 1 TitleBox
% 7 Buttons
%   #1 - popupmenu - vowel sound
%   #2 - editable button - fs: processing sampling rate
%   #3 - editable button - PF_Beg: beginning pitch frequency
%   #4 - editable button - PF_End: ending pitch frequency
%   #5 - editable button - Rm: analysis frame shift in msec
%   #6 - pushbutton - Run Vowel Synthesis
%   #7 - pushbutton - Close GUI