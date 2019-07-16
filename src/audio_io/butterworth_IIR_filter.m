sampling_rate = 8000;

samples = 16000;

Nyquist = sampling_rate / 2;

low_pass_frequency = 300;

order = 5;

t = [0:samples-1] / sampling_rate;

x = (rand(samples, 1) * 2) - 1;

f1 = 300 / Nyquist;
f2 = 3500 / Nyquist;
% create filter coefficients
% [b, a] = butter(order, low_pass_frequency / Nyquist);
% [b, a] = butter(order, [f1, f2]);
% [b, a] = butter(order, [f1, f2], 'stop');
[b, a] = butter(order, f1, 'high');

filtered_data = filter(b, a, x);

% Note: Here use samples as the FFT's points
fft_samples = samples;
half_fft_samples = fft_samples / 2;
bin_width = sampling_rate / fft_samples;
f = [0:bin_width:sampling_rate - bin_width];

x_fft = abs(fft(x)) / half_fft_samples;
filtered_fft = abs(fft(filtered_data)) / half_fft_samples;

subplot(2, 2, 1);
plot(t, x);
title('Raw Time Series');
subplot(2, 2, 3);
plot(t, filtered_data);
title('Filtered Time Series');
xlabel('Time (s)');

subplot(2, 2, 2);
plot(f(1:half_fft_samples), x_fft(1:half_fft_samples));
title('Raw FFT');
subplot(2, 2, 4);
plot(f(1:half_fft_samples), filtered_fft(1:half_fft_samples));
title('Filtered FFT');
xlabel('Frequency (Hz)');
