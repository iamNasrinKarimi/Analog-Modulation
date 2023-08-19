%% problem 1
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

%% Fourier Transform
N_FFT = 2^nextpow2(length(x_m)); %FFT Sample points
x_f = fft(x_m,N_FFT);
x_m = [x_m,zeros(1,N_FFT-length(x_m))];
f = [0:fs:fs*(length(x_m)-1)]-fs/2;
figure
plot(f,abs(fftshift(x_f)),'-b','LineWidth',2)
grid on
title('Spectrum of the message signal');
ylabel('X(f)','FontSize',12)
xlabel('Frequency (Hz)','FontSize',12)
axis tight
