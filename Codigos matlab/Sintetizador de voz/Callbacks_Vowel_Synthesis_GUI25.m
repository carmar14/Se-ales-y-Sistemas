function Callbacks_Vowel_Synthesis_GUI25(f,C)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=C{1,1};
y=C{1,2};
a=C{1,3};
b=C{1,4};
u=C{1,5};
v=C{1,6};
m=C{1,7};
n=C{1,8};
lengthbutton=C{1,9};
widthbutton=C{1,10};
enterType=C{1,11};
enterString=C{1,12};
enterLabel=C{1,13};
noPanels=C{1,14};
noGraphicPanels=C{1,15};
noButtons=C{1,16};
labelDist=C{1,17};%distance that the label is below the button
noTitles=C{1,18};
buttonTextSize=C{1,19};
labelTextSize=C{1,20};
textboxFont=C{1,21};
textboxString=C{1,22};
textboxWeight=C{1,23};
textboxAngle=C{1,24};
labelHeight=C{1,25};
fileName=C{1,26};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %PANELS
% for j=0:noPanels-1
% uipanel('Parent',f,...
% 'Units','Normalized',...
% 'Position',[x(1+4*j) y(1+4*j) x(2+4*j)-x(1+4*j) y(3+4*j)-y(2+4*j)]);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAPHIC PANELS
for i=0:noGraphicPanels-1
switch (i+1)
case 1
graphicPanel1 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 2
graphicPanel2 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 3
graphicPanel3 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 4
graphicPanel4 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 5
graphicPanel5 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 6
graphicPanel6 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 7
graphicPanel7 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 8
graphicPanel8 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE BOXES
for k=0:noTitles-1
switch (k+1)
case 1
titleBox1 = uicontrol('parent',f,...
'Units','Normalized',...
'Position',[u(1+4*k) v(1+4*k) u(2+4*k)-u(1+4*k) v(3+4*k)-v(2+4*k)],...
'Style','text',...
'FontSize',textboxFont{k+1},...
'String',textboxString(k+1),...
'FontWeight',textboxWeight{k+1},...
'FontAngle',textboxAngle{k+1});
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BUTTONS
for i=0:(noButtons-1)
enterColor='w';
if strcmp(enterType{i+1},'pushbutton')==1 ||strcmp(enterType{i+1},'text')==1
enterColor='default';
end
if (strcmp(enterLabel{1,(i+1)},'')==0 &&...
        strcmp(enterLabel{1,(i+1)},'...')==0) %i.e. there is a label
%creating a label for some buttons
uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i)-labelDist-labelHeight(i+1) ...
(m(2+2*i)-m(1+2*i)) labelHeight(i+1)],...
'Style','text',...
'String',enterLabel{i+1},...
'FontSize', labelTextSize(i+1),...
'HorizontalAlignment','center');
end
switch (i+1)
case 1
button1=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button1Callback);
case 2
button2=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button2Callback);
case 3
button3=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button3Callback);
case 4
button4=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button4Callback);
case 5
button5=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button5Callback);
case 6
button6=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button6Callback);
case 7
button7=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button7Callback);
case 8
button8=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button8Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    fs=10000;
    fsr=10000;
    nfft=2048;
    pd=100.5;
    ivowel=1;
    nsamp=2000;
    R=100;
    Rm=10;
    PF_Beg=100;
    PP_Beg=100;
    PF_End=150;
    PP_End=67;
    nfrm=100;
    y2=[];

% Name the GUI
    set(f,'Name','vowel_synthesis');

% CALLBACKS
% Callback for button1 -- ivowel: vowel index for 10 vowels
 function button1Callback(h,eventdata)
     
     ivowel=get(button1,'val');
 end

% Callback for button2 -- fs: signal sampling rate
 function button2Callback(h,eventdata)
     %fs=str2num(get(button2,'string'));
     Index=get(button2,'val');
     a = [6000 8000 10000 16000 20000];
     fs = a(Index); 
 end

% Callback for button3 -- PF_Beg: initial pitch (Hz)
 function button3Callback(h,eventdata)
     PF_Beg=str2num(get(button3,'string'));
     if (PF_Beg < 80 || PF_Beg > 500)
         waitfor(errordlg('The initial pitch must be between 80 and 500'));
         return;
     end
     PP_Beg=round(fs/PF_Beg);
 end

% Callback for button4 -- PF_End: final pitch (Hz)
 function button4Callback(h,eventdata)
     PF_End=str2num(get(button4,'string'));
     if (PF_End < 80 || PF_End > 500)
         waitfor(errordlg('The final pitch must be between 80 and 500'));
         return;
     end
     PP_End=round(fs/PF_End);
 end

% Callback for button5 -- Rm: frame shift in msec
 function button5Callback(h,eventdata)
     Rm=str2num(get(button5,'string'));
     if (Rm < 1 || Rm > 100)
         waitfor(errordlg('The frame shift must be between 1 and 100'));
         return;
     end
     R=round(Rm*fs/1000);
 end

% Callback for button6 -- run vowel synthesis
 function button6Callback(h,eventdata)
     
% check editable buttons for changes
    button1Callback(h,eventdata);
    button2Callback(h,eventdata);
    button3Callback(h,eventdata);
    button4Callback(h,eventdata);
    button5Callback(h,eventdata);
    
% create array of pitch periods
    PP(1:nfrm)=round(PP_Beg+(PP_End-PP_Beg).*(0:nfrm-1)/(nfrm-1));
    
% clear graphics Panel 3
    reset(graphicPanel3);axes(graphicPanel3);cla;
    
% plot designated pitch period contour on graphics Panel 3
    plot(1:nfrm,PP,'k','LineWidth',2);xlabel('Frame Number');
    ylabel('Pitch Period (Samples)'),grid on;axis tight;
    legend('pitch period contour');
    
