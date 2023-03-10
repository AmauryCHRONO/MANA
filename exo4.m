clear variables;close all;

i=complex(0,1);

% intervalle temporel
tmin=-5;tmax=5;Te=0.01;
t=tmin:Te:tmax;
N=length(t);
a=3;
b=2;
func=4;
switch func
    
    case 1
        f=porte(t);
        g=porte(t);
        
    case 2
        f=2*porte((t-1)/2);
        g=porte(t-0.5);
        
    case 3
        f=porte((t-1)/4);
        g=(t/2).*porte((t-1)/2);
        
    case 4
        f=exp(-(a*t.^2)/2);
        g=exp(-(b*t.^2)/2);
        
end

h=Te*conv(f,g,'same');

% intervalle fréquentiel
nu_e=1/Te;

nu=linspace(-nu_e/2,nu_e/2,N);

% transformée de Fourier (initialisation)
tfF=zeros(1,length(nu));

% transformée de Fourier (initialisation)
tfG=zeros(1,length(nu));

for k=1:N % pour chaque fréquence
tfF(k)=trapz(t,f.*exp(-2*i*pi*(nu(k))*t));
tfG(k)=trapz(t,g.*exp(-2*i*pi*(nu(k))*t));
end

H=tfF.*tfG;

tfih=zeros(1,length(t));

for k=1:N % pour chaque instant
tfih(k)=trapz(nu,H.*exp(2*i*pi*(t(k))*nu));
end


figure(1);hold on;
subplot(411);plot(t,f);
subplot(412);plot(t,g);
subplot(413);plot(t,h);
subplot(414);plot(t,tfih);

