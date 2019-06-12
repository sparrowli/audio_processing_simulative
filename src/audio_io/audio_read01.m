% y belongs to [-1, 1]
[y, fs] = audioread('samples/or105.wav');

sound(y, fs);

time = (1:length(y))/fs;

plot(time, y);
title('or105.wav');

%{
The human ear percepts the pitch is prop to the log of the fundamental frequency.

MIDI standard
semitone = 69 + 12log(Hz/440, 2);

calculate the pitch from one utterance, refers to as Pitch tracking in audio processing.
%}
