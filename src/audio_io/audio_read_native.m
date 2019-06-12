flac = 'samples/at_the_remote_place.flac';

[y fs] = audioread(flac, [1 441000], 'native');

p = audioplayer(y, fs);
play(p);

time = (1:length(y))/fs;
left = y(:, 1);
right = y(:, 2);

subplot(2, 1 ,1),
plot(time, left);
title("left channel of native\_data\_type");

subplot(2, 1 ,2),
plot(time, right);
title("right channel of native\_data\_type");
disp(class(y)); 
