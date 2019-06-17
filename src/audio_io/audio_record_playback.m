fs = 44100;
bit_depth = 16;
channels = 2;
duration = 4;

audio_file = 'we_are_you.wav';


rec_object = audiorecorder(fs, bit_depth, channels);

fprintf("Press any button to start record %g s: ", duration);
pause;

fprintf("recording ...\n");

recordblocking(rec_object, duration);

fprintf("record finished\n");

fprintf("Press any button to start play.\n ");

play(rec_object);
pause;

y = getaudiodata(rec_object, 'double');

m = y(:, 1);

%{
m1 = resample(y, 1000, 44100);
sound(m1, 1000);
plot(m1);
%}

%{
k = 0.1;
m2 = m + k * randn(length(m), 1);
sound(m2, fs);
plot(m2);
%}

%{
for c = 1:length(m)
  if (m(c) <= 0.5 && m(c) >= -0.5)
  	z(c) = 0.0;
  else
    z(c) = m(c);
  end

end

sound(z, fs);

audiowrite(audio_file, flipud(y), fs);

time = (1:length(z))/fs;
left = z(:, 1);
right = z(:, 2);
plot(time, z);
ylim([-1.0 1.0]);
title('out of [-0.5, 0.5] set 0');
%}
%{
Note: length return samples per channel
disp(length(y));
disp(length(left));
disp(length(right));
%}
%{
time_left = (1:length(left))/fs;
subplot(2, 1, 1);
plot(time_left, left .^ 2);
xlabel('Time (sec)');
ylabel('Amplitude');
title("Record replay left");

time_right = (1:length(right))/fs;
subplot(2, 1, 2);
plot(time_right, right .^ 2);
xlabel('Time (sec)');
ylabel('Amplitude');
title("Record replay right");
%}