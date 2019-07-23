
sampling_frequency = 80; % unit: Hz
f_nyquist = sampling_frequency / 2;
sampling_period = 1 / sampling_frequency; % unit: s
duration = 20;
t = [0: sampling_period : duration - sampling_period];

alpha = 0.5;
s = alpha .^ t;
subplot(3, 1, 1);
plot(t, s);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Time Domain')

X_mag = abs(fft(s));
N = length(s);
N_2 = ceil(N/2);
f_bins = [0:N-1];
f_hz = f_bins * sampling_frequency / N;
f_norm = (f_bins * sampling_frequency / N) / f_nyquist;
axis tight

subplot(3, 1, 2);
% plot(f_bins, X_mag);
%plot(f_hz(1:N_2), X_mag(1:N_2));
plot(f_norm(1:N_2), X_mag(1:N_2));
%xlabel('frequency (bins)');
xlabel('frequency (Hz)');
ylabel('Amplitude');
title('DTFT')
axis tight

%{
f = 1760;
alpha = 0.9;
s = alpha .^ t;

fft_samples = length(s);
half_samples = fft_samples / 2;

s_fft = fft(s);
s_fft_mag = abs(s_fft);
s_fft_phase = angle(y);

subplot(3, 2, 1);
plot(t, s);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Time Domain')

subplot(3, 2, 1);
plot(s_fft_mag);
xlim([-3, 3]);
subplot(3, 2, 2);
plot(s_fft_phase);
xlim([-3, 3]);
%}
%{
t = 1:100;
y = 4 * sin(50 * t) ./ (6 * t);
figure, plot(t, abs(y)), title('Amplitude plot')
figure, plot(t, angle(y)), title('Phase plot')
%}
