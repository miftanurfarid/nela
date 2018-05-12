function plotFFT(fft,freq,maxF)
    % fft  : data fft
    % freq : data freq
    % maxF : max freq show


    [r,maxX] = min((freq - maxF).^2);
    plot(freq(1:maxX),fft(1:maxX));
end