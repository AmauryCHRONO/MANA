clear variables;close all;

i=complex(0,1);

% intervalle temporel
tmin=-5;tmax=5;Te=0.01;
t=tmin:Te:tmax;
N=length(t);

% signal f
f=3.5*triangle(t/3)-1.5.*triangle(t);
%t./(1+9*t.^2).^2;
%exp(-(t.^2)/4);
%6*t.*exp(-2*pi.*abs(t));
%t.*porte(t);
%exp(-pi*t.^2).*cos(4*pi*t);
plot(t,f,'k'); % affichage (en noir)

% intervalle fréquentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);

% transformée de Fourier (initialisation)
tf=zeros(1,length(nu));

% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:N % pour chaque fréquence
tf(k)=trapz(t,f.*exp(-2*i*pi*(nu(k))*t));
end

% affichage
figure(1);
subplot(311);plot(nu,real(tf),'k');xlim([-10,10]);
subplot(312);plot(nu,imag(tf),'k');xlim([-10,10]);
subplot(313);plot(nu,angle(tf),'k');xlim([-10,10]);