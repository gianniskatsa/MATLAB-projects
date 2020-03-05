clc;
clear; 
close all;
[y,fs]=audioread('voice5.wav');
fs4=fs*3;
y1=interp(y,3);
[N]=size(y1); 
t=(0:N-1)/fs; 
fc=128; 
yc=cos(2*pi*fc*t); 
y2=y.*yc;
z=y2.*yc;  
[b,a]=butter(10,.2); 
y3=filter(b,a,z);
fs3=fs4/3;
y4=decimate(y,3);
sound (y4)