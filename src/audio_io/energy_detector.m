samples = 32000;
sampling_rate = 16000;

duration = samples / sampling_rate;

amp_noise = 3;
amp_signal = 1;

pitch = 5000;
tone_samples = 20000;

t = [0:samples-1] / sampling_rate;

sine_t = [0:tone_samples-1] / sampling_rate;

noise = (rand(1, samples) - .5) * amp_noise;
sine_wave = amp_signal * ( sin(2*pi*pitch*sine_t));

sine_position = floor(rand(1, 1) * (samples - tone_samples)) + 1;

signal = noise;
end_sine = sine_position + tone_samples - 1;

signal(sine_position:end_sine) = signal(sine_position:end_sine) + sine_wave;

subplot(5, 1, 1);
plot(t, signal);
hold on

plot(sine_position / sampling_rate, 0, '.r');
hold off
title('Original Signal');

% Step 1: Filter signal
half_band_width = 5;

nyquist = sampling_rate / 2;
ntaps = 200;
high_pass_filter = (pitch - half_band_width) / nyquist;
low_pass_filter = (pitch + half_band_width) / nyquist;
[b, a] = fir1(ntaps, [high_pass_filter, low_pass_filter]);
signal_f = filter(b, a, signal);

subplot(5, 1, 2);
plot(t, signal_f);
hold on

plot(sine_position / sampling_rate, 0, '.r');
hold off
title('Step 1. Filter Signal');

% Step 2: shaping signal
signal_r = abs(signal_f);
subplot(5, 1, 3);
plot(t, signal_r);
hold on

plot(sine_position / sampling_rate, 0, '.r');
hold off
title('Step 2. Rectify Signal');


% step 3: Low-pass filter rectified signal
low_pass_filter_for_envolope = 20 / nyquist;
n_poles = 6;
[b, a] = butter(n_poles, low_pass_filter_for_envolope);
signal_env = filter(b, a, signal_r);
subplot(5, 1, 4);
plot(t, signal_env);
hold on

plot(sine_position / sampling_rate, 0, '.r');
hold off
title('Step 3. Envolope Signal');

% step 4: Threshold signal
threshold = amp_signal / 2;
gated = (signal_env > threshold);
subplot(5, 1, 5);
plot(t, signal_env);
hold on

plot(sine_position / sampling_rate, 0, '.r');
plot(t, gated, 'r');
% ylim([0 2]);
hold off
title('Step 4. Threshold Signal');
xlabel('Time (s)');

