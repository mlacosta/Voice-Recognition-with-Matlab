rec=audiorecorder(48000,16,1);
disp('Start speaking.')
recordblocking(rec, 1);
disp('End of Recording.');
y = getaudiodata(rec);
% soundsc(y,48000)