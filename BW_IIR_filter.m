%IIR BUTTERWORTH FILTER
syms s
kp=-2;
ks=-10;
wp=20;
ws=30;
j=sqrt(-1);
N=log((10^(-kp/10)-1)/(10^(-ks/10)-1))/(2*log(wp/ws))
N=round(N)+1
wc=wp/(10^(-kp/10)-1)^(1/(2*N))
H1=1/(s+1);
H2=1/(s^2+1.414*s+1);
H3=1/((s^2+s+1)*(s+1));
H4=1/((s^2+0.765368*s+1)*(s^2+1.84776*s+1));
H5=1/((s+1)*(s^2+0.6180*s+1)*(s^2+1.6180*s+1));

if N==1
H(s)=H1;
elseif N==2
H(s)=H2;
elseif N==3
H(s)=H3;
elseif N==4
H(s)=H4;
elseif N==5
H(s)=H5;
end
H(s)=H(s/wc)
H(s)=H(j*wp)
n=abs(H(s))

m=20*log(H(s))
%IIR BUTTERWORTH FILTER
syms s
kp=-2;
ks=-10;
wp=20;
ws=30;
j=sqrt(-1);
N=log((10^(-kp/10)-1)/(10^(-ks/10)-1))/(2*log(wp/ws))
N=round(N)+1
wc=wp/(10^(-kp/10)-1)^(1/(2*N))
H1=1/(s+1);
H2=1/(s^2+1.414*s+1);
H3=1/((s^2+s+1)*(s+1));
H4=1/((s^2+0.765368*s+1)*(s^2+1.84776*s+1));
H5=1/((s+1)*(s^2+0.6180*s+1)*(s^2+1.6180*s+1));

if N==1
H(s)=H1;
elseif N==2
H(s)=H2;
elseif N==3
H(s)=H3;
elseif N==4
H(s)=H4;
elseif N==5
H(s)=H5;
end
H(s)=H(s/wc)
H(s)=H(j*wp)
n=abs(H(s))

m=20*log(H(s))
