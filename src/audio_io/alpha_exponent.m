% s = 1 / (1 - alpha * e .^ (-j * w))

alpha_e = 0.5;
fs = 20;
sampling_period = 1 / fs;

w_by_pi = [-3:sampling_period:3];
w = w_by_pi * pi;

s = 1 ./ (1 - alpha_e * exp(-j * w));

X_mags= abs(s);
X_phase = angle(s);
subplot(2, 1, 1);
plot(w_by_pi, X_mags);
xlabel('w/pi');

ylabel('Magnitude');
ylim([0.3, 2.3]);
hold on
line([0 0], [0.3, 2.3], 'color', 'r');

subplot(2, 1, 2);
plot(w_by_pi, X_phase);
xlabel('w/pi');
ylabel('Phase in radians');
hold on
line([0 0], [-1, 1], 'color', 'r');
