clc;
clear; 
close all;
[x,f1s]=audioread('voice4.wav');
fs=17280
N=17280; 
t=(0:N-1)/fs; 
plot(t(5500:15000),x(5500:15000));
xlabel('time')
x=fft(x); 
freq=(-8640:8639); 
fc=128; 
xc=cos(2*pi*fc*t); 
XC=fft(xc); 
figure
y=x.*xc; 
figure, plot(t,y)
xlabel('Frequency');
ylabel('Magnitude');
title('SimaDiamorfosis');
Y=fft(y); 
figure, plot(freq,fftshift(abs(Y)))
xlabel('Frequency');
ylabel('Magnitude');
title('SimaDiamorfosis');
z=y.*xc; 
figure, plot(t,z)
Z=fft(z); 
figure, plot(freq,fftshift(abs(Z)))
xlabel('Frequency');
ylabel('Magnitude');
title('Sima Apodiamorfosis');
[b,a]=butter(10,.2); 
sf=filter(b,a,z);
figure, plot(t,sf) 

