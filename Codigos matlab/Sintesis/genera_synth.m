function y = genera_synth (vco_type, vco_fr, vco_amp, vco_dur, vcf_fl, vcf_fh, vcf_b, vca_att, vca_sus,vca_ate, vca_dec, vca_rel, lfo1_on, lfo1_type, lfo1_fr, lfo1_amp, lfo2_on, lfo2_type, lfo2_fr, lfo3_on, lfo3_type, lfo3_fr, lfo3_amp)

%Frecuencia de muestreo
fs = 44100; 
inct = 1/fs;
fd = 50;
%Vector de tiempo
tfin = vco_dur;
N=tfin/inct;
t=[0:1/fs:tfin];


%% VCA

%vca_ate es el valor hasta el que decae PONER EN GUIDE
long = vca_att+vca_dec+vca_sus+vca_rel;

if long == tfin
 vca = VCA_gen(fs,tfin, vca_att, vca_dec, vca_ate , vca_sus, vca_rel);
else
 vca = ones(1,length(t));
end 


%% LFO 1 (VCO)

if lfo1_on == 1
  
   if lfo1_type == 1        %seno
     lfo1 = lfo1_amp*sin(2*pi*t*lfo1_fr);
   elseif lfo1_type == 2    %triangular  
     lfo1 = lfo1_amp*sawtooth(2*pi*t*lfo1_fr, 0.5);
   elseif lfo1_type == 3    %cuadrada 
     lfo1 = lfo1_amp*square(2*pi*t*lfo1_fr);
   elseif lfo1_type == 4    %diente sierra 
     lfo1 = lfo1_amp*sawtooth(2*pi*t*lfo1_fr, 0);
   elseif lfo1_type == 5    %diente sierra invertido 
     lfo1 = lfo1_amp*sawtooth(2*pi*t*lfo1_fr, 1);   
   end; 
    
end

%% VCO
if vco_type == 1        %seno
    vco_g = vco_amp*sin(2*pi*t*vco_fr);
    if lfo1_on == 1
    
        lfo1_n=lfo1./(max(abs(lfo1)));
        vco_y=vco_amp*sin((2*pi*vco_fr*t)+(2*pi*fd*(cumsum(lfo1_n*inct))));
        
    else 
        vco_y = vco_g;
    end    
    
elseif vco_type == 2    %triangular  
    vco_g = vco_amp*sawtooth(2*pi*t*vco_fr, 0.5);
    if lfo1_on == 1
        
        lfo1_n=lfo1./(max(abs(lfo1)));
        vco_y=vco_amp*sawtooth(((2*pi*vco_fr*t)+(2*pi*fd*(cumsum(lfo1_n*inct)))), 0.5);
        
    else 
        vco_y = vco_g;
    end    
   
elseif vco_type == 3    %cuadrada 
    vco_g = vco_amp*square(2*pi*t*vco_fr);
    if lfo1_on == 1
        
        lfo1_n=lfo1./(max(abs(lfo1)));
        vco_y=vco_amp*square((2*pi*vco_fr*t)+(2*pi*fd*(cumsum(lfo1_n*inct))));
        
    else 
        vco_y = vco_g;
    end    
        
elseif vco_type == 4    %diente sierra 
    vco_g = vco_amp*sawtooth(2*pi*t*vco_fr, 0);
    if lfo1_on == 1
        
        lfo1_n=lfo1./(max(abs(lfo1)));
        vco_y=vco_amp*sawtooth(((2*pi*vco_fr*t)+(2*pi*fd*(cumsum(lfo1_n*inct)))), 0);
        
    else 
        vco_y = vco_g;
    end    
    
elseif vco_type == 5    %diente sierra invertido 
    vco_g = vco_amp*sawtooth(2*pi*t*vco_fr, 1);
    if lfo1_on == 1
        
        lfo1_n=lfo1./(max(abs(lfo1)));
        vco_y=vco_amp*sawtooth(((2*pi*vco_fr*t)+(2*pi*fd*(cumsum(lfo1_n*inct)))), 1);
        
    else 
        vco_y = vco_g;
    end    
end;

figure
plot(t,vco_y, 'g');
title('VCO');
xlabel('Tiempo (seg.)');
ylabel('Amplitud');

%% LFO 2 (VCF)

if lfo2_on == 1
  
   if lfo2_type == 1        %seno
     lfo2 = sin(2*pi*t*lfo2_fr);
   elseif lfo2_type == 2    %triangular  
     lfo2 = sawtooth(2*pi*t*lfo2_fr, 0.5);
   elseif lfo2_type == 3    %cuadrada 
     lfo2 = square(2*pi*t*lfo2_fr);
   elseif lfo2_type == 4    %diente sierra 
     lfo2 = sawtooth(2*pi*t*lfo2_fr, 0);
   elseif lfo2_type == 5    %diente sierra invertido 
     lfo2 = sawtooth(2*pi*t*lfo2_fr, 1);   
   end; 
   
   vcf_y = vcf_gen (vco_y , lfo2 , vcf_fl , vcf_fh , vcf_b , fs);
   
else  
 
   lfo2 = ones(1,length(t)); 
   %Se filtra la señal por VCF sin que se modifique con el LFO2 
   vcf_y = vcf_gen (vco_y , lfo2 , vcf_fl , vcf_fh , vcf_b , fs);

    

end

w = [0:(2*pi)/N:pi];
w = w(1:end-1);

vcf_yf = fft(vcf_y);

figure 
subplot(2,1,1), plot(t,vcf_y,'r');
title('SEÑAL A LA SALIDA DEL VCF');
xlabel('Tiempo (seg.)');
ylabel('Amplitud');

vcf_grafica_f = 10*log10(vcf_yf);

subplot(2,1,2), plot(w,vcf_grafica_f(1:end/2));
set(gca,'XTick',-pi:pi/4:pi)
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi'})
title('SEÑAL A LA SALIDA DEL VCF');
xlabel('w');
ylabel('Amplitud (dB)');


%% LFO 3 (VCA)

if lfo3_on == 1
  
   if lfo3_type == 1        %seno
     lfo3 = (1-lfo3_amp)*sin(2*pi*t*lfo3_fr);
   elseif lfo3_type == 2    %triangular  
     lfo3 = (1-lfo3_amp)*sawtooth(2*pi*t*lfo3_fr, 0.5);
   elseif lfo3_type == 3    %cuadrada 
     lfo3 = (1-lfo3_amp)*square(2*pi*t*lfo3_fr);
   elseif lfo3_type == 4    %diente sierra 
     lfo3 = (1-lfo3_amp)*sawtooth(2*pi*t*lfo3_fr, 0);
   elseif lfo3_type == 5    %diente sierra invertido 
     lfo3 = (1-lfo3_amp)*sawtooth(2*pi*t*lfo3_fr, 1);   
   end;  
   
   y = vca.*lfo3.*vcf_y;
   
else    
   lfo3 = ones(1,length(t)); 
   y = vca.*vcf_y;
end    

%% PLAY

% figure
% plot(t,vca);
% title('VCA');
% xlabel('Tiempo (seg.)');
% ylabel('Amplitud');

yf = fft(y);

figure
subplot(2,1,1), plot(t,y);
title('SALIDA');
xlabel('Tiempo (seg.)');
ylabel('Amplitud');

yf = 10*log10(yf);

subplot(2,1,2), plot(w,yf(1:end/2));
set(gca,'XTick',-pi:pi/4:pi)
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi'})
title('SEÑAL Y(f)');
xlabel('w');
ylabel('Amplitud (dB)');

   
