function x_est = AM_demod(mio,x_c,A_c,fc,t)
carrier = 2*cos(2*pi*fc*t);
y = x_c.*carrier;
z = lowpass(y,.01);  % z = abs(hilbert(x_c));
x_est = ((z/A_c)-1)/mio;

end

