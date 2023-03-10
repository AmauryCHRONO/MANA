clear variables;close all;
i=complex(0,1);

% intervalle temporel
tmin=-5;tmax=5;Te=0.01;
t=tmin:Te:tmax;
N=length(t);
v1=20;v2=45;

% gaussien
%f0=exp(-5*pi*(t-1).^2);
f0=triangle(t);

f1=0.05*cos(2*pi*v1*t)+0.02*cos(2*pi*v2*t);

% signal bruité 
f=f0+f1;

% intervalle fréquentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);

% transformée de Fourier (initialisation)
tf=zeros(1,length(nu));

% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:N % pour chaque fréquence
tf(k)=trapz(t,f.*exp(-2*i*pi*nu(k)*t));
end
%tff=porte(nu/80).*tf;
tff=porte(nu/30).*tf;

tffi=zeros(1,length(t));

for k=1:N % pour chaque instant
tffi(k)=trapz(nu,tff.*exp(2*i*pi*(t(k))*nu));
end


figure(1);hold on;
subplot(211);plot(t,f);
% subplot(612);plot(nu,real(tf));
% subplot(613);plot(nu,imag(tf));
% subplot(614);plot(nu,real(tff));
% subplot(615);plot(nu,imag(tff));
subplot(212);plot(nu,real(tffi));
