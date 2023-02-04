# FFT_for_OFDM
The objective of the project is to design a 64-point Fast Fourier Transform chip. This chip has been
successfully simulated and tested. It performs a forward and inverse 64-point FFT on a complex two-s
complement data set in 23 clock cycles, making it suitable for high-speed data communication systems
like computer networking and radio/satellite communication.

The 64-point FFT is realised by decomposing a 64-point FFT into a two-dimensional structure of 8- point FFTs.
The main benefit of using this approach for the FFT processor is that it requires less
complex multiplication as compared to the conventional radix-2 64-point FFT algorithm. The same
unit can be used for both FFT and IFFT by just swapping its real and imaginary parts , and we all know
that the multiplier is the main component in FFT that consumes a lot of space. Since multipliers are
typically very power-hungry elements in a VLSI design, this type of arrangement results in significant
power consumption.
