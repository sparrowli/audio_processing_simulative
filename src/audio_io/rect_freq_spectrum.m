N = 10;
t = [0, N - 1];
s = ones(length(t));

w = linspace(-5, 5);
X = sin(w*N / 2) / sin(w / 2);

subplot(2, 1, 1);
plot(w, X);
xlabel('w (*pi rads)');

subplot(2, 1, 2);
plot(abs(fft(s)));

