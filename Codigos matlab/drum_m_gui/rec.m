function rec(yc)
global rec_h recs Fs r
h=rec_h(yc);
if get(h,'value')
    % start recodring
    r = audiorecorder(Fs, 16, 1);
    record(r); % record data
else
    % stop recording
    stop(r);
    s = getaudiodata(r); % get data
    s=s-mean(s);
    recs{yc}=s';
end




