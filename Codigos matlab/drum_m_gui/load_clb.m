function load_clb
global M recs h_tp h_np ns sL seq_but_h
global bcl1 bcl2 bcl1i bcl2i

% rp=str2num(get(h_np,'string')); % number of loops
% tp=str2num(get(h_tp,'string')); % tempo


[FileName,PathName] = uigetfile('*.mat','Save as..');
if FileName~=0
    fln=[PathName FileName];
    load(fln);
    
    set(h_np,'string',num2str(rp));
    set(h_tp,'string',num2str(tp));
    
    
    for yc=1:ns
        for sc=1:sL
            M00=M(yc,sc);
            h=seq_but_h(yc,sc);
            if M00
                if mod(floor((sc-1)/4),2)==0
                    bcl=bcl1i;
                else
                    bcl=bcl2i;
                end
                set(h,'BackgroundColor',bcl);
            else
                if mod(floor((sc-1)/4),2)==0
                    bcl=bcl1;
                else
                    bcl=bcl2;
                end
                set(h,'BackgroundColor',bcl);
            end
        end
    end

end
