n=0:31;
s=sin(0.1*2*pi*n);
v=randn(1,32);
x=s+v;
r=xcorr(x,'biased')
fs=fft(s);
fr=fft(r,32);
subplot(3,2,1); stem(n,s,'k'); xlabel('n'); ylabel('s(n)');
subplot(3,2,2); stem(n,v,'k'); xlabel('n'); ylabel('v(n)');
subplot(3,2,3); stem(n,x,'k'); xlabel('n'); ylabel('x(n)');
subplot(3,2,4); stem(n,r(1,32:63), 'k'); xlabel('k, time lags'); ylabel('r(k)');
subplot(3,2,5); stem(n, abs(fs), 'k'); xlabel('freq. bins'); ylabel('S_s(e^{j\omega}');
subplot(3,2,6); stem(n, abs(fr), 'k'); xlabel('freq. bins'); ylabel('S_x(e^{j\omega})');