flac = 'samples/at_the_remote_place.flac';

% [y fs] = audioread(flac);
[y fs] = audioread(flac, [44100, 45100]);

info = audioinfo(flac);
sound(y, fs);
fprintf("wav_name = %s\n", info.Filename);
fprintf("wav_compress_type = %s\n", info.CompressionMethod);
fprintf("wav_channels = %g\n", info.NumChannels);
fprintf("wav_sampling_frequency = %g Hz\n", info.SampleRate);
fprintf("wav_samples = %g\n", info.TotalSamples);
fprintf("wav_duration = %g s\n", info.Duration);
fprintf("wav_bit_depth = %g\n", info.BitsPerSample);

left = y(:, 1);
right = y(:, 2);

time = (1:length(y))/fs;
subplot(2, 1 ,1),
plot(time, left);
title("left channel of at\_the\_remote\_place.flac");

subplot(2, 1 ,2),
plot(time, right);
title("right channel of at\_the\_remote\_place.flac");

%{
Given a mono audio file, How to create one stereo in which sound transfer from left to right, or inverse.

this weak, the other one strong.
%}


