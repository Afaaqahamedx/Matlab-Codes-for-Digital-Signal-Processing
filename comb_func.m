%dt comb
stem(ones(1,10), 'LineWidth', 2)
xlabel("Time");
ylabel("Amplitude");

t = (-1: .1 : 1)';
impulse = t == 0;
unitStep = t >= 0;
ramp = t .* unitStep;
exponential_inc = exp(1 * t);
exponential_dec = exp(-1 * t);
xlabel("Time");
ylabel("Amplitude");

% Impulse unitStep Ramp
stem(t,[impulse unitStep ramp],"LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
hold off

% Exponential 
stem(t,exponential_inc,"LineWidth",3)
hold on
stem(t,exponential_dec,"LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
hold off

% Rectangular pulse
fs = 1000;
T = 10*(1/50);
t = -0.1:.01:T-1/fs;
w = 20e-3;
x = rectpuls(t,w);
stem(t,x,"LineWidth",3)
xlabel("Time")
ylabel("Amplitude")
title("Rectangular")
grid on

%Triangle 
t = (0:0.01:0.4);
f = 10;
stem(t,sawtooth(2 * pi * f * t,1/2),"k-","LineWidth",3)
xlabel("Time");
ylabel("Amplitude");

% Sinc And sa
x = linspace(-5,5,50); 
sc = sinc(x);
sa = sin(x) ./ x;
stem(x,sc,"k-","LineWidth",3)
hold on
stem(x,sa,"r-","LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
hold off
