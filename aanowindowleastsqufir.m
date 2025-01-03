function[R,w,Jmin] = aanowindowleastsqufir(x,M,d)
    %x = data of length N;
    %M = number of filter coefficients;
    %d = desired signal [d(M) d(M+1) ... d(N)]';
    N = length(x);
    for i = 1:M
        for j = 1:N-M+1
            D(i,j) = x(M-i+j);
        end;
    end;
    Dt = D';
    R = D*Dt;
    p = D*d(1,1:N-M+1)';
    w = inv(R)*p;
    Jmin = d'*d-p'*w;