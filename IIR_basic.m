kp=-1;
ks=-20;
wp=4;
ws=8;
n=(log((10^(-kp/10)-1)/(10^(-ks/10)-1)))/(2*(log(wp/ws)))
wc=(wp)/((10^(-kp/10)-1)^(1/10))

for k=(2*N)-1
    theta_k=((pi*k)/N)+(pi/(2*N))+(pi/2)
end
s0=((pi/(2*N))+(pi/2))
s1=((pi*1)/N)+(pi/(2*N))+(pi/2)
s2=((pi*2)/N)+(pi/(2*N))+(pi/2)
s3=((pi*3)/N)+(pi/(2*N))+(pi/2)
s4=((pi*4)/N)+(pi/(2*N))+(pi/2)