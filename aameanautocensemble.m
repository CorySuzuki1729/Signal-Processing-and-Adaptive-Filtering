function[mx, rx] = aameanautocensemble(M, N)
    x = randn(M, N);
    mx = sum(x,1)/M;
    for i = 1:N
        rx(i) = sum(x(:,1).*x(:,i))/M;
    end;

% Function to find the mean and autocorrelation function using the frequency interpretation formula.