clc;
close all;
clear all;
x = input('Enter the sequence for FFT = ');
N = length(x); %finding the length of entered sequence for N point FFT

for k = 1:N %for every value of k
y(k) = 0;
for n = 1:N %for every value of n
y(k) = y(k)+x(n)*exp(-1i*2*pi*(k-1)*(n-1)/N); %as per FFT formula 0 to n-1
end
end

t = 0:N-1;
subplot(3,1,1);
stem(t,x); % for discrete plotting
%plotting input sequence
ylabel('Amplitude');
xlabel('n');
title('Input');

magnitude = abs(y); % absolute values of individual FFT complex
disp('FFT : ');
disp(magnitude);

t = 0:N-1;
subplot(3,1,2);
stem(t,magnitude);
%plotting FFT sequence
ylabel('Amplitude');
xlabel('K');
title('FFT');

R = length(y); %length of the fft array

for n = 1:R
x1(n) = 0;
for k = 1:R %loop as per the IFFT formula
    x1(n) = x1(n)+(1/R)*y(k)*exp(1i*2*pi*(k-1)*(n-1)/R);
end
end


t = 0:R-1;
subplot(3,1,3);
stem(t,x1);
%ploting IFFT sequence
disp('IFFT :');
disp(x1);
ylabel('Amplitude');
xlabel('n');
title('IFFT');