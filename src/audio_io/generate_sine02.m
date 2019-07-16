function signal = generate_sine02(duration, frequency, sampling_rate)

  time = (0:duration * (sampling_rate - 1)) / sampling_rate;

  fi0 = frequency(1);
  fi1 = frequency(2);
  fi = linspace(fi0, fi1, length(time));

  y = sin(2 * pi * fi);
  signal = y;

end