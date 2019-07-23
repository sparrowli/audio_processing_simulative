tc = gauspuls('cutoff',50e3,0.6,[],-40); 
t1 = -tc : 1e-6 : tc; 
y1 = gauspuls(t1,50e3,0.6);


t2 = linspace(-5,5);
y2 = sinc(t2);


subplot(2,1,1)
plot(t1*1e3,y1)
xlabel('Time (ms)')
ylabel('Amplitude')
title('Gaussian Pulse')
subplot(2,1,2)
plot(t2,y2)
xlabel('Time (sec)')
ylabel('Amplitude')
title('Sinc Function')
