function signal = generate_sine(duration, frequency, sampling_rate)
  % time = linspace(0, duration, sampling_rate * duration);
  duration_per_frequency = duration / length(frequency);
  time = linspace(0, duration_per_frequency, sampling_rate * duration_per_frequency);
  signal = [];
  for i = 1:length(frequency)
    y = sin(2 * pi * frequency(i) * time);
    signal = [signal y];
  end
end