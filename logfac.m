function y = logfac(x)
y=x.*log(x)+0.5*log(2*pi*x)-x+1./(12*x)-1./(360*x.^3);
y(x<10)=log(gamma(x(x<10)+1));