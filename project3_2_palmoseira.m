clear
close all
fs=10000;
ts=1/fs;
t=ts:ts:1;
%total time 1 sec
y = square(2*pi*25*t);
figure,plot(t,y)
xlabel ('Time, Sec')
axis([0 1 -1.2 1.2])
Y=fft(y);
Y=fftshift(Y);
freq=-5000:4999;
figure,plot(freq,abs(Y))
xlabel ('Frequency, Hz')

