function[w,y,e,J] = aaselfcorsignsignlms(x,dn,mu,M,I)
    [w(1,:), y(1,:), e(1,:), J(1,:)] = aalmssignsign(x,dn,mu,M);
    for i = 2:I
        [w(i,:), y(i,:), e(i,:), J(i,:)] = aalms(y(i-1,:), dn,mu,M);
    end;
    J = e.^2;