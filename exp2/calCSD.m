function [csdx,freq] = calCSD(input1,input2,fs)
    % input : measurement data
    % fs    : freq samp
    % freq  : freq
    % psdx  : cross spectral density
    % 
    % if length(input1) > length(input2)
    %     input1 = input(1:length(input2));
    % else 
    %     input2 = input(1:length(input1));
    % end

    xdft1 = fft(input1);
    xdft2 = fft(input2);
    N1 = length(input1);
    N2 = length(input2);
    xdft1 = xdft1(1:N1/2+1);
    xdft2 = xdft1(1:N2/2+1);
    csdx = (1/(fs*N1)) * (xcorr(abs(xdft1),abs(xdft2)));
    csdx(2:end-1) = 2*csdx(2:end-1);
    freq = 0:fs/N1:fs/2;
end