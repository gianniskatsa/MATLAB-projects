clear
close all
x=[-ones(1,995) 100*ones(1,10) -ones(1,995)];
figure,plot(x)
X=fft(x);
freq=[-1000:999];
figure,plot(freq,abs(fftshift(X)))
h=plot(freq,abs(fftshift(X)));
set(h,'linewidth', 2.0);
