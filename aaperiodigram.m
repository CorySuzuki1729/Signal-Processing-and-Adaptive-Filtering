function[s] = aaperiodigram(x,w,L)
    % L = desired number of bins of the spectrum;
    % x = data points in row vector notation;
    % w = window(@name, length(x)), name=hamming, kaiser, hann, bartlett
    % tukeywin, blackman, gausswin, natallwin, triang, blackmanharris
    xw = x.*w';
    for m = 1:L
        n = 1:length(x);
        s(m) = sum(xw.*exp(-j*(m-1)*(2*pi/L)*n));
    end;

    % as = ((abs(s)).^2/length(x))/norm(w) = amplitude spectral density;
    % ps = (atan(imag(s)./real(s))/length(x))/norm(w) = phase spectrum;
    % plot(0.2*pi/L:2*pi-(2*pi/L),as)
