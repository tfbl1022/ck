clf
y0=0;v0=28;g=9.81;
x=0:5:80;
theta0=15*pi/180;
y1=tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x.^2+y0;
theta0=30*pi/180;
y2=tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x.^2+y0;
theta0=45*pi/180;
y3=tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x.^2+y0;
theta0=60*pi/180;
y4=tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x.^2+y0;
theta0=75*pi/180;
y5=tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x.^2+y0;
y=[y1' y2' y3' y4' y5'];
plot(x,y);axis([0 80 0 40])
legend('WitWtheta_0 = 15^o','WitWtheta_0 = 30^o',...
    'WitWtheta_0 = 45^o','WitWtheta_0 = 60^o','WitWtheta_0 = 75^o')

