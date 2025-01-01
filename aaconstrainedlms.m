function[w,y,e,J,w2] = aaconstrainedlms(x,dn,c,a,mu,M)
    %a = 0.8
    %w2 = matrix whose columns give the history of each coefficient;
    w = zeros(1,M);
    N = length(x);
    for n = M:N
        y(n) = w*x(n:-1:n-M+1);
        e(n) = dn(n)-y(n);
        w1 = w + 2*mu*e(n)*x(n:-1:n-M+1);
        w = w1 +((a-c*w1')*c/(c*c'));
        w2(n-M+1,:) = w(1,:);
    end;
    J = e.^2;