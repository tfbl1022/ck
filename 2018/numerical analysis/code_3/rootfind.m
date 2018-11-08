function [x, ea] = rootfind(a, x0, es)
switch nargin
    case 2
        es = 1 * 10^(-5);
    case 1
        x = a/2;
        es = 1 * 10^(-5);
    case 0
        error('must enter a')
end

comp = 1;
if a ~= 0
    if a < 0
        a = -a;
        comp = j;
    end
    
while(1) 
x_old = x;
x = (x_old+a/x_old)/2;
ea = abs((x-x_old)/x);
if ea <= es, break, end
end
else
    x = 0;
end
x = x*comp;
ea =abs((x-x_old)/x);
end