function save_clb
global M recs h_tp h_np

rp=str2num(get(h_np,'string')); % number of loops
tp=str2num(get(h_tp,'string')); % tempo


[FileName,PathName] = uiputfile('*.mat','Save as..');
if FileName~=0
    fln=[PathName FileName];
    save(fln,'M','recs','rp','tp');
end
