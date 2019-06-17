fs = 44100;
bit_depth = 16;
channels = 2;
duration = 30;

audio_file = '少年锦时.wav';


rec_object = audiorecorder(fs, bit_depth, channels);

fprintf("Press any button to start record %g s: ", duration);
pause;

fprintf("recording ...\n");

recordblocking(rec_object, duration);

fprintf("record finished\n");

fprintf("Press any button to start play.\n ");

play(rec_object);

y = getaudiodata(rec_object, 'double');

audiowrite(audio_file, y, fs);

time = (1:length(y))/fs;
left = y(:, 1);
right = y(:, 2);
%{
Note: length return samples per channel
disp(length(y));
disp(length(left));
disp(length(right));
%}
time_left = (1:length(left))/fs;
subplot(2, 1, 1);
plot(time_left, left);
xlabel('Time (sec)');
ylabel('Amplitude');
title("Record replay left");

time_right = (1:length(right))/fs;
subplot(2, 1, 2);
plot(time_right, right);
xlabel('Time (sec)');
ylabel('Amplitude');
title("Record replay right");