clear variables;close all;
i=complex(0,1);

% intervalle temporel
D=1;
N=2^12;
dt=(2*D)/N;
t=-D:dt:D-dt;
T1=2^-5;T2=2^-6;

s=exp(-pi*(t.^2)).*cos(2*pi*5*t);

f1=peigne(T1,t);
f2=peigne(T2,t);

[ft1,nu1]=TransFourier(f1,t);
[ft2,nu2]=TransFourier(f2,t);

z=s.*f2;
[st,nu3]=TransFourier(s,t);
[zt,nu4]=TransFourier(z,t);

figure(2);hold on
% subplot(3,2,1);plot(t,f1);
% subplot(3,2,3);plot(t,f2);
% subplot(3,2,2);plot(nu1,ft1);axis([-1000,1000,0,0.003]);
% subplot(3,2,4);plot(nu2,ft2);axis([-1000,1000,0,0.003]);
subplot(3,1,1);plot(t,s,t,z);
subplot(3,1,2);plot(nu3,st);axis([-50,50,0,1]);
subplot(3,1,3);plot(nu4,zt);axis([-500,500,0,0.03]);
