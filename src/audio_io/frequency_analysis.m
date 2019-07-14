sampling_frequency = 80; % unit: Hz
sampling_period = 1 / sampling_frequency; % unit: s
duration = 1;
%t = [0: sampling_period : duration - sampling_period];
t = [0: sampling_period : duration - sampling_period];

f = 4;
s = sin(2*pi*f .* t);

fft_pts = length(s);
half_pts = fft_pts / 2; % half of the number points in FFT

s_fft = fft(s); % Calculate Fast Fourier Transform
s_fft_mag = abs(s_fft); % Take abs to return the magnitude of the frequency components
s_fft_mag_scaled = s_fft_mag / half_pts; % scale FFT result by half of the number of points used in the FFT

% Note the difference of index with frequecy: |frequecy = index - 1|
% as the indice start from 1 
[max_magnitude, index] = max(s_fft_mag_scaled(1:half_pts)); 

bin_width = sampling_frequency / fft_pts; % frequency resolution: 80 Hz sampling frequency / 80 points in FFT
f = [0:bin_width:sampling_frequency - bin_width];

subplot(2, 1, 1);
plot(t, s);
ylim([-2, 2]);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Time Domain');
grid on

subplot(2, 1, 2);
plot(f(1:half_pts), s_fft_mag_scaled(1:half_pts));
ylim([0, 2]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain');
grid on
