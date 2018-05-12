function [psdx,freq] = calPSD(input,fs)
    % input : measurement data
    % fs    : freq samp
    % freq  : freq
    % psdx  : power spectral density
    % 
    xdft = fft(input);
    N = length(input);
    xdft = xdft(1:N/2+1);
    psdx = (1/(fs*N)) * abs(xdft).^2;
    psdx(2:end-1) = 2*psdx(2:end-1);
    freq = 0:fs/N:fs/2;
end