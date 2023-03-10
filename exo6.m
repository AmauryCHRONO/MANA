clear variables;close all;
i=complex(0,1);

% intervalle temporel
tmin=-4;tmax=4;Te=0.005;
t=tmin:Te:tmax;
N=length(t);
k1=2;k2=4;k3=6;
sig1=1/(2^k1);
sig2=1/(2^k2);
sig3=1/(2^k3);
% sig1=0.5;
% sig2=2;
% sig3=4;

%fonction
g1=(1/sig1*sqrt(2*pi))*exp(-(t.^2)/(2*sig1^2));
g2=(1/sig2*sqrt(2*pi))*exp(-(t.^2)/(2*sig2^2));
g3=(1/sig3*sqrt(2*pi))*exp(-(t.^2)/(2*sig3^2));

% g1=porte(t/sig1);
% g2=porte(t/sig2);
% g3=porte(t/sig3);

% intervalle fréquentiel
nu_e=1/Te;

nu=linspace(-nu_e/2,nu_e/2,N);

% transformée de Fourier (initialisation)
tg1=zeros(1,length(nu));
tg2=zeros(1,length(nu));
tg3=zeros(1,length(nu));

% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:N % pour chaque fréquence
tg1(k)=trapz(t,g1.*exp(-2*i*pi*nu(k)*t));
tg2(k)=trapz(t,g2.*exp(-2*i*pi*nu(k)*t));
tg3(k)=trapz(t,g3.*exp(-2*i*pi*nu(k)*t));
end


s=exp(-pi*(t.^2)).*cos(2*pi*5*t);

% transformée de Fourier (initialisation)
sf=zeros(1,length(nu));

% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:N % pour chaque fréquence
sf(k)=trapz(t,s.*exp(-2*i*pi*nu(k)*t));
end

h1=conv(s,g1,'same');
h1=h1/max(h1);
h2=conv(s,g2,'same');
h2=h2/max(h2);
h3=Te*conv(s,g3,'same');
h3=h3/max(h3);

% figure(1);hold on;
% subplot(231);plot(t,g1);
% subplot(232);plot(t,g2);
% subplot(233);plot(t,g3);
% subplot(234);plot(nu,tg1);axis([-10,10,-1,4]);
% subplot(235);plot(nu,tg2);axis([-10,10,-1,4]);
% subplot(236);plot(nu,tg3);axis([-10,10,-1,4]);

figure(2);hold on
subplot(1,3,1);plot(t,s,t,h1);
subplot(1,3,2);plot(t,s,t,h2);
subplot(1,3,3);plot(t,s,t,h3);



