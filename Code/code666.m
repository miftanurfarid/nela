clearvars; close all; clc;
addpath(genpath(pwd));

% check if using windows or linux
if ispc == 1
    sep = '\';
else
    sep = '/';
end

% parameters
fs = 25600;
t = 1/fs;

%% load data
data1 = []; % bola
data2 = []; % dorong
data3 = []; % loncat

for idx = 1:3
    name1 = sprintf('Bola%sbola1%i.lvm', sep, idx);
    name2 = sprintf('Dorong%sdorong%i.lvm', sep, idx);
    name3 = sprintf('Loncat%sloncat%i.lvm', sep, idx);
    temp1 = load(name1);
    temp2 = load(name2);
    temp3 = load(name3);
    data1 = [data1; temp1];
    data2 = [data2; temp2];
    data3 = [data3; temp3];
end

% rata2 dari 3x pengukuran
data1 = data1 / idx;
data2 = data2 / idx;
data3 = data3 / idx;

% fft
l = length(data1);
nfft = 2^nextpow2(l);
f = fs/2*linspace(0,1,nfft/2+1);

% frekuensi tertinggi yang ingin ditampilkan
fmax = 475;
[fval, fpos] = min((f - fmax) .^ 2); % mencari frequency bin 475 hz


DATA1(:,1) = fft(data1(:,2),nfft)/l;
DATA1(:,2) = fft(data1(:,3),nfft)/l;
DATA1(:,3) = fft(data1(:,4),nfft)/l;
DATA1(:,4) = fft(data1(:,5),nfft)/l;
DATA1(:,5) = fft(data1(:,6),nfft)/l;

DATA2(:,1) = fft(data2(:,2),nfft)/l;
DATA2(:,2) = fft(data2(:,3),nfft)/l;
DATA2(:,3) = fft(data2(:,4),nfft)/l;
DATA2(:,4) = fft(data2(:,5),nfft)/l;
DATA2(:,5) = fft(data2(:,6),nfft)/l;

DATA3(:,1) = fft(data3(:,2),nfft)/l;
DATA3(:,2) = fft(data3(:,3),nfft)/l;
DATA3(:,3) = fft(data3(:,4),nfft)/l;
DATA3(:,4) = fft(data3(:,5),nfft)/l;
DATA3(:,5) = fft(data3(:,6),nfft)/l;

% rfp
A1 = imag(20*log10(2*imag(DATA1(1:nfft/2+1,1))));
B1 = imag(20*log10(2*imag(DATA1(1:nfft/2+1,2))));
C1 = imag(20*log10(2*imag(DATA1(1:nfft/2+1,3))));
D1 = imag(20*log10(2*imag(DATA1(1:nfft/2+1,4))));
E1 = imag(20*log10(2*imag(DATA1(1:nfft/2+1,5))));

A2 = imag(20*log10(2*imag(DATA2(1:nfft/2+1,1))));
B2 = imag(20*log10(2*imag(DATA2(1:nfft/2+1,2))));
C2 = imag(20*log10(2*imag(DATA2(1:nfft/2+1,3))));
D2 = imag(20*log10(2*imag(DATA2(1:nfft/2+1,4))));
E2 = imag(20*log10(2*imag(DATA2(1:nfft/2+1,5))));

A3 = imag(20*log10(2*imag(DATA3(1:nfft/2+1,1))));
B3 = imag(20*log10(2*imag(DATA3(1:nfft/2+1,2))));
C3 = imag(20*log10(2*imag(DATA3(1:nfft/2+1,3))));
D3 = imag(20*log10(2*imag(DATA3(1:nfft/2+1,4))));
E3 = imag(20*log10(2*imag(DATA3(1:nfft/2+1,5))));

