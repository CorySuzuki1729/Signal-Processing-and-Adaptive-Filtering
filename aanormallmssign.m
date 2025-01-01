function[w,y,e,J,w1] = aanormallmssign(x,dn,mu,M,ep)
    %x = input data to the filter;
    %M = order of the filter;
    %mu = step size parameter;
    %ep=sm
    N = length(x);
    y = zeros(1,N);
    w = zeros(1,M);
    for n = M:N
        x1 = x(n:-1:n-M+1);
        y(n) = w*x1';
        e(n) = dn(n)-y(n);
        w = w + 2 * mu * sign(e(n)) *x1/(ep+x1*x1');
        w1(n-M+1,:) = w(1,:);
    end;
    J = e.^2;