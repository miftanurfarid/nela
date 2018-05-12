clearvars; close all; clc;

data1 = load('bola11.lvm'); % load data
data1 = load('bola11.lvm'); % load data

% calculate frequency sampling
[r,c] = min((data1(:,1) - 1).^2);   % asumsi kolom pertama adalah data waktu
fs = c - 1; % frequency sampling of data1

%% calculate PSD using FFT
[psdx,fx] = calPSD(data1(:,2),fs);
[psdy,fx] = calPSD(data1(:,3),fs);
[psdz,fx] = calPSD(data1(:,4),fs);

figure(1);
subplot(311);
plotF(psdx,fx,1000); title('Power Spectral Density of X');
subplot(312);
plotF(psdy,fx,1000); title('Power Spectral Densityof Y');
subplot(313);
plotF(psdz,fx,1000); title('Power Spectral Density of Z');

%% calculate eigenvalues and eigenvector
% parfor idk = 1:length(fx)
%     [Vx(idk),Dx(idk)] = eig(psdx(idk));
% end

% myspectrogram()
% figure(2);
% subplot(311);
% plotF(Vx,fx,1000); title('Eigenvector of X');


%% calculate coherency
% calculate cross spectral density
[csdxy,fx] = calCSD(data1(:,2),data1(:,3),fs);

num = (abs(csdx)).*(abs(csdx));
denum = psdx.*psdy

cohxy = (abs(csdx)).*(abs(csdx)) % coherent xy