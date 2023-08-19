function x_c = LSSB_mod(x_m,A_c,fc,t)
carrier_c = cos(2*pi*fc*t);
carrier_s = sin(2*pi*fc*t);
w = imag(hilbert(x_m)); 
x_c = A_c*(x_m.*carrier_c+w.*carrier_s)./2;

end

