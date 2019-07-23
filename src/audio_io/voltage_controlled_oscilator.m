% Voltage Controlled Oscillator
fs = 10000;
t = 0:1/fs:2;
x1 = vco(sawtooth(2*pi*t,0.75),[0.1 0.4]*fs,fs);
x2 = vco(square(2*pi*t),[0.1 0.4]*fs,fs);

subplot(2,1,1)
spectrogram(x1,kaiser(256,5),220,512,fs,'yaxis')
title('VCO Triangle')
subplot(2,1,2)
spectrogram(x2,256,255,256,fs,'yaxis')
title('VCO Rectangle')
