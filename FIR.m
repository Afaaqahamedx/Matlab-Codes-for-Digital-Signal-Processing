N=7;
wc=1;
alpha=(N-1)/2;
n=0:1:N-1;
%Desired impulse response
for i=0:1:(N-1)
 if(i~=alpha)
 hd(i+1)=(sin(wc*(i-3))/(pi*(i-3)));
 else
 hd(i+1)=wc/pi;
 end
end
subplot(5,1,1);
stem(n,hd);
xlabel('n');
ylabel('hd(n)');
title('Desired impulse response');
wHm = zeros(1,7);
%Hamming window
for j=0: 6
 wHm(j+1)=0.54-(0.46*cos(2*pi*j/(N-1)));
end
subplot(5,1,2);
stem(n,wHm);
xlabel('n');
ylabel('whm(n)');
title('Hamming window');
%Impulse response
hn=hd.*wHm;
subplot(5,1,3);
stem(n,hn);
xlabel('n');
ylabel('h(n)');
title('Impulse response');
hw=[];
for w=0:(1/pi):pi
 t=0;
 temp=0;
 const=hn(alpha+1);
 for m=0:1:((N-3)/2)
 temp=temp+(2.*hn(m+1).*cos(w.*(alpha-m)));
 end
 temp=temp+const;
 hw=[hw, temp];
end
w=0:1/pi:pi;
%Magnitude response
subplot(5,1,4);
stem(w,hw);
xlabel('w');
ylabel('|H(w)|');
title('Magnitude response');
phase=-w*alpha;
subplot(5,1,5);
stem(w,phase);
xlabel('w');
ylabel('Phase');
title('Phase response');