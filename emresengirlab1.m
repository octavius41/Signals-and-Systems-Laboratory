clc 
close all 
clear all

t=linspace(0,1,1000)

x1t = -exp(-4*t)
x2t = cos(2*pi*t)


y1t = power(x1t,2)
y2t = power(x2t,2)

x3t = 2*x1t + 3*x2t

y3t=power(x3t,2)
plot(t,y3t)

y4t = 2*y1t + 3*y2t
plot(t,y4t)

if(y4t == y3t)
    disp('system is linear')
else
    disp('system is not linear')
end

figure(1)
plot(t,x1t)

hold on
plot(t,x2t)
xlabel("t")
ylabel("x2(t),x1(t")
legend("x1t","x2t")

figure(2)

subplot(2,1,1)
plot(t,y3t)
xlabel("t")
ylabel("y3(t)")
legend()
subplot(2,1,2)
plot(t,y4t)
xlabel("t")
ylabel("y4(t)")
legend()



