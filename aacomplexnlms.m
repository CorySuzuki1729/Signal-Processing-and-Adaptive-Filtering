function[w,y,e,J,w1] = aacomplexnlms(x,dn,mubar,M,c)
    % x = input data to the filter;
    % dn = desired signal;
    % M = filter order;
    % c = constant;
    % mubar = step size equivalent parameter;
    % J = learning curve;
    % x and dn must be of the same length;

    N = length(x);
    y = zeros(1,N);
    w = zeros(1,M);
    for n = M:N
        x1 = x(n:-1:n-M+1);
        y(n) = conj(w) *x1';
        e(n) = dn(n) - y(n);
        w = w + (mubar/(c+conj(x1)*x1')) *conj(e(n)) * x1;
        w1(n-M+1,:) = w(1,:);
    end;
    J = e.^2;