wc=1;
N=51;
alpha=(N-1)/2;
n=0:1:N-1;
%Rectangular window
for j=0:1:(N-1)
 wR(j+1)=1;
end
subplot(5,1,1);
stem(n,wR);
xlabel('n');
ylabel('wR(n)');
title('Rectangular window');
%Bartlett window
for j=0:1:(N-1)
 wBr(j+1)=1-(2.*abs(j-((N-1)/2)))/(N-1);
end;
subplot(5,1,2);
stem(n,wBr);
xlabel('n');
ylabel('wBr(n)');
title('Bartlett window');
%Hamming window
for j=0:1:(N-1)
 wHm(j+1)=0.54-(0.46*cos(2*pi*j/(N-1)));
end;
subplot(5,1,3);
stem(n,wHm);
xlabel('n');
ylabel('whm(n)');
title('Hamming window');
%Hanning window
for j=0:1:(N-1)
 wHn(j+1)=0.5-(0.5*cos(2*pi*j/(N-1)));
end;
subplot(5,1,4);
stem(n,wHn);
xlabel('n');
ylabel('whn(n)');
title('Hanning window');
%Blackmann window
for j=0:1:(N-1)
 wBl(j+1)=0.42-(0.5*(cos(2*pi*j/(N-1))))+(0.08*(cos(4*pi*j/(N-1))));
end;
subplot(5,1,5);
stem(n,wBl);
xlabel('n');
ylabel('wbl(n)');
title('Blackmann window');