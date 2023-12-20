x = [1 1 1 1];
h = [1 0 1 0];
n1 = length(x);
n2 = length(h);
N = n1+n2-1;
x = [x,zeros(1,N-n1)];
h = [h,zeros(1,N-n2)];
%To find X(k) and H(k)
X = fft(x);
H = fft(h);
%Y(k)
Y = X.*H;
%IFFT to get y(n)
syms Wnkm(k,m) Wnk(k)
Y = conj(Y);
f1 = (zeros(1,round(N/2)));
f2 = (zeros(1,round(N/2)));
y=1;
%Decimating into EVEN and ODD
for i=1:N
 if rem(i,2)==0
 f2(y) = Y(i);
 y=y+1;
 else
 f1(y) = Y(i);
 
 end
end
j=sqrt(-1);
Wnkm(k,m) = exp((-j*4*pi*k*m)/N);
Wnk(k) = exp((-j*2*pi*k)/N);
F1 = (zeros(1,round(N/2)));
F2 = (zeros(1,round(N/2)));
%F1(k)
for k=1:(round(N/2))
 for m=1:(round(N/2))
 F1(k) = F1(k) + f1(m)*Wnkm(k-1,m-1);
 end
end
%F2(k)
for k=1:(round(N/2))
 for m=1:(round(N/2))
 F2(k) = F2(k) + f2(m)*Wnkm(k-1,m-1);
 end
end
y1 = (zeros(1,round(N/2)));
y2 = (zeros(1,round(N/2)));
%X1(k) = X(k) and X2(k) = X(k+N/2)
for k=1:(round(N/2))
 y1(k) = (F1(k) + Wnk(k-1)*F2(k))/N;
 y2(k) = (F1(k) - Wnk(k-1)*F2(k))/N;
end
y_linear_convolved = [y1,y2]