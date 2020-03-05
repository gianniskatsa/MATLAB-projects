clc;
clear; 
close all;
[x,fs]=audioread('voice4.wav');
[y,fs]=audioread('voice5.wav');
fs2=fs*3;
x1=interp(x,3);
fs4=fs*3;
y1=interp(y,3);
[M]=size(y1);
[N]=size(x1); 
t=(0:N-1)/fs;  
xc=cos(2*pi*fs2*t); 
xs= sin(2*pi*fs4*t);
xm=x.*xc-imag(hilbert(x)).*xs;

XM=fft(xm);
figure,subplot(2,1,1)
plot(freq,abs(fftshift(XM)))
axis([-400 400 0 120])
xd=s3.*xc;
XD=fft(xd);
subplot(2,1,2)
plot(freq,abs(fftshift(XM)))
hold
plot(freq,abs(fftshift(XD)),'r')
axis([-400 400 0 120])