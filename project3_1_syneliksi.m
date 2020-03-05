clear
close all
[z,fs]=audioread('voice.wav');
bw=2500;
length=2048;
time2=(0:length)/fs;
half=length/2/fs;
ht=2*bw*sinc(2*bw*(time2-half));
[ilength, jlength]=size(z);
yout=conv(ht,z)/fs;
time3=(0:length+ilength-1)/fs;
figure, plot(time3,yout)
sound(z,fs)
pause(2),
soundsc(yout,fs)
youtfs=fft(yout,ilength)/fs;
youtf=fftshift(youtfs);
freq=(-ilength/2:ilength/2-1)/ilength*fs;
figure,plot(freq,abs(youtf))
psdyout=youtf.*conj(youtf)/ilength*fs;
psdyoutdb=10*log10(psdyout);
figure, plot(freq,psdyoutdb)
axis([-5000 5000 -80 -30])
xlabel('frequency,Hz')