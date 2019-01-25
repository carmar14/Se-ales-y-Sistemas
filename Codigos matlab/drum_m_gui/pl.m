function pl
global M recs h_np h_tp ns Fs

rp=str2num(get(h_np,'string')); % number of loops
tp=str2num(get(h_tp,'string')); % tempo

bpms=tp/60;

T1=1/bpms;
T1i=round(T1*Fs);

T4=1/bpms/4;
T4i=round(T4*Fs);

snsL=zeros(ns,1); % sounds lenght
for yc=1:ns
    snsL(yc)=length(recs{yc});
end

LL0=rp*4*T4i;
LD=max(snsL); % maximal length
LL=LL0+LD+1;
dd=zeros(LL,1);
lc=1;
for ind=1:T4i:LL0
    lc0=mod((lc-1),16)+1;
    M0=M(:,lc0);
    i1=1+(lc-1)*T4i;
    for yc=1:ns
        if M0(yc)
            i2=i1+snsL(yc)-1;
            dd(i1:i2)=dd(i1:i2)+recs{yc}';
        end
    end
    lc=lc+1;
end
soundsc(dd,Fs);

