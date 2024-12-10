% Find the AR coefficients a(1)-a(5) if the autocorrelation of {x(n)} is
% given. Assume the noise variance is equal to one. Find the power spectrum
% of this AR process.

g = 3.5 * (rand(1,500)-0.5);
x = filter(1,[1 -0.9 0.5], g);
[rx, lags] = xcorr(x,x,15,'biased');
R = toeplitz(rx(1,1:6));

R1 = inv(R);
b2 = 1/R1(1,1);
b0 = sqrt(b2);
a = b2 * R1(2:6, 1);

H = b0./(fft([1 a'], 512));
nn = 0:511;
w = 2 * pi * nn/512;
S = (H.*conj(H))/512;
subplot(222);
plot(w, S);
xlabel('\omega');
ylabel('S(w)');
subplot(221);
n=0:49;
stem(n, x(1:50), 'filled');
xlabel('n');
ylabel('x[n]');
subplot(223);
stem(lags, rx, 'filled');
xlabel('Lags');
ylabel('rx[n]');
subplot(224);
X1=fft(x, 512);
Sx=X1.*conj(X1)/512;
plot(w, Sx);
xlabel('\omega')
ylabel('Sx(w)');