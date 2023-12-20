x = [1,2,3];
h = [3,4,5,6];
x_length = length(x);
h_length = length(h);
N = x_length + h_length -1;
x = [x,zeros(1,N-x_length)];
h = [h,zeros(1,N-h_length)];
y = zeros(1,N);

%Without inbuilt function
for n=1:N
for m=1:n
y(n) = y(n)+x(m)*h(n-m+1);
end
end
figure("Name","without-Inbuilt")
ny = (0:N-1);
subplot(2,2,1);
stem(ny,x,"LineWidth",3);
xlabel("n");
ylabel("x(n)");
title("First sequence");
subplot(2,2,2);
stem(ny,h,"LineWidth",3);
xlabel("n");
ylabel("h(n)");
title("Second sequence");
subplot(2,2,3);
stem(ny,y,"LineWidth",3);
xlabel("n");
ylabel("y(n)");
title("Convoluted signal");

%With inbuilt function
x = [1,2,3];
h = [3,4,5,6];
y = conv(x,h);
ny = (0:N-1);
subplot(2,2,4)
stem(ny,y,"LineWidth",3);
title('Inbuilt Function')
