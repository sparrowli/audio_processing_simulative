% audio_wav = 'samples/or105.wav';
audio_wav = '少年锦时.wav';

info = audioinfo(audio_wav);

fprintf("wav_name = %s\n", info.Filename);
fprintf("wav_compress_type = %s\n", info.CompressionMethod);
fprintf("wav_channels = %g\n", info.NumChannels);
fprintf("wav_sampling_frequency = %g Hz\n", info.SampleRate);
fprintf("wav_samples = %g\n", info.TotalSamples);
fprintf("wav_duration = %g s\n", info.Duration);
fprintf("wav_bit_depth = %g\n", info.BitsPerSample);

%{

note: use the following test to check whether the sample is integer
difference=sum(abs(y0-round(y0)))

y belongs to [-1, 1]
1. convert to short
y0 = y * (2^info.BitsPerSample / 2);

2. convert to byte (Note: unsigned integer [0 255]
y0 = (y + 1) * (2^info.BitsPerSample / 2)  

3. convert to 32-bit integer same as 1

y0 = y * (2^info.BitsPerSample / 2);
%}
