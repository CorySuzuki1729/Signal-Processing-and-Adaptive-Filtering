% First Plot

t = 0:1:4;
x = exp(-t);
dftx1 = fft(x, 32);
w = 0:2*pi/32:2*pi-(2*pi/32);
subplot(211);
stem(w, abs(dftx1));
FT1 = 1./sqrt(1+w.^2);
hold on;
stem(w, abs(FT1), 'filled');
xlabel('\omega');
ylabel('Magnitudes of FT DFT');
title('(a)');
axis([0 2*pi 0 2]);
legend('DFT', 'FT');

% Second Plot

nt = 0:0.5:4;
x = exp(-nt);
dftx2 = 0.5 * fft(x,32);
w = 0:4*pi/32:4*pi-(4*pi/32);
subplot(212);
stem(w, abs(dftx2));
FT2 = 1./sqrt(1+w.^2);
hold on;
stem(w, abs(FT2), 'filled');
xlabel('\omega');
ylabel('Magnitudes of FT and DFT');
title('(b)');
axis([0 4*pi 0 1.5]);
legend('DFT', 'FT');