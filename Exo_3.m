clear variables;close all;

i=complex(0,1);

% intervalle temporel
tmin=-5;tmax=5;Te=0.01;
t=tmin:Te:tmax;
N=length(t);

% lorentzienne
f0=(1+(t+1).^2).^(-1);

% signal bruité (bruit gaussien)
f=f0+0.05*randn(1,N);

% intervalle fréquentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);

% transformée de Fourier (initialisation)
tf=zeros(1,length(nu));
% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:N % pour chaque fréquence
tf(k)=trapz(t,f.*exp(-2*i*pi*(nu(k))*t));
end
tff=porte(nu/5).*tf;

tffi=zeros(1,length(t));

for k=1:N % pour chaque instant
tffi(k)=trapz(nu,tff.*exp(2*i*pi*(t(k))*nu));
end

% affichage
figure(1);hold on;
plot(t,f);
plot(t,tffi);
xlabel('temps $(t)$','interpreter','latex');
% affichage
figure(2);
subplot(311);plot(nu,real(tf),'k');xlim([-10,10]);
subplot(312);plot(nu,imag(tf),'k');xlim([-10,10]);

figure(3);
subplot(311);plot(nu,real(tff),'k');xlim([-10,10]);
subplot(312);plot(nu,imag(tff),'k');xlim([-10,10]);

figure(4);hold on;
plot(t,tffi);
xlabel('temps $(t)$','interpreter','latex');
