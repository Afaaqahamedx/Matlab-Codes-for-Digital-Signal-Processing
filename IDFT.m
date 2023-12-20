X = [1,2,3,4];
N = length(X);
x = zeros(1,N);
j = sqrt(-1);
disp("IDFT of X(K)")
%IDFT of X(K)
for n=1:N
 for k=1:N
 x(n) = (x(n) + X(k)*(exp(j * n * k *(2 *pi / N)))) / N
 end
end
ny = (1:N);
x_mag = abs(x);
x_phase = angle(x);
figure("Name","IDFT")
subplot(2,1,1)
stem(ny,x_mag,"LineWidth",3)
xlabel("Frequency")
ylabel("Mag")
title("Magnitude plot")
subplot(2,1,2)
stem(ny, x_phase,"LineWidth",3)
xlabel("Frequency")
ylabel("Phase")
title("Phase plot")