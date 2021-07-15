x = linspace(-5,5);
y = -(1-x.^2).*exp(-x.^2/2)/sqrt(2*pi);
figure
plot(x,y)
grid on

g10 = exp(-x.^2/2)/sqrt(2*pi);
g12 = exp(-x.^2/2/1.2^2)/sqrt(2*pi)/1.2;
dog1 = (g12-g10)/0.2;

g14 = exp(-x.^2/2/1.4^2)/sqrt(2*pi)/1.4;
dog2 = (g14-g10)/0.4;

g16 = exp(-x.^2/2/1.6^2)/sqrt(2*pi)/1.6;
dog3 = (g16-g10)/0.6;

g18 = exp(-x.^2/2/1.8^2)/sqrt(2*pi)/1.8;
dog4 = (g18-g10)/0.8;

g20 = exp(-x.^2/2/2^2)/sqrt(2*pi)/2;
dog5 = (g20-g10)/1;

figure
plot(x,y,x,dog1,x,dog2,x,dog3,x,dog4,x,dog5)
grid on
legend('derivative','k=1.2','k=1.4','k=1.6','k=1.8','k=2')