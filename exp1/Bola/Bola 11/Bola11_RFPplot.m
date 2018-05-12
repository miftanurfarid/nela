A1=20*log10(2*imag(A(1:NFFT/2+1)));
 A1=imag(A1); 
B1=20*log10(2*imag(B(1:NFFT/2+1)));
 B1=imag(B1);
 C1=20*log10(2*imag(C(1:NFFT/2+1)));
 C1=imag(C1);
 D1=20*log10(2*imag(D(1:NFFT/2+1)));
 D1=imag(D1);
 E1=20*log10(2*imag(E(1:NFFT/2+1)));
 E1=imag(E1);
A2=A1(1:3841);B2=B1(1:3841);
C2=C1(1:3841);D2=D1(1:3841);E2=E1(1:3841);
f1=f(1:3841);%3841 %257
f1=f1';
[alpha1,par1]=rfp(A2,f1,5);
[alpha2,par2]=rfp(B2,f1,5);
[alpha3,par3]=rfp(C2,f1,5);
[alpha4,par4]=rfp(D2,f1,5);
[alpha5,par5]=rfp(E2,f1,5);
alpha1=abs(alpha1);
alpha2=abs(alpha2);
alpha3=abs(alpha3);
alpha4=abs(alpha4);
alpha5=abs(alpha5);
alpha1=alpha1';alpha2=alpha2';alpha3=alpha3';alpha4=abs(alpha4);alpha5=abs(alpha5);
plot(f1,log10(alpha1));xlim([0 750]);title('Frequency response on node 1,2,3,4,5')
xlabel('Frequency (Hz)')
ylabel('amplitude(m/s^2)')