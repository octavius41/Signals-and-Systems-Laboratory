clc
close all

T = 10;
dt = 0.001;
f = 0.2;
teta = 6*dt;

xint = [];
c = 1;
for t = 0:dt:T
    if t<=5
        xint(c) = -exp(-t);
    end

    if t > 5
        xint(c) = -sin(2*pi*f*t + teta);
    end
    c = c+1;
end



xsign = [];
c = 1;
xsign(1) = 1;
for c = 1:1:10000
        xsign(c+1) = (xint(c+1) - xint(c))/dt;
  
end


t = 0:dt:T;
xint;
xsign;
figure(1)
subplot(211)
plot(t,xsign,'r')
xlabel("t")
ylabel("Xsignal")
legend("signal")

subplot(212)
plot(t,xint,'g')
xlabel("t")
ylabel("Xintegrated")
legend("integral")
c = 1;
w = (2*pi)/T;

for k = -3000:1:3000
    ak(c) = (1/T)*sum(xsign.*exp(-1j*k*w.*t).*dt);
    c = c+1;
end


c = 1;

w = (2*pi)/T
t = 0;
for  c = 1:1:10000
    xtrunc1(c) = 0;
    for N = -50:1:50
            k = 3001+N;
           xtrunc1(c) = xtrunc1(c) + ak(k)*exp(1j*N*w*t);
    end
    t = t + dt;
end

figure(2)
T = 10;
dt = 0.001;
t = 0:dt:T-dt;
plot(t,xtrunc1)

t = 0;
for  c = 1:1:10000
    xtrunc2(c) = 0;
    for N = -200:1:200
            k = 3001+N;
           xtrunc2(c) = xtrunc2(c) + ak(k)*exp(1j*N*w*t);
    end
    t = t + dt;
end

figure(3)
T = 10;
dt = 0.001;
t = 0:dt:T-dt;
plot(t,xtrunc2)

t = 0;
for  c = 1:1:10000
    xtrunc3(c) = 0;
    for N = -500:1:500
            k = 3001+N;
           xtrunc3(c) = xtrunc3(c) + ak(k)*exp(1j*N*w*t);
    end
    t = t + dt;
end

figure(4)
T = 10;
dt = 0.001;
t = 0:dt:T-dt;
plot(t,xtrunc3)


t = 0;
for  c = 1:1:10001
    xtrunc4(c) = 0;
    for N = -1000:1:1000
            k = 3001+N;
           xtrunc4(c) = xtrunc4(c) + ak(k)*exp(1j*N*w*t);
    end
    t = t + dt;
end

figure(5)
T = 10;
dt = 0.001;
t = 0:dt:T;
plot(t,xtrunc4)

mse = 0
for  c = 1:1:10000

           mse = mse + (real(xtrunc2(c)) - xsign(c))^2 ;
    end
    

mse = (1/10001)*mse












