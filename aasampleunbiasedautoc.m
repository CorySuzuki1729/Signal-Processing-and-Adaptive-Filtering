function[r] = aasampleunbiasedautoc(x, lg)
    N = length(x);
    for m=1:lg
        for n = 1:N+1-m
            xs(m,n)=x(n-1+m);
        end;
    end;
    r1=xs*x';
    for m=1:lg
        den(m) = N+1-m;
    end;
    r=r1'./den;

% Function can be used to find the unbiased autocorrelation function.