clc
clear all 
close all

figure(1)
t_s= 10^-7;
t = 0:t_s:0.002;

w = 2*pi*power(10,6);
q =1000;
r = 3*power(10,5);
gt1 = (w.*r/q).*exp((-w.*t)/(2*q)).*cos(w.*t);
gt1n= gt1/max(gt1);
plot(t,gt1n)
xlabel('time')
ylabel('amplitude')
legend('gt1n')
title('gt1')

figure(2)
w = 2*pi*power(10,6);
q =100;
r = 3*power(10,5);
gt2 = (w.*r/q).*exp((-w.*t)/(2*q)).*cos(w.*t);
gt2n= gt2/max(gt2);
plot(t,gt2n)
xlabel('time')
ylabel('amplitude')
legend('gt2n')
title('gt2')

figure(3)
w = 2*pi*50*1000;;
q =1000;
r = 3*power(10,5);
gt3 = (w.*r/q).*exp((-w.*t)/(2*q)).*cos(w.*t);
gt3n= gt3/max(gt3);
plot(t,gt3n)
xlabel('time')
ylabel('amplitude')
legend('gt3n')
title('gt3')

figure(4)
w = 2*pi*50*1000;
q =100;
r = 3*power(10,5);
gt4 = (w.*r/q).*exp((-w.*t)/(2*q)).*cos(w.*t);
gt4n= gt4/max(gt4);
plot(t,gt4n)
xlabel('time')
ylabel('amplitude')
legend('gt4n')
title('gt4')


t_s= 10^-7;
t = 0:t_s:0.002;

figure(5)
m=0;
p = 5*power(10,-4);
lambda1 = exp((-(t-m).^2)/2*p.^2);
plot(t,lambda1)
xlabel('time')
ylabel('amplitude')
legend('lambda1')
title('lambda1')

figure(6)
m=0;
p = 2*power(10,-4);
lambda2 = exp((-(t-m).^2)/2*p.^2);
plot(t,lambda2)
xlabel('time')
ylabel('amplitude')
legend('lambda2')
title('lambda2')

figure(7)
m=0;
p = 2*power(10,-8);
lambda3 = exp((-(t-m).^2)/2*p.^2);
plot(t,lambda3)
xlabel('time')
ylabel('amplitude')
legend('lambda3')
title('lambda3')

y = convolve(lamda1,gt1n)
y = conv(lambda1,gt1n)
plot(y)

function y = convolve(x,h)

    n = length(x);
    m = length(h);
    ny = n+m-1;
    y = zeros(1,ny);
    for i = 1:n;
      for k = 1:m;
       y(i+k-1) = y(i+k-1) + h(k)*x(i);
      end
    end
figure(8)
y = convolve(lambda1,gt1n);
m = 0:ny-1
plot(m,y)

end










