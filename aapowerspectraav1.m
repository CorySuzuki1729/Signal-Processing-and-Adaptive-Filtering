function[wa1, v] = aapowerspectraav1(a1,a2,a3,mu,M,N,avn,vr)
    % This function gives the averaged weights to be used to find
    % the approximate spectrum of the output of an AR filter
    % up to the third order.
    wa = zeros(1,M);
    dn = zeros(1,N);
    x = zeros(1,N);
    for k = 1:avn
        for n = 4:N
            v(n) = vr * (rand-.5);
            d(n) = -a1*dn(n-1)-a2*dn(n-2)-a3*dn(n-3)+v(n);
                x(n)=dn(n-1);
        end;
        [w] = aalms(x,dn,mu,M);
        wa = wa + w;
    end;
    wa1 = wa/avn;

    %Plotting the spectra;
    ax = freqz(var(v), [1-[wa1]], 512);
    n = 0:pi/512:pi-(pi/512);
    plot(n, abs(sx));
    xlabel('Radians');
    ylabel('Power spectrum');
    