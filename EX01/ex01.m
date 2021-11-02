clear;
x = 0:2*pi/1000:2*pi;
y1 = cos(x).*(5+8*sin(x))+x*exp(-1);
subplot(2,1,1);
plot(x,y1);
xlabel('x');
ylabel('y');

x2 = -3:0.01:3;
y2 = cos(x2).*(5+8*sin(x2))+x2*exp(-1);
subplot(2,1,2);
plot(x2,y2);
xlabel('x');
ylabel('y');
