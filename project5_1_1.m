[x,fs]=audioread('voice4.wav ');
[N]=size(x);
t=(0:N-1)/fs;
freq=(-N/2:1:N/2-1);
h=hilbert(x);
figure,plot(t,real(h))
hold
plot(t,imag(h),'r')
H=fft(h);
figure,plot(freq,fftshift(abs(H)))
X=fft(x);
hold
plot(freq,fftshift(abs(X)),'r')
fc=2000
y = demod(h,fc,fs,'pm')
% comparison with original
hold, plot(x,'r');
sound (y);  
fc=cos(600.*t);
y = demod(h,fc,fs,'fm')
plot(y)
% comparison with original
hold, plot(x,'r');
axis([6700 12300 -3.5 3.5])
sound (y)


