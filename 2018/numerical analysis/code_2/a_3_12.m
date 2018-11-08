for i=2:ni+1
    t(i)=t(i-1)+(tend-tstart)/ni;
    y(i)=12 + 6*cos(2*pi*t(i)/ ...
        (tend-tstart));
end

t=tstart:(tend-tstart)/ni:tend
y=12+6*cos(2*pi*tt/(tend-tstart))