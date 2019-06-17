duration = 3;
rec_object = audiorecorder;
fprintf("Press any button to start record %g s: ", duration);
pause;

fprintf("recording ...\n");

recordblocking(rec_object, duration);

fprintf("record finished\n");

fprintf("Press any button to start play.\n ");

play(rec_object);