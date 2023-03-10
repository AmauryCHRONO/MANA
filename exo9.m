clear variables;close all; 
A=imread('barbara.jpg'); 
[a,b]=size(A); 

[n,m]=size(A); 
r=100;
At=fftshift(fft2(A));
Atabs=abs(At);

d=disque(n,m,r);
Atf1=At.*d;
Atf1abs=abs(Atf1);
Af1=abs(ifft2(Atf1));
Atf2=At-At.*d;
Atf2abs=abs(Atf2);
Af2=abs(ifft2(Atf2));


figure(1); 
subplot(2,3,1); 
imagesc(A);
colormap gray;
subplot(2,3,4); 
imagesc(log10(Atabs));
colormap gray;
subplot(2,3,2); 
imagesc(Af1);
colormap gray;
subplot(2,3,5); 
imagesc(log10(Atf1abs));
colormap gray;
subplot(2,3,3); 
imagesc(Af2);
colormap gray;
subplot(2,3,6); 
imagesc(log10(Atf2abs));
colormap gray;


