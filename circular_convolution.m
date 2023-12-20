x = [1,2,3];
h = [3,4,5,6];
n1=length(x);
n2 = length(h);
n = max(n1,n2);
a = 1:n;
x = [x,zeros(1,n-n1)];
h = [h,zeros(1,n-n2)];
y = zeros(1,n);
for i =0:n-1
 for j = 0:n-1
 k = mod((i-j),n);
 y(i+1) = y(i+1) + x(j+1)*h(k+1);
 end
end
figure("Name","Circular conv");
subplot(2,1,1);
stem(a,y,"LineWidth",3)
title("Circular Convolution: Without Inbuilt Function")
y = cconv(x,h,6);
subplot(2,1,2);
stem(y,"LineWidth",3)
title("Circular Convolution: With Inbuilt Function");
