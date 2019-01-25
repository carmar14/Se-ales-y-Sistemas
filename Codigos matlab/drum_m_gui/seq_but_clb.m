function seq_but_clb(yc,sc)
global seq_but_h   M
global bcl1 bcl2 bcl1i bcl2i

h=seq_but_h(yc,sc);

if get(h,'value')
    M(yc,sc)=1;
    if mod(floor((sc-1)/4),2)==0
        bcl=bcl1i;
    else
        bcl=bcl2i;
    end
    set(h,'BackgroundColor',bcl);
else
    M(yc,sc)=0;
    if mod(floor((sc-1)/4),2)==0
        bcl=bcl1;
    else
        bcl=bcl2;
    end
    set(h,'BackgroundColor',bcl);
end
