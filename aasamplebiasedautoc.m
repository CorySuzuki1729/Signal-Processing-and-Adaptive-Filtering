function[r] = aasamplebiasedautoc(x, lg)
    N=length(x);
    for m=1:lg
        for n=1:N+1-m
            xs(m,n) =x(n-1+m);
        end;
    end;
    r1=xs*x';
    r=r1'./N

%We can also use the Matlab built in functions to compute biased or unbiased sample autocorrelation and 
%cross-correlation.

%r=xcorr(x,y,'biased');
%r=xcorr(x,y,'unbiased');
