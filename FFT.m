syms Wnkm(k,m) Wnk(k)
x = [1 2 3 4 5 6 7 8];
N = length(x);
f1 = (zeros(1,round(N/2)));
f2 = (zeros(1,round(N/2)));
y=1;
%Decimating into EVEN and ODD
for i=1:N
 if rem(i,2)==0
 f2(y) = x(i);
 y=y+1;
 else
 f1(y) = x(i);
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
F1;
F2;
X1 = (zeros(1,round(N/2)));
X2 = (zeros(1,round(N/2)));
%X1(k) = X(k) and X2(k) = X(k+N/2)
for k=1:(round(N/2))
 X1(k) = F1(k) + Wnk(k-1)*F2(k);
 X2(k) = F1(k) - Wnk(k-1)*F2(k);
end
X_without_fft = [X1,X2]
%X_without_fft = 1×8 complex
% 36.0000 + 0.0000i -4.0000 + 9.6569i -4.0000 + 4.0000i -4.0000 + 1.6569i 
%⋯
X_mag = abs(X_without_fft);
X_phase = angle(X_without_fft);
f = 1:N;
figure("Name","FFT")
subplot(3,1,1)
stem(f,x,"filled","LineWidth",3)
title("Input sequence")
ylabel("x(n)")
xlabel("N")
grid
subplot(3,1,2)
stem(f,X_mag,"filled","LineWidth",3)
title("Magnitude spectrum")
ylabel("Magnitude")
xlabel("Frequency")
grid
subplot(3,1,3)
stem(f,X_phase,"filled","LineWidth",3)
title("Phase spectrum")
ylabel("Phase")
xlabel("Frequency")
grid
