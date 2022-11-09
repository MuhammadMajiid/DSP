close all; clc
inputme = inputdlg({'Enter the value of N for N-DFT: ',...
    'Enter the number of samples of X(n): '}, 'Inputs');
N = str2double(inputme(1)); sizex = str2double(inputme(2));
xn = (1:sizex);
Xk = (1:N);
k  = (0:N-1);
out = zeros(N+1,N);
for i = 1:(sizex)
    samp = inputdlg(strcat('Enter the sample number ', num2str(i), ':'), 'Samples');
    xn(i) = str2double(samp);
end
Xk = fft(xn,N); out(1, (1:end)) = Xk;
for j = 1:N
    for n = 1:N
        Xk(n) = (Xk(n) + xn((j+N)) - xn(j)).*exp(1i*2*pi*k(n)/N);
    end
    for m = 1:N
        out(j+1,m) = Xk(m);
    end
end