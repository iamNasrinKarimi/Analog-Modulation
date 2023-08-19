%% problem 2
clc;
clear all;
close all;
%% start simulation
t0 = 2; % signal duration
fs = 700; % sampling frequency
t = [-t0/2:1/fs:t0/2];
for i=1:length(t)
    if t(i)>=0
        x_m(i) = sinc(10*t(i));
    else
        x_m(i)=0;
    end
end
plot(t,x_m,'-r','LineWidth',2)
grid on
title('Message Signal')
xlabel('Time(s)','FontSize',12)
ylabel('Amplitude','FontSize',12)
axis tight

%% AM , m=.85
mio = .85;
A_c = 1;
FC = [30,70,140,500,1100];
for i = 1:length(FC)
    fc = FC(i);
    figure
    x_c = AM_mod(mio,x_m,A_c,fc,t);
    plot(t,x_c,'r','LineWidth',2)
    xlabel('Time(s)','FontSize',12)
    ylabel('Amplitude')
    title('AM Modulation , m=.85')
    grid on
    axis tight
    legend(sprintf('fc = %i Hz',fc))
end

%% Fourier Transform
fc = 110;
x_c = AM_mod(mio,x_m,A_c,fc,t);
N_FFT = 2^nextpow2(length(x_c)); %FFT Sample points
x_c_f = fft(x_c,N_FFT);
x_c1 = [x_c,zeros(1,N_FFT-length(x_c))];
f = [0:fs:fs*(length(x_c1)-1)]-fs/2;
figure
plot(f,abs(fftshift(x_c_f)),'-b','LineWidth',2)
grid on
title('Spectrum of the Modulation signal (AM) and fc = 110 Hz');
ylabel('X(f)','FontSize',12)
xlabel('Frequency (Hz)','FontSize',12)
axis tight

%% AM Demodulation
fc = 110;
x_c = AM_mod(mio,x_m,A_c,fc,t);
x_est = AM_demod(mio,x_c,A_c,fc,t);
figure
plot(t,x_est,'k-','LineWidth',2)
xlabel('Time(s)','FontSize',12)
ylabel('Amplitude')
title('AM demodulation , m=.85')
grid on
axis tight
