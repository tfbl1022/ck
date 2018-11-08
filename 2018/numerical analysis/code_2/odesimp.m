function yend = odesimp(dydt, dt, ti, tf, yi, varargin)
% odesimp: Euler ode solver
% yend = odesimp(dydt, dt, ti, tf, yi, varargin):
% Euler's method solution of a single ode
% input:
% dydt = function defining ode
% dt = time step
% ti = initial time
% tf = final time
% yi = initial value of dependent variable
% output:
% yend = dependent variable at final time
t = ti; y = yi; h = dt;
while (1)
if t + dt > tf, h = tf - t; end
y = y + dydt(y,varargin{:}) * h;
t = t + h;
if t >= tf, break, end
end
yend = y;