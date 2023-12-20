x = [2 1 2 1];
y = [1 2 3];
clin = conv(x,y);
xpad = [x zeros(1,6-length(x))];
ypad = [y zeros(1,6-length(y))];
ccirc = ifft(fft(xpad).*fft(ypad));
subplot(2,1,1)
stem(clin,'filled',"LineWidth",3)
ylim([0 11])
title('Linear Convolution of x and y')
subplot(2,1,2)
stem(ccirc,'filled',"LineWidth",3)
ylim([0 11])
title('Circular Convolution of xpad and ypad')