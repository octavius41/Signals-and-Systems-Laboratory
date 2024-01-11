clear all
close all 
clc

f1 = 5;
f2 = 300;
dt = 0.001;
t = dt:dt:1;

xt = -2.*(sin(pi.*f2.*t).^2) + 2.*sin(pi.*f1.*t).*cos(pi.*f1.*t) + 1;
figure(1)
plot(t,xt)
title("Signal")
xlabel("t")
ylabel("x(t)")
legend("signal x(t)")


c = 1;

for N = -499:1:500
    Xf(c) = sum(xt.*exp(-1j*2*pi*N.*t).*dt);
    c = c+1;
end

N = 1000;
Xf = abs(Xf);

w = -499:1:500;
figure(2)
plot(w,Xf)
title("Fourier Transform of the signal (manually)")
xlabel("w")
ylabel("XF(w)")
legend("FT(w)")


N = 1000;
y = fft(xt,N);
y = fftshift(y);
y = abs(y)/N;

figure(3)
plot(w,y)
title("Fourier Transform of the signal (built in)")
xlabel("w")
ylabel("XF(w)")
legend("FT(w)")


figure(4)
subplot(211)
plot(w,Xf)
title("Fourier Transform of the signal (manually)")
xlabel("w")
ylabel("XF(w)")
legend("FT(w)")

subplot(212)
plot(w,y)
title("Fourier Transform of the signal (built in)")
xlabel("w")
ylabel("XF(w)")
legend("FT(w)")

fs = 1000;

HF = ones(1,1000);
for N = 1:1:1000
    if (N<=250)
        HF(N) = 0;
    end

    if (N>=750)
        HF(N) = 0;
    end
 
end

N = 1000;

YF = Xf.*HF;
w = -499:1:500;
figure(5)
subplot(211)
plot(w,YF)
title("Fourier Transform of the output signal (manually)")
xlabel("w")
ylabel("YF(w)")
legend("YF(w)")
yt = ifft(YF,N);

subplot(212)
plot(t,yt)
title("Inverse Fourier Transform of the output signal (manually)")
xlabel("t")
ylabel("yt(t)")
legend("yt(t)")













