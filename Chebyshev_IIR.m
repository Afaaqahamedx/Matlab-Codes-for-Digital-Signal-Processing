%Chebyshev Filter
syms s
kp=-2;
ks=-20;
wp=1;
ws=1.3;
j=sqrt(-1);
e=sqrt(((1/(10^(kp/20)))^2)-1);
dp=1-(1/sqrt(1+(e^2)));
ds=10^(ks/20);
%discrimination factor
d=sqrt(((1-dp)^(-2)-1)/((ds^(-2))-1));
%selectivity factor
k=wp/ws;
N=(acosh(1/d))/(acosh(1/k));
N=round(N)+1;
%to find a and b

a1=(1/2)*(((1+sqrt(1+e^2))/e)^(1/N));
a2=(1/2)*(((1+sqrt(1+e^2))/e)^(-1/N));
a=a1-a2;
b=a1+a2;

for k=1:1:N
S(k+1)=(-a)*sin(((2*k)-1)*(pi/(2*N)));
end

for k=1:1:N
w(k+1)=b*cos(((2*k)-1)*(pi/(2*N)));
end
for m=1:1:N
l(m+1)=(s-(S(m)+(j*w(m))));
end