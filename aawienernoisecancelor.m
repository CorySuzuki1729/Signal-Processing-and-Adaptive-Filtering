function[d,w,xn] = aawienernoisecancelor(dn,a1,a2,v,M,N)
    %dn = desired signal
    %a1 = first order IIR coefficient
    %a2 = second order IIR coefficient
    %v = noise
    %M = number of Wiener filter coefficients
    %N = number of sequences
    %d = outputted desired signal
    %w = Wiener filter coefficients
    %xn = corrupted signal
    v1(1) = 0;
    v2(1) = 0;
    for n = 2:N
        v1(n) = a1 * v1(n-1) + v(n-1);
        v2(n) = a2 * v2(n-1) + v(n-1);
    end;
    v2autoc = aasamplebiasedautoc(v2, M);
    xn = dn + v1;
    Rv2 = toeplitz(v2autoc);
    p1 = xcorr(xn, v2, 'biased');
    if M>N
        disp(['error: M must be less than N']);
    end;
    R = Rv2(1:M, 1:M);
    p = p1(1, (length(p1)+1)/2:(length(p1)+1)/2+M-1);
    w = inv(R) *p';
    yw = filter(w, 1, v2);
    d = xn - yw(:, 1:N);
