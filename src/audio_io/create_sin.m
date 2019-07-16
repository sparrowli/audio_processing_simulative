sampling_rate = 16000;
duration = 4;
frequency = 440;
%{
frequency = linspace(0, 800);

y = generate_sine(duration, frequency, sampling_rate);
time = (1:length(y)) / sampling_rate;

%}

frequency = [100 800];

y = generate_sine02(duration, frequency, sampling_rate);
time = (1:length(y)) / sampling_rate;
sound(y);
plot(time, y);
xlabel('Time (sec)');
ylabel('Amplitude');
ylim([-2, 2]);
title("generated sine wav with frequency 440");