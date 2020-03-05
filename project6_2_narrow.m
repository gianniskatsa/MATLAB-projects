clear all;
clc;
[z,fs]=audioread('voice4.wav ');
z=z(1:15000)
[N]=size(z);
t=(0:N-1)/fs;
freq=(-N/2:1:N/2-1);
figure, subplot(2,1,1)
plot(t,z)
subplot (2,1,2)
plot (freq,z)
title('To arxiko sima ston xrono kai stin syxnotita')
[b,a]=butter(9,.2);
zf=filter(b,a,z);
sound(zf,fs)
pause(2)
ZF=fft(zf);
figure, subplot(2,1,1)
plot(zf)
subplot(2,1,2)
freq1=(-7500:7499)/15000*fs;
plot(freq1,fftshift(abs(ZF)))
fs=80000;
zfr=interp(zf,10);
[ilength jlength]=size(zfr);
time=(0:ilength-1)/fs;
x=zfr;
% signal integration
x=cumsum(x)/fs;
time=time';
figure, plot(time,x)
%FM modulation
fc=20000;
k=5000;
sm=exp(j*(2*pi*fc.*time)).*exp(j*k*x);
SM=fft(sm);
freq=(-ilength/2:ilength/2-1)/ilength*fs;
figure, plot(freq,fftshift(abs(SM)));
hold
% deite to fasma to simatos omilias
ZFR=fft(zfr);
plot(freq,(fftshift(abs(ZFR))),'r');
axis ([-40000 40000 0 12000])
title('To fasma toy arxikoy simatos kai toy diamorfomenoy')
% fm demodulation
smd=diff(sm);
smd=abs(smd)-mean(abs(smd));
figure, subplot(2,1,1)
plot(smd)
subplot(2,1,2)
tSampling=1/fs;
n2=numel(smd);
t2=-0.005:tSampling:-0.005+(n2-1)*tSampling;
plot(t2,smd)
title('To teliko apodiamorfomeno sima ston xrono kai thn syxnothta')
sound(3*smd,fs); 