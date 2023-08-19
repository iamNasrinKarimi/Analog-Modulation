function x_est = DSB_demod(x_c,A_c,fc,t)
carrier = 2*A_c*cos(2*pi*fc*t);
y = x_c.*carrier;
z = lowpass(y,.01);
x_est = z/A_c;

end

