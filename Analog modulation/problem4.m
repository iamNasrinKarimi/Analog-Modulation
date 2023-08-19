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

%% USSB
fc = 110;
A_c = 1;
x_c = USSB_mod(x_m,A_c,fc,t);
figure
plot(t,x_c,'b','LineWidth',2)
xlabel('Time(s)','FontSize',12)
ylabel('Amplitude')
title('USSB Modulation')
grid on
axis tight

%% Fourier Transform
N_FFT = 2^nextpow2(length(x_c)); %FFT Sample points
x_c_f = fft(x_c,N_FFT);
x_c_f1 = [x_c,zeros(1,N_FFT-length(x_c))];
f = [0:fs:fs*(length(x_c_f1)-1)]-fs/2;
figure
plot(f,abs(fftshift(x_c_f)),'-b','LineWidth',2)
grid on
title('Spectrum of the Modulation signal (USSB) and fc = 110 Hz');
ylabel('X(f)','FontSize',12)
xlabel('Frequency (Hz)','FontSize',12)
axis tight

%% LSSB
x_c = LSSB_mod(x_m,A_c,fc,t);
figure
plot(t,x_c,'b','LineWidth',2)
xlabel('Time(s)','FontSize',12)
ylabel('Amplitude')
title('LSSB Modulation')
grid on
axis tight

%% Fourier Transform
N_FFT = 2^nextpow2(length(x_c)); %FFT Sample points
x_c_f = fft(x_c,N_FFT);
x_c_f1 = [x_c,zeros(1,N_FFT-length(x_c))];
f = [0:fs:fs*(length(x_c_f1)-1)]-fs/2;
figure
plot(f,abs(fftshift(x_c_f)),'-b','LineWidth',2)
grid on
title('Spectrum of the Modulation signal (LSSB) and fc = 110 Hz');
ylabel('X(f)','FontSize',12)
xlabel('Frequency (Hz)','FontSize',12)
axis tight


