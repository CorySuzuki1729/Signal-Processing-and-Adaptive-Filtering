function[dT] = aadatamatrixcovmeth(x,M)
    %M = number of filter coefficients;
    %x = data vector;
    %dT = transposed data matrix;
    for m = 1:M
        for n=1:length(x)-M+1
            dT(m,n) = x(M-m+n);
        end;
    end;