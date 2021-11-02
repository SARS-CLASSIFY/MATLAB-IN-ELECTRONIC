clear;
a1 = 0;
a2 = pi/6;
a3 = pi/3;
a4 = pi/2;
t = -20*pi:20*pi;
x1 = cos(t+a1);
x2 = cos(t+a2);
x3 = cos(t+a3);
x4 = cos(t+a4);
y = sin(2*t);
subplot(4,1,1);
plot(x1,y);
xlabel('x1');
ylabel('y');

subplot(4,1,2);
plot(x2,y);
xlabel('x2');
ylabel('y');

subplot(4,1,3);
plot(x3,y);
xlabel('x3');
ylabel('y');

subplot(4,1,4);
plot(x4,y);
xlabel('x4');
ylabel('y');
