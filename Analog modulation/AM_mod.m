function x_c = AM_mod(mio,x_m,A_c,fc,t)
carrier = cos(2*pi*fc*t);
x_c = A_c*(1+mio*x_m).*carrier;

end

