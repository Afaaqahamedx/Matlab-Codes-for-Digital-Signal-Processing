t = (-1: .01 : 1)';
impulse = t == 0;
unitStep = t >= 0;
ramp = t .* unitStep;
exponential_inc = exp(1 * t);
exponential_dec = exp(-1 * t);

% Impulse unitStep Ramp
plot(t,[impulse unitStep ramp],"LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
legend("Impulse","Unit step","Ramp")
hold off

% Exponential 
plot(t,exponential_inc,"LineWidth",3)
hold on
plot(t,exponential_dec,"LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
legend("Rise","Fall")
hold off

% Sinc And sa
x = linspace(-5,5); 
sc = sinc(x);
sa = sin(x) ./ x;
plot(x,sc,"k-","LineWidth",3)
hold on
plot(x,sa,"r-","LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
legend("sinc","sa")
hold off
grid on

% Rectangular pulse
fs = 1000;
T = 10*(1/50);
t = -0.1:.01:T-1/fs;
w = 20e-3;
x = rectpuls(t,w);
plot(t,x,"LineWidth",3)
xlabel("Time")
ylabel("Amplitude")
title("Rectangular")
grid on

%Triangle 
t = (0:0.001:0.4);
f = 10;
plot(t,sawtooth(2 * pi * f * t,1/2),"k-","LineWidth",3)
xlabel("Time");
ylabel("Amplitude");