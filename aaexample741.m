function[ems] = aaexample741(mu,M,an)
    an = 120;
    eav = zeros(1,1000);
    dn(1) = 0;
    dn(2) = 0;
    x(1) = 0;
    x(2) = 0;
    for k = 1:an
        for n = 3:1000
            dn(n) = 0.96*dn(n-1)-0.2*dn(n-2)+2*(rand-0.5);
            x(n) = dn(n-1);
        end;
        [w, y, e] = aalms(x, dn, 0.04, 2);
        eav = eav + e.^2;
    end;
    ems = eav/an;