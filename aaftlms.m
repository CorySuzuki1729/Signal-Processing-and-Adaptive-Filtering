function[A] = aaftlms(x,d,M,I,mu)
    wk = zeros(1,M);
    for i=0:I
        if I*M>length(x)-1
            ('error:I*M<length(x)-1')
        end;
        x1 = x(M*(i+1):-1:i*M+1);
        d1 = d(M*(i+1):-1:i*M+1);
        xk = fft(x1);
        dk = fft(d1);
        yk = wk.*xk;
        ek = dk-yk;
        wk = wk + 2*mu*ek.*conj(xk);
        A(i+1,:) = wk;
    end;