function[as, ps, s, K] = aawelch(x, w, D, L)
    M = length(w);
    % L = number of samples desired in frequency domain.
    % w = window(@name, length(w))
    % x = data;
    % D = offset distance 
    N = length(x);
    M = length(w);
    K = floor((N-M+D)/D);
    s = 0;
    for i = 1:K
        s = s + aaperiodogram(x(1, (i-1)*D+M), w, L);
    end;
    as = (abs(s)).^2/ (M*K);
    ps = atan(imag(s)./real(s))/(M*K);