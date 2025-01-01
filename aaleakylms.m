function[w,y,e,J,w1] = aaleakylms(x,dn,mu,gama,M)
    N = length(x);
    y = zeros(1,N);
    w = zeros(1,M);
    for n = M:N
        x1 = x(n:-1:n-M+1);
        y(n) = w*x1';
        e(n) = dn(n)-y(n);
        w = (1-2*mu*gama)*w+2*mu*e(n)*x1;
        w1(n-M+1,:) = w(1,:);
    end;
    J = e.^2;