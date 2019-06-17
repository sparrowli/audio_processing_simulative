function output_file = voice_signal_encryption(intput_file)
  [y fs] = audioread(intput_file);
  z = flipud(y);
  for i = 1:length(z)
  	if (z(i) < 0)
  		output_file(i) = -1 - z(i);
  	else
  		output_file(i) = z(i);
    end
  end

  sound(output_file, fs);
  plot(output_file);
end