% This code can be used to find the optimum filter coefficients
% w_0 and w_1 of the Wiener filter, which approximates the unknown
% system with coefficients b_0 = 1 and b_1 = 0.38.

v = 0.5 * (rand(1, 20)-0.5);
x = randn(1, 20);
sysout = filter([1 0.38], 1, x);
dn = sysout + v;
rx = aasamplebiasedautoc(x, 2);
Rx = toeplitz(rx)
pdx = xcorr(x, dn, 'biased');
p = pdx(1,19:20)
w = inv(Rx) *p'
dnc = aasamplebiasedautoc(dn, 1);
jmin = dnc-p*w