t = -1:0.001:1;                % +/-1 second @ 1kHz sample rate
fo = 100;
f1 = 400;                % Start at 100Hz, go up to 400Hz
ycx = chirp(t,fo,1,f1,'q',[],'convex');


t = -1:0.001:1;                % +/-1 second @ 1kHz sample rate
fo = 400;
f1 = 100;                % Start at 400Hz, go down to 100Hz
ycv = chirp(t,fo,1,f1,'q',[],'concave');


subplot(2,1,1)
spectrogram(ycx,256,255,128,1000,'yaxis')
title('Convex Chirp')
subplot(2,1,2)
spectrogram(ycv,256,255,128,1000,'yaxis')
title('Concave Chirp')
