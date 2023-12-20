t=linspace(0,1,1000);
x=sin(2*pi*t);
z=awgn(x,1);
N=40;
f=10;
fs=200;
w=2*pi*f/fs;
[b,a]=butter(N,w);
fvtool(b,a);
iir=filter(b,a,z);
subplot(2,1,1)
plot(t,z);
subplot(2,1,2)
plot(t,iir);

