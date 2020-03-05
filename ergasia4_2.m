clear
close all
fs=8000;
N=17280;
f1=400;
f2=1000;
time=(0:N-1)/fs;
x1=audioread('voice.wav');
xc=audioread('voice2.wav');
X1=fft(x1);
XC=fft(xc);
freq=fs/2*(-1:2/N:1-2/N);
figure, subplot(3,1,1)
plot(freq,fftshift(abs(X1)),'linewidth',3)
xlabel('frequency,Hz')
ylabel('Magnitude')
title('Fasma Diamorfosis');
axis([-400 400 0 100])
subplot(3,1,2)
plot(freq(1:17280),fftshift(abs(XC)),'r','linewidth',3)
xlabel('frequency,Hz')
ylabel('Magnitude')
title('Fasma Diamorfosis');
axis([-400 400 0 350])
xm=x1.*xc;
XM=fft(xm);
XM2=fftshift(abs(XM));
subplot(3,1,3),
plot(freq,XM2,'b','linewidth',1)
xlabel('frequency,Hz')
ylabel('Magnitude')
title('Fasma Apodiamorfosis');
axis([-60 60 0 100])
sound(x1);
pause (2);
sound(xc);
pause(2);
sound(xm);
pause(2)
sound(XM2);
