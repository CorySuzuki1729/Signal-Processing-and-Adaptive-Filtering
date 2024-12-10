function[s] = aacorrelogram(x, w, lg, L)
    % x = data with mean zero, w = window(@name, length(2*lg))
    % L = number of desired spectral points
    % lg = lag number, rc = symmetric autocorrelation function

    r = aasamplebiasedautoc(x, lg);
    rc = [fliplr(r(1, 2:lg)) r 0];
    rcw = rc.*w';
    for m = 1:L
        n = -lg+1:lg;
        s(m) = sum(rcw.*exp(-j*(m-1)*(2*pi/L)*n));
    end;
    % asc = (abs(s).^2)/norm(w) = amplitude spectrum
    % psc = (atan(imag(s))/real(s))/norm(w) = phase spectrum