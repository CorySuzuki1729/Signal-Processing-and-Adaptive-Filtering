function[as, ps, s] = aabartlettpsd(x,k,w,l)
    %x = data;
    %k = number of sections
    %w = window(@name, floor(length(x)/k));
    %L = number desired in the Fourier Transform domain.
    %K = number of points in each section;
    K = floor(length(x)/k);
    s = 0;
    ns = 1;
    for m = 1:k
        s = s + aaperiodogram(x(ns:ns+K-1),w,L)/k;
        ns = ns + K;
    end;
    as = (abs(s).^2/k);
    ps = atan(imag(s)./real(s))/k;