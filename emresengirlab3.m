clear all
close all 
clc

o = ones(1,4);

fm = 1;
Fs = 5.*10.^3;
t = 0:0.002:4;
z=1;
T=4;
for i = 0:0.002:4
   
    if i<3
        xt(z) = i;
    else
        xt(z) = 3;
    end
    z = z+1;
end
yt = sin(2*pi*fm.*t);
zt = yt + xt;
figure(1)

subplot(311)
plot(t,xt)
xlabel("t")
ylabel("xt")
legend("xt")

subplot(312)
plot(t,yt)
xlabel("t")
ylabel("yt")
legend("yt")

subplot(313)
plot(t,zt)
xlabel("t")
ylabel("zt")
legend("zt")


ak = 0;
c = 1;


for k = -1000:1:1000
    ak = (1/4)*(xt.*exp(-1i.*k*(pi/2).*t)).*0.002;
end

for k = -1000:1:1000
    bk = (1/4)*(yt.*exp(-1i.*k*(pi/2).*t)).*0.002;
end

for k = -1000:1:1000
    ck = (1/4)*(zt.*exp(-1i.*k*(pi/2).*t)).*0.002;
end


for k=-1000:1:1000
    dk = ak + bk;
end



sum(square(abs(ck)))
alpz = 0;
for l=0:0.002:4
    alpz = alpz + square(abs(zt)).*0.002;
end
alpz = (1/4)*alpz















