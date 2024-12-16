function[w, jm] = aawienerfirfilter(x,d,M)
    x = randn(1, 256);
    d = filter([0.9 0.2 -0.4], 1, x);
    M = 4;
    pdx = xcorr(d,x,'biased');
    p = pdx(1, (length(pdx) + 1) /2:((length(pdx)+1) /2)+M-1);
    rx = aasamplebiasedautoc(x, M);
    R = toeplitz(rx);
    w = inv(R) *p';
    jm = var(d)-p*w;