function[Jav,wav,dn,e,x] = aaequalizer(av,M,L,h,N,mu,c)
    % av = number of times to average the error or
    % learning curve;
    % w = filter coefficient;
    % N = length of signal s;
    % L = shift of the signal s to become dn;
    % h = assumed impulse response of the channel system;
    % mu = step factor;
    % M = number of adaptive filter coefficients;
    % c = constant multiplier;
    w1 = [zeros(1,M)];
    J = [zeros(1,N)];
    for i = 1:av
        for n = 1:N
            v(n) = c*randn;
            s(n) = rand-.5;
            if s(n) <= 0
                s(n) = -1;
            else
                s(n) = 1;
            end;
        end;
        dn = [zeros(1,L) s(:,1:N-L)];
        ych = filter(h,1,s);
        x = ych(1,1:N)+v;
        [w,y,e] = aalms(x,dn,mu,M);
        w1 = w1 + w;
        J = J + e.^2;
    end;
    Jav = J/av;
    wav = w1/av;
