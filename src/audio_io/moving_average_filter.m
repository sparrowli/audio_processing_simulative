% one type of low pass filter
% forward coefficients b[n] and backward coefficients a[n]
n_samples = 1000;
% create filter coefficients for 5-points moving average
taps = [.2 .2 .2 .2 .2];
% raw data from -1 to 1 as the return value of rand is (0, 1);
% 2 * (0, 1) - 1 <===> (-1, 1);
x = (rand(n_samples, 1) * 2 ) - 1;

filtered_data = filter(taps, 1, x);

fft_samples = n_samples;
half_samples = fft_samples / 2;

x_fft = abs(fft(x)) / half_samples; 
filtered_data_fft = abs(fft(filtered_data)) / half_samples;

subplot(2, 2, 1);
plot(x);
title('Raw Data');
xlabel('Time');

subplot(2, 2, 2);
plot(filtered_data); 
title('Filtered Data');
xlabel('Time');

subplot(2, 2, 3);
plot(x_fft(1:half_samples));
title('Raw Data in Frequency');
xlabel('Frequency');

subplot(2, 2, 4);
plot(filtered_data_fft(1:half_samples));
title('Filtered Data in Frequency');
xlabel('Frequency');
