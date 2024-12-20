function[w,y,e,J,w1] = aalmsonesteppredictor(x,mu,M)
    % x = data = signal plus noise;
    % mu = step size factor;
    % M = number of filter coefficients;
    % w1 is a matrix with each column being the history of each
    % filter coefficient versus time n;
    N = length(x);
    y = zeros(1,N);
    w = zeros(1,M);
    for n = M:N-1
        x1 = x(n:-1:n-M+1);
        y(n) =w*x1';
        e(n) = x(n+1)-y(n);
        w = w + 2*mu*e(n)*x1;
        w1(n-M+1, :) = w(1,:);
    end;
    J = e.^2;
    % J is the learning curve of the adaptive process;