[alpha11,par11]=rfp(A1(1:fpos),f(1:fpos)',5);
[alpha12,par12]=rfp(A1(1:fpos),f(1:fpos)',5);
[alpha13,par13]=rfp(C1(1:fpos),f(1:fpos)',5);
[alpha14,par14]=rfp(D1(1:fpos),f(1:fpos)',5);
[alpha15,par15]=rfp(E1(1:fpos),f(1:fpos)',5);

[alpha21,par21]=rfp(A2(1:fpos),f(1:fpos)',5);
[alpha22,par22]=rfp(B2(1:fpos),f(1:fpos)',5);
[alpha23,par23]=rfp(C2(1:fpos),f(1:fpos)',5);
[alpha24,par24]=rfp(D2(1:fpos),f(1:fpos)',5);
[alpha25,par25]=rfp(E2(1:fpos),f(1:fpos)',5);

[alpha31,par31]=rfp(A3(1:fpos),f(1:fpos)',5);
[alpha32,par32]=rfp(B3(1:fpos),f(1:fpos)',5);
[alpha33,par33]=rfp(C3(1:fpos),f(1:fpos)',5);
[alpha34,par34]=rfp(D3(1:fpos),f(1:fpos)',5);
[alpha35,par35]=rfp(E3(1:fpos),f(1:fpos)',5);

alpha11=abs(alpha11)';
alpha12=abs(alpha12)';
alpha13=abs(alpha13)';
alpha14=abs(alpha14)';
alpha15=abs(alpha15)';

alpha21=abs(alpha21)';
alpha22=abs(alpha22)';
alpha23=abs(alpha23)';
alpha24=abs(alpha24)';
alpha25=abs(alpha25)';

alpha31=abs(alpha31)';
alpha32=abs(alpha32)';
alpha33=abs(alpha33)';
alpha34=abs(alpha34)';
alpha35=abs(alpha35)';

%% plot
% rfp bola
figure;
plot(f(1:fpos),log10(alpha11));hold on;
plot(f(1:3841),log10(alpha12));
plot(f(1:fpos),log10(alpha13));
plot(f(1:fpos),log10(alpha14));
plot(f(1:fpos),log10(alpha15));axis tight; hold off;
title('Frequency Response Function(bola)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Node 1','Node 2','Node 3','Node 4','Node 5','location','northwest');

% rfp dorong
figure;
plot(f(1:fpos),log10(alpha21));hold on;
plot(f(1:fpos),log10(alpha22));
plot(f(1:fpos),log10(alpha23));
plot(f(1:fpos),log10(alpha24));
plot(f(1:fpos),log10(alpha25));axis tight; hold off;
title('Frequency Response Function (dorong)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Node 1','Node 2','Node 3','Node 4','Node 5','location','northwest');

% rfp lompat
figure;
plot(f(1:fpos),log10(alpha31));hold on;
plot(f(1:fpos),log10(alpha32));
plot(f(1:fpos),log10(alpha33));
plot(f(1:fpos),log10(alpha34));
plot(f(1:fpos),log10(alpha35));axis tight; hold off;
title('Frequency Response Function (loncat)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Node 1','Node 2','Node 3','Node 4','Node 5','location','northwest');

% rfp bola + dorong + lompat
figure;
plot(f(1:fpos),log10(alpha11));hold on;
plot(f(1:fpos),log10(alpha21));
plot(f(1:fpos),log10(alpha31));axis tight; hold off;
title('Frequency Response Function (Node 1)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Bola', 'Lompat', 'Dorong', 'location', 'northwest');

figure;
plot(f(1:fpos),log10(alpha12));hold on;
plot(f(1:fpos),log10(alpha22));
plot(f(1:fpos),log10(alpha32));axis tight; hold off;
title('Frequency Response Function (Node 2)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Bola', 'Lompat', 'Dorong', 'location', 'northwest');

figure;
plot(f(1:fpos),log10(alpha13));hold on;
plot(f(1:fpos),log10(alpha23));
plot(f(1:fpos),log10(alpha33));axis tight; hold off;
title('Frequency Response Function (Node 3)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Bola', 'Lompat', 'Dorong', 'location', 'northwest');

figure;
plot(f(1:fpos),log10(alpha14));hold on;
plot(f(1:fpos),log10(alpha24));
plot(f(1:fpos),log10(alpha34));axis tight; hold off;
title('Frequency Response Function (Node 4)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Bola', 'Lompat', 'Dorong', 'location', 'northwest');

figure;
plot(f(1:fpos),log10(alpha15));hold on;
plot(f(1:fpos),log10(alpha25));
plot(f(1:fpos),log10(alpha35));axis tight; hold off;
title('Frequency Response Function (Node 5)');
ylabel('Amplitude(m/s^2)');
xlabel('Frequency (Hz)');
legend('Bola', 'Lompat', 'Dorong', 'location', 'northwest');