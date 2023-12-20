t = (0:.01:2);
f = 1;
plot(t,sin(2 * pi * f * t),"k-","LineWidth",3)
xlabel("Time");
ylabel("Amplitude");
grid on

%ct_dt sine
fs = 40;
t = linspace(0,2,fs*2);
f = 1;
stem(t,sin(2 * pi * f * t),"k-","LineWidth",3)
xlabel("Time");
ylabel("Amplitude");

