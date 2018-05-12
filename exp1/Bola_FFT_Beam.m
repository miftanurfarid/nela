%clear
%clc
a1 = [];
b1 = [];
c1 = [];
d1 = [];
e1 = [];

for idx = 1 : 3
    filename = sprintf('bola1%i.lvm',idx)
    data = load('bola11.lvm');
    a1 = [a1 data(:,2)];
    b1 = [a1 data(:,3)];
    c1 = [a1 data(:,4)];
    d1 = [a1 data(:,5)];
    e1 = [a1 data(:,6)];
end

a1 = mean(a1');
b1 = mean(b1');
c1 = mean(c1');
d1 = mean(d1');
e1 = mean(e1');

Fs   = 25600;
T    = 1/Fs;                     % Sample time
L    = length(a1);               % Length of signal
L    = length(b1);               % Length of signal
NFFT = 2^nextpow2(L);
A    = fft(a1,NFFT)/L;
f    = Fs/2*linspace(0,1,NFFT/2+1);

%sinyal 2
NFFT = 2^nextpow2(L);
B    = fft(b1,NFFT)/L;
f    = Fs/2*linspace(0,1,NFFT/2+1);

%sinyal 3
C    = fft(c1,NFFT)/L;
D    = fft(d1,NFFT)/L;
E    = fft(e1,NFFT)/L;
% Plot single-sided amplitude spectrum.
subplot(5,1,1)
    plot(f,2*abs(A(1:NFFT/2+1)),'r','linewidth',2);%axis([0 500 0 5]) ;
    set(gca,'fontsize',12);
    xlim([0 750]);
    title('Frequency response on node 1')
    xlabel('Frequency (Hz)')
    ylabel('amplitude(m/s^2)')
subplot(5,1,2)
    plot(f,2*abs(B(1:NFFT/2+1)),'r','linewidth',2);%axis([0 500 0 3]) ;
    set(gca,'fontsize',12);
    xlim([0 750]);
    title('Frequency response on node 2')
    xlabel('Frequency (Hz)')
    ylabel('amplitude(m/s^2)')
subplot(5,1,3)
    plot(f,2*abs(C(1:NFFT/2+1)),'r','linewidth',2);%axis([0 500 0 3]) ;
    set(gca,'fontsize',12);
    xlim([0 750]);
    title('Frequency response on node 3')
    xlabel('Frequency (Hz)')
    ylabel('amplitude(m/s^2)')
subplot(5,1,4)
    plot(f,2*abs(D(1:NFFT/2+1)),'r','linewidth',2);%axis([0 500 0 3]) ;
    set(gca,'fontsize',12);
    xlim([0 750]);
    title('Frequency response on node 4')
    xlabel('Frequency (Hz)')
    ylabel('amplitude(m/s^2)')
subplot(5,1,5)
    plot(f,2*abs(E(1:NFFT/2+1)),'r','linewidth',2);%axis([0 500 0 3]) ;
    set(gca,'fontsize',12);
    xlim([0 750]);
    title('Frequency response on node 5')
    xlabel('Frequency (Hz)')
    ylabel('amplitude(m/s^2)')
%untuk mencari RMS velocity yaitu
% accelerationrms = rms(y);
% velocity = cumtrapz(a,y); % v(velocity) merupakan integral dari percepatan terhadap waktu 
% displacement=cumtrapz(a,velocity);
% Vdisp=rms(displacement);
% Vrms = rms(velocity); % b adalah velocity rms(mm/s)

