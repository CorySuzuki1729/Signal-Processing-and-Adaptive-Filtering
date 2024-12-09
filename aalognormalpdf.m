function[y] = aalognormalpdf(m,s,N)
    for i=1:N
        r1=rand;
        r2=rand;
        z(i)=sqrt(-2*log(r1))*cos(2*pi*r2);
    end;
    x=m+s*z;
    y=exp(x);