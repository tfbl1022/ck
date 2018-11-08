format short g
a=2; b=5;
x=linspace(0,pi/2,21);
y=b*exp(-a*x).*sin(b*x).*(0.012*x.^4-0.15*x.^3+0.075*x.^2+2.5*x);
z=y.^2;
w=[x' y' z']
plot(x,y,'-.pr','LineWidth',1.5,'MarkerSize',14,...
    'MarkerEdgeColor','r','MarkerFaceColor','w')

hold on
plot(x,z,'-sb','MarkerFaceColor','g')
xlabel('x');ylabel('y,z'); legend('y','z')
hold off