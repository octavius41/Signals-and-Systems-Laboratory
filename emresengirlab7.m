%% Use this code at the beginning of your MATLAB script
clearvars; clc; close all;
d = 2; 
load handel.mat
filename = 'handel.flac';
audiowrite(filename,y,Fs);
samples = [1,d*Fs];
clear Fs
[x,Fs] = audioread(filename,samples); 


t = 0+(1/Fs):1/Fs:d;

x = x';
y = y';

fs1=mod(0:length(t)-1,4);
fs2=mod(0:length(t)-1,8);

c = 1;
v = 1;
for N = 0:1:length(t);
    
    if fs1(v) == 0;
        xd4(c) = x(v);
        c = c+1;
    end
    if v < 16384;
        v = v+1;
    end
end
fsd4 = (c-1)/2;

c = 1;
v = 1;
s1 = zeros(1,length(t));
s2 = zeros(1,length(t));
for N = 0:1:length(t);
    
    if fs2(v) == 0;
        xd8(c) = x(v);
        c = c+1;
        s1(v) = 1;
    end
    if v < 16384;
        v = v+1;
    end
    
end

fsd8 = (c-1)/2;

XF = fft(x,length(x));
XF4 = fft(xd4,length(xd4));
XF8 = fft(xd8,length(xd8));

XF = fftshift(XF);
XF4 = fftshift(XF4);
XF8 = fftshift(XF8);

XF = abs(XF/length(x));
XF4 = abs(XF4/length(xd4));
XF8 = abs(XF8/length(xd8));


w = linspace(-Fs/2,Fs/2,length(x));
figure(1)

subplot(311)
plot(w,XF)
title("Frequency Responses of original signal and downsamples")
xlabel("frequency (w)")
ylabel("X(w)")

w1 = linspace(-fsd4/2,fsd4/2,length(xd4));

subplot(312)
plot(w1,XF4)
title("Downsampled by 4")
xlabel("frequency (w)")
ylabel("X(w)")

w2 = linspace(-fsd8/2,fsd8/2,length(xd8));
subplot(313)
plot(w2,XF8)
title("Downsampled by 8")
xlabel("frequency (w)")
ylabel("X(w)")

Fs1 = Fs/4;
t1 = 0+(1/Fs1):1/Fs1:d;
x4=interp1(t1,xd4,t,'linear');

Fs2 = Fs/8;
t2 = 0+(1/Fs2):1/Fs2:d;
x8=interp1(t2,xd8,t,'linear');

figure(2)
subplot(311)
plot(t,x)
title("Original Signal")
xlabel("time (t)")
ylabel("x(t)")


subplot(312)
plot(t,x4)
title("Downsampled by 4")
xlabel("time (t)")
ylabel("x(t)")

subplot(313)
plot(t,x8)
title("Downsampled by 8")
xlabel("time (t)")
ylabel("x(t)")

soundsc(x)
soundsc(x4)
soundsc(x8)







