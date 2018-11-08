function fr = funcrange(f,a,b,n,varargin)
% funcrange: function range and plot
% fr=funcrange(f,a,b,n,varargin): computes difference
% between maximum and minimum value of function over
% a range. In addition, generates a plot of the function.
% input:
% f = function to be evaluated
% a = lower bound of range
% b = upper bound of range
% n = number of intervals
% output:
% fr = maximum - minimum
x = linspace(a,b,n);
y = f(x,varargin{:});
fr = max(y)-min(y);
fplot(f,[a b],varargin{:})
end