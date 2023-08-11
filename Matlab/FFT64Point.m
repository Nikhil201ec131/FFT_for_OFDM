% FFT 64-point

% Define Mode %0 for FFT, 1 for IFFT
mode = 0;

% Twiddle Factor for 8 point FFT
Wn8 = zeros(1,64);
for i=1:1:64
	Wn8(i) = cos(-2*pi*(i-1)/8)+1i*sin(-2*pi*(i-1)/8);
end

% Wn8_1 = (sqrt(2)/2)-j*(sqrt(2)/2);
% Wn8_2 = 0 - j*1;
% Wn8_3 = -(sqrt(2)/2)-j*(sqrt(2)/2);

% Twiddle Factor for 64 point FFT
Wn64 = zeros(1,64);
for i=1:1:64
    Wn64(i)=cos(-2*pi*(i-1)/64)+1j*sin(-2*pi*(i-1)/64);
end

% Input Vector (Manual Input)

B64(1)  = 1 + 1i*0.000;
B64(2)  = 1 + 1i*0.000;
B64(3)  = 0.003 + 1i*0.003;
B64(4)  = 0.004 + 1i*0.004;
B64(5)  = 0.005 + 1i*0.005;
B64(6)  = 0.006 + 1i*0.006;
B64(7)  = 0.007 + 1i*0.007;
B64(8)  = 0.008 + 1i*0.008;
B64(9)  = -0.001 + 1i*0.001;
B64(10) = -0.002 + 1i*0.002;
B64(11) = -0.003 + 1i*0.003;
B64(12) = -0.004 + 1i*0.004;
B64(13) = -0.005 + 1i*0.005;
B64(14) = -0.006 + 1i*0.006;
B64(15) = -0.007 + 1i*0.007;
B64(16) = -0.008 + 1i*0.008;
B64(17) = 0.001 - 1i*0.001;
B64(18) = 0.002 - 1i*0.002;
B64(19) = 0.003 - 1i*0.003;
B64(20) = 0.004 - 1i*0.004;
B64(21) = 0.005 - 1i*0.005;
B64(22) = 0.006 - 1i*0.006;
B64(23) = 0.007 - 1i*0.007;
B64(24) = 0.008 - 1i*0.008;
B64(25) = -0.001 - 1i*0.001;
B64(26) = -0.002 - 1i*0.002;
B64(27) = -0.003 - 1i*0.003;
B64(28) = -0.004 - 1i*0.004;
B64(29) = -0.005 - 1i*0.005;
B64(30) = -0.006 - 1i*0.006;
B64(31) = -0.007 - 1i*0.007;
B64(32) = -0.008 - 1i*0.008;
B64(33) = 0.001 + 1i*0.001;
B64(34) = 0.002 + 1i*0.002;
B64(35) = 0.003 + 1i*0.003;
B64(36) = 0.004 + 1i*0.004;
B64(37) = 0.005 + 1i*0.005;
B64(38) = 0.006 + 1i*0.006;
B64(39) = 0.007 + 1i*0.007;
B64(40) = 0.008 + 1i*0.008;
B64(41) = -0.001 + 1i*0.001;
B64(42) = -0.002 + 1i*0.002;
B64(43) = -0.003 + 1i*0.003;
B64(44) = -0.004 + 1i*0.004;
B64(45) = -0.005 + 1i*0.005;
B64(46) = -0.006 + 1i*0.006;
B64(47) = -0.007 + 1i*0.007;
B64(48) = -0.008 + 1i*0.008;
B64(49) = 0.001 - 1i*0.001;
B64(50) = 0.002 - 1i*0.002;
B64(51) = 0.003 - 1i*0.003;
B64(52) = 0.004 - 1i*0.004;
B64(53) = 0.005 - 1i*0.005;
B64(54) = 0.006 - 1i*0.006;
B64(55) = 0.007 - 1i*0.007;
B64(56) = 0.008 - 1i*0.008;
B64(57) = -0.001 - 1i*0.001;
B64(58) = -0.002 - 1i*0.002;
B64(59) = -0.003 - 1i*0.003;
B64(60) = -0.004 - 1i*0.004;
B64(61) = -0.005 - 1i*0.005;
B64(62) = -0.006 - 1i*0.006;
B64(63) = -0.007 - 1i*0.007;
B64(64) = -0.008 - 1i*0.008;



%Swapping Unit for IFFT
if(mode==1)
    for i=1:1:64
        B64(i) = imag(B64(i))+1j*real(B64(i));
    end
end

% Convert to Fixed Point in Hexadecimal
B64_Fixed = cell(1,64);
for i=1:1:64
	B64_real_temp = fi(real(B64(i)),1,16,12);
	B64_imag_temp = fi(imag(B64(i)),1,16,12);
    B64_Fixed(i)  = cellstr(dec2hex(bin2dec(strcat(B64_real_temp.bin,B64_imag_temp.bin)),8));
    % Overwrite the value of input
    %B64(i) = B64_real_temp.double + j*B64_imag_temp.double;
end

B64_Fixed = transpose(B64_Fixed);

% Computing Equation (3)
A64 = zeros(1,64);
T64 = zeros(1,64);
T64_1 = zeros(1,64);
for t=0:1:7
	for s=0:1:7
		temp2 = 0;
		for l=0:1:7
			temp =0;
			for m=0:1:7
				temp = temp+B64(l+8*m+1)*Wn8(s*m+1);
                
  end
            T64(s+8*l+1) = temp;
			T64_1(s+8*l+1) = temp*Wn64(s*l+1);
			temp2 = temp2 + temp*Wn64(s*l+1)*Wn8(l*t+1);
 end
		A64(s+8*t+1) = temp2;
end
end

% Intermediate Data
T64_Fixed = cell(1,64);
for i=1:1:64
	T64_real_temp = fi(real(T64(i)),1,16,12);
	T64_imag_temp = fi(imag(T64(i)),1,16,12);
    T64_Fixed(i)  = cellstr(dec2hex(bin2dec(strcat(T64_real_temp.bin,T64_imag_temp.bin)),8));
end
T64_Fixed = transpose(T64_Fixed);

T64_1_Fixed = cell(1,64);
for i=1:1:64
	T64_1_real_temp = fi(real(T64_1(i)),1,16,12);
	T64_1_imag_temp = fi(imag(T64_1(i)),1,16,12);
    T64_1_Fixed(i)  = cellstr(dec2hex(bin2dec(strcat(T64_1_real_temp.bin,T64_1_imag_temp.bin)),8));
end

T64_1_Fixed = transpose(T64_1_Fixed);

%Swapping Unit for IFFT
if(mode==1)
    for i=1:1:64
        A64(i) = imag(A64(i))+1j*real(A64(i));
    end
end

% Convert Fixed Point in Hexadecimal
A64_Fixed = cell(1,64);
for i=1:1:64
	A64_real_temp = fi(real(A64(i)),1,16,12);
	A64_imag_temp = fi(imag(A64(i)),1,16,12);
    A64_Fixed(i)  = cellstr(dec2hex(bin2dec(strcat(A64_real_temp.bin,A64_imag_temp.bin)),8));
end


