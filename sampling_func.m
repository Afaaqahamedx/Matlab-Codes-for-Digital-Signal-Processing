%To Demonstrate sampling theorm
f=2;
fs1=1.2*f;
fs2=2*f;
fs3=8*f;
t=0:0.01:3;
t1=0:1/fs1:3;
t2=0:1/fs2:3;
t3=0:1/fs3:3;
x=sin(2*pi*f*t);
subplot(2,2,1);
plot(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Continuous sine wave');

%Under sampling
% for fs<2fm
y1=sin(2*pi*f*t1);
subplot(2,2,2);
stem(t1,y1);
hold on
plot(t1,y1)
xlabel('Time');
ylabel('Amplitude');
title('Sampled output fs<2fm');
hold off

%Critical sampling    for fs=2fm
y2=sin(2*pi*f*t2);
subplot(2,2,3);
stem(t2,y2);
hold on
plot(t2,y2);
xlabel('Time');
ylabel('Amplitude');
title('Sampled output fs=2fm');
hold off

%Over sampling   for fs>2fm
y3=sin(2*pi*f*t3);
subplot(2,2,4);
stem(t3,y3);
hold on
plot(t3,y3);
xlabel('Time');
ylabel('Amplitude');
title('Sampled output fs>2fm');
hold off