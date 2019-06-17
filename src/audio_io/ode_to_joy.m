semitone = [60 62 64 65 67 69 71 72];

% semitone = 69 + 12log(f_Hz / 440, 2);
% f_hz = 440 * (2 ^ ((semitone - 69) / 12))

simple_score = [3 3 4 5 5 4 3 2 1 1 2 3 3 2 2];
beat = [1 1 1 1 1 1 1 1 1 1 1 1 1.5 0.5 2];

fs = 44100;
signal = [];

time = linspace(0, 1 / 2, 16000 / 2);
f = 440 * (2 ^ ((semitone(simple_score(1)) - 69) / 12));

y = sin(2 * pi * f * time);
subplot(3, 1, 1);
plot(time , y);
xlabel('Time (sec)');
ylabel('Amplitude');
title('mi');
subplot(3, 1, 2);
f = 440 * (2 ^ ((semitone(simple_score(2)) - 69) / 12));
y = sin(2 * pi * f * time);
plot(time , y);
xlabel('Time (sec)');
ylabel('Amplitude');
title('fa');
subplot(3, 1, 3);
f = 440 * (2 ^ ((semitone(simple_score(3)) - 69) / 12));
y = sin(2 * pi * f * time);
plot(time , y);
xlabel('Time (sec)');
ylabel('Amplitude');
title('so');
%{

for i = 1 : length(simple_score),
  time = linspace(0, (beat(i) / 2), fs * beat(i) / 2);
  f = 440 * 2 ^ ((semitone(simple_score(i)) - 69) / 12);
  y = sin(2 * pi * f * time);
  signal = [signal y];
end

x = (1:length(signal)) / fs;
plot(x, signal);
xlabel('Time (sec)');
ylabel('Amplitue');
title('ode to joy 欢乐颂');

sound(signal, fs);

%}