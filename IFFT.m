disp("Inverse Fast Fourier Transform - DITIFFT")
%Inverse Fast Fourier Transform - DITIFFT
syms Wnkm(k,m) Wnk(k)
X = [11 1+j 0 1-2j 0 1+2j 0 1-j];
X = conj(X);
N = length(X);
f1 = (zeros(1,round(N/2)));
f2 = (zeros(1,round(N/2)));
y=1;
%Decimating into EVEN and ODD
for i=1:N
 if rem(i,2)==0
 f2(y) = X(i);
 y=y+1;
 else
 f1(y) = X(i);
 
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
x1 = (zeros(1,round(N/2)));
x2 = (zeros(1,round(N/2)));
%X1(k) = X(k) and X2(k) = X(k+N/2)
for k=1:(round(N/2))
 x1(k) = (F1(k) + Wnk(k-1)*F2(k))/N;
 x2(k) = (F1(k) - Wnk(k-1)*F2(k))/N;
end
x_without_ifft = [x1,x2]
%x_without_ifft = 1×8
% 1.8750 1.5518 0.6250 1.5518 0.8750 1.1982 2.1250 ⋯
X_mag = abs(X);
X_phase = angle(X);
f = 1:N;
%FFT with using inbuilt function
X = [11 1+j 0 1-2j 0 1+2j 0 1-j];
x_with_ifft = ifft(X)
%x_with_ifft = 1×8
 %1.8750 1.5518 0.6250 1.5518 0.8750 1.1982 2.1250 ⋯
figure("Name","IFFT")
subplot(3,1,1)
stem(f,X_mag,"filled","LineWidth",3)
title("X(k) Magnitude spectrum")
ylabel("Magnitude")
xlabel("Frequency")
grid
subplot(3,1,2)
stem(f,X_phase,"filled","LineWidth",3)
title("X(k) Phase spectrum")
ylabel("Phase")
xlabel("Frequency")
grid
subplot(3,1,3)
stem(f,x_without_ifft,"filled","LineWidth",3)
title("Output sequence")
ylabel("x(n)")
xlabel("N")
grid