% create pitch pulse contour
    e=zeros(nfrm*R,1);
    e(1)=1;
    esav=1;
    Rind=R;
    for i=1:nfrm;
        while (esav+PP(i) < Rind)
            e(esav+PP(i))=1;
            esav=esav+PP(i);
        end
        Rind=Rind+R;
    end
        
% clear graphics Panel 8
    reset(graphicPanel8);axes(graphicPanel8);cla;
    
% plot excitation function for synthetic vowel in graphics Panel 8
    plot(0:round(length(e)/2),e(1:round(length(e)/2)+1),'k','LineWidth',2);
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp);ylabel('Value');grid on;axis tight;
    legend('pitch excitation signal');

% create glottal pulse
    alpha1=0.25;
    alpha2=0.10;
    period=10*fs/1000;
    
% form rosenberg pulse
    n1=round(period*alpha1);
    n2=round(period*alpha2);
    g=[];
    x1=0:n1;
    g=[g 0.5*(1-cos(pi*x1/n1))];
    x2=1:n2;
    g=[g cos(pi*x2/(2*n2))];
    g=[g zeros(1,period-length(g))];
    
% clear graphics Panel 2
    reset(graphicPanel2);axes(graphicPanel2);cla;
    
% plot glottal pulse in graphics Panel 2
    plot(0:period-1,g,'k','LineWidth',2);xlabel(xpp);
    ylabel('Value');grid on;axis tight;legend('glottal pulse');

% read in vowel formants and bandwidth choices for set of 10 vowels
% mat file vowels_fmts_bw.mat loads list of vowel names, vowels(10,2),
% formants (10,3), and bandwidths (1,4)
    str=load('vowels_fmts_bw.mat');
    bandwidths=str.bandwidths;
    formants=str.formants;
    vowels=str.vowels;
    
% generate selected vowel impulse response using 3 formants (fourth fixed
% at 4000 Hz), and 4 bandwidths; impulse response generated by using an
% impulse at the input of the first of 4 second-order systems, with the
% output of each system being used to excite the next second-order system
    xin=[1 zeros(1,nfft/2-1)];
    for resonance=1:4
        if (resonance < 4)
            f=formants(ivowel,resonance);
        else
            f=4000;
        end
        bw=bandwidths(1,resonance);
        num=1-2*exp(-bw*2*pi/fs)*cos(2*pi*f/fs)+exp(-2*bw*2*pi/fs);
        den=[1 -2*exp(-bw*2*pi/fs)*cos(2*pi*f/fs) exp(-2*bw*2*pi/fs)];
        yout=filter(num,den,xin);
        xin=yout;
    end
    
% clear graphics Panel 7
    reset(graphicPanel7);axes(graphicPanel7);cla;
    
% plot vowel impulse response on graphics Panel 7
    plot(0:199,xin(1:200),'k');xlabel(xpp);
    ylabel('Value');grid on;axis tight;legend('vowel impulse response');
    YOUT=fft(yout,nfft);
    YOUTL=20*log10(abs(YOUT));
    
% clear graphics Panel 6
    reset(graphicPanel6);axes(graphicPanel6);cla;
    
% plot vowel log magnitude spectrum in graphics Panel 6
    plot(0:fs/nfft:fs/2,YOUTL(1:nfft/2+1),'k','LineWidth',2);
    xlabel('Frequency');ylabel('Log Magnitude (dB)');grid on; axis tight;
    legend('vowel log magnitude response');
    
% convolve vowel response with glottal pulse and then with pitch excitation
    y1=conv(xin,g);
    y2=conv(y1,e);
    
% clear graphics Panel 1
    reset(graphicPanel1);axes(graphicPanel1);cla;
    
% plot pitch-excited vowel time response in graphics Panel 1
    plot(0:499,y2(1:500),'k','LineWidth',2);xlabel(xpp);
    ylabel('Value');grid on;axis tight;legend('convolved vowel sequence');
        
% plot linear and log magnitude spectrums
    clear Y2 Y2A  Y2L;
    Y2=fft(y2(1:500),nfft);
    Y2A=abs(Y2);
    Y2L=20*log10(Y2A);
    
% clear graphics Panel 4
    reset(graphicPanel4);axes(graphicPanel4);cla;
    
% plot pitch-excited vowel frequency response on a linear scale in graphics
% Panel 4
    plot(0:fs/nfft:fs/2,Y2A(1:nfft/2+1),'k','LineWidth',2);grid on;
    xlabel('Frequency'),ylabel('Linear Magnitude');
    axis tight;legend('convolved vowel linear frequency response');
    
% clear graphics Panel 5
    reset(graphicPanel5);axes(graphicPanel5);cla;
    
% plot pitch-excited vowel frequency response on a log magnitude scale in
% graphics Panel 5
    plot(0:fs/nfft:fs/2,Y2L(1:nfft/2+1),'k','LineWidth',2);
    xlabel('Frequency'),ylabel('Log Magnitude');grid on; axis tight;
    legend('convolved vowel log frequency response');

% display vowel name and vowel parameters is titleBox1
stitle=sprintf(' vowel:%s, PP_Beg: %4.1f, PP_End: %4.1f, formants: %d %d %d',...
        vowels(ivowel,:),PP_Beg,PP_End,formants(ivowel,1:3));
        stitle1=strcat('Vowel Synthesis -- ',stitle);
        set(titleBox1,'string',stitle1);
        set(titleBox1,'FontSize',20);   
 end

% Callback for button8 -- Play Synthetic Vowel
    function button8Callback(h,eventdata)
% play out convolved sequence
    soundsc(y2,fs);
    end

% Callback for button7 -- close GUI
 function button7Callback(h,eventdata)
     fclose('all');
     close(gcf);
 end
end