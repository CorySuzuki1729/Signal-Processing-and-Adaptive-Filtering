function[x, m, sd] = aaexponentialpdf(b,N)
    for i=1:N
        x(i) = -b*log(rand);
    end;
    m=mean(x);
    sd=std(x);