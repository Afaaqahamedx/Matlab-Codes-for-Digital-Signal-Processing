x = [1,2,3,4,5];
N = length(x);
% k = (1:N)
X = zeros(1, N);
j = sqrt(-1);
disp("DFT of x(n) ")
%DFT of x(n) 
for k = 0:N-1
 for n= 0:N-1
 X(k+1) = X(k+1) + x(n+1)*(exp(-j * n * k *(2 *pi / N)))
 end
end
ny = (1:N);
X_mag = abs(X);
X_phase = angle(X);
figure("Name","DFT")
subplot(2,1,1)
stem(ny,X_mag,"LineWidth",3)
xlabel("Frequency")
ylabel("Mag")
title("Magnitude plot")
subplot(2,1,2)
stem(ny, X_phase,"LineWidth",3)
xlabel("Frequency")
ylabel("Phase")
title("Phase plot")