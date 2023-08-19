function x_c = DSB_mod(x_m,A_c,fc,t)
carrier_c = cos(2*pi*fc*t);
x_c = A_c*x_m.*carrier_c;

end

