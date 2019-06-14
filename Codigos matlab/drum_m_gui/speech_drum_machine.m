global seq_but_h  M
global bcl1 bcl2 bcl1i bcl2i
global rec_h recs Fs r h_np h_tp ns sL

Fs=44100; % sampling frequency
dt=1/Fs;

ns=5; % number of sounds

sL=16; % sequensor length

dx1=0.14; % shift for rec buttons

dx2=0.3; % shift for sequncer burtoons 
dx20=0.04; % shift between sequncer burtoons 

hints={'say d';
       'say sh';
       'say c';
       'say u';
       'say u higher'};
   
hf=figure;
set(hf,'units','normalized','position',[0.1 0.2 0.8 0.6]);
fcl=get(hf,'color');

dy=(1/ns)*0.65;

y0=0.9;

y=y0;
x0=0.02;
x=x0;
h = uicontrol('Style', 'text', 'String', 'hints:',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x y 0.1 0.05]);

h = uicontrol('Style', 'text', 'String', 'recording',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x+dx1 y 0.1 0.05]);

h = uicontrol('Style', 'text', 'String', 'sequencer',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x+0.5 y 0.1 0.05]);


y=y-1.3*dy;


bcl1=[0.6 0.1 0.1];
bcl2=[0.1 0.1 0.6];

bcl1i=[1 0.6 0.6];
bcl2i=[0.6 0.6 1];

seq_but_h=zeros(ns,sL); % sequencer buttons handles
M=zeros(ns,sL); % state matrix

rec_h=zeros(ns,1); % handels for rec buttons
recs=mat2cell(zeros(ns,1),ones(ns,1),1); % records, empty 1-element sounds
r=NaN; % here will be recorder handle

for yc=1:ns
    
    h = uicontrol('Style', 'text', 'String', hints{yc},...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x y 0.1 0.05]);

    rec_h(yc) = uicontrol('Style', 'togglebutton', 'String', 'rec',...
    'units','normalized',...
    'Callback',['rec(' num2str(yc) ')'],...
    'BackgroundColor',[0.85 0.85 0.85],...
    'Position', [x+dx1 y 0.1 0.05]);

    x2=x;
    for sc=1:sL
        if mod(floor((sc-1)/4),2)==0
            bcl=bcl1;
        else
            bcl=bcl2;
        end
            
        seq_but_h(yc,sc) = uicontrol('Style', 'togglebutton', 'String', ' ',...
        'units','normalized',...
        'BackgroundColor',bcl,...
        'Callback',['seq_but_clb(' num2str(yc) ',' num2str(sc) ');' ],...
        'Position', [x2+dx2 y 0.03 0.05]);
        x2=x2+dx20;
    end


    y=y-dy;
end

y=y-0.2*dy;

x=x0+0.02;

h = uicontrol('Style', 'pushbutton', 'String', 'save',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Callback','save_clb',...
    'Position', [x y 0.1 0.05]);

x=x+0.12;

h = uicontrol('Style', 'pushbutton', 'String', 'load',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Callback','load_clb',...
    'Position', [x y 0.1 0.05]);

x=x+0.12;

h = uicontrol('Style', 'text', 'String', 'tempo:',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x y 0.1 0.05]);

x=x+0.09;

h_tp = uicontrol('Style', 'edit', 'String', '125',...
    'units','normalized',...
    'Position', [x y 0.1 0.05]);


x=x+0.14;

h = uicontrol('Style', 'text', 'String', 'number of loops to play:',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x y 0.22 0.05]);

x=x+0.2;

h_np = uicontrol('Style', 'edit', 'String', '4',...
    'units','normalized',...
    'Position', [x y 0.1 0.05]);

x=x+0.18;

h = uicontrol('Style', 'pushbutton', 'String', 'play',...
    'units','normalized',...
    'Callback','pl',...
    'Position', [x y 0.1 0.05]);


