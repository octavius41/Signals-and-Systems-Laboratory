clc
close all

f1 = 50;
f2 = 200;
f3 = 500;
Fs = 5000;
t = -0.05:(1/Fs):0.05;

xt = 0.1*sin(2*pi*f1.*t) + 0.5*cos(2*pi*f2.*t) - 0.9*sin(2*pi*f3.*t);

figure(1)
subplot(211)
plot(t,xt);

N = length(t);

XF = fft(xt);
XFF = fftshift(abs(XF/N));;

w = linspace(-2500,2500,N);
subplot(212)
plot(w,XFF)

nl1 = 1;
nl2 = 7;
Wnl = f1/(Fs/2);
[bl1 , al1] = butter(nl1,Wnl,'low');

hl1 = freqz(bl1,al1,Fs/2);

[bl2, al2] = butter(nl2,Wnl,'low');

hl2 = freqz(bl2,al2,Fs/2);

nh1 = 1;
nh2 = 7;
Wnh = 350/(Fs/2);

[bh1, ah1] = butter(nh1,Wnh,'high');

hh1 = freqz(bh1,ah1,Fs/2);

[bh2, ah2] = butter(nh2,Wnh,'high');

hh2 = freqz(bh2,ah2,Fs/2);


nbp1 = 1;
nbp2 = 7;
Wnbp = [75 350]/(Fs/2);

[bbp1, abp1] = butter(nbp1,Wnbp,'bandpass');

hbp1 = freqz(bbp1,abp1,Fs/2);

[bbp2, abp2] = butter(nbp2,Wnbp,'bandpass');

hbp2 = freqz(bbp2,abp2,Fs/2);

figure(2)
subplot(311)
plot(abs(hl1))

hold on
plot(abs(hl2))

title('low pass filter')
xlabel('f')
ylabel('h(f)')
legend('h(f), n=1','h(f), n=7')
xlim([0 1000]);
hold off

subplot(312)
plot(abs(hh1))
hold on
plot(abs(hh2))

title('high pass filter')
xlabel('f')
ylabel('h(f)')
legend('h(f), n=1','h(f), n=7')
xlim([0 1000]);
hold off

subplot(313)
plot(abs(hbp1))

hold on
plot(abs(hbp2))

title('bandpass pass filter')
xlabel('f')
ylabel('h(f)')
legend('h(f), n=1','h(f), n=7')
xlim([0 1000]);
hold off


figure(3)
f=linspace(-Fs/2,Fs/2,N);

ylp = filter(bl2,al2,XF);
yhp = filter(bh2,ah2,XF);
ybp = filter(bbp2,abp2,XF);

ylpt = ifft(ylp,N);
yhpt = ifft(yhp,N);
ybpt = ifft(ybp,N);


subplot(411)
plot(t,xt)
title('signal itself')
legend('x(t)')
xlabel('t')


subplot(412)
plot(t,ylpt)

subplot(413)
plot(t,yhpt)

subplot(414)
plot(t,ybpt)












