function[w,y,e,J] = aalms(x,dn,mu,M)
    % x = input data to the filter;
    % dn = desired signal;
    % M = order of the filter;
    % mu = step size factor;
    % x and dn must be the same length;
    N = length(x);
    y = zeros(1,N);
    w = zeros(1,M);
    for n = M:N
        x1 = x(n:-1:n-M+1);
        y(n) = w*x1';
        e(n) = dn(n)-y(n);
        w = w + 2*mu*e(n)*x1;
    end;
    J = e.^2;
    % J is the learning curve of the adaptation.