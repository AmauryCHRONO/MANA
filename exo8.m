clear variables;close all; 

% part1
n=300; 
m=n;
a=0.8;b=0.8;
% r=149;
% figure(1); 
% x=-n/2:n/2; 
% y=x; 
% lx=45; 
% ly=20; 
% M1=disque(n,m,r); 
% TF_M_int=abs(uint8(fftshift(fft2(M1))));
% subplot(1,2,1); imshow(M1);
% subplot(1,2,2); imshow(TF_M_int);

%part2
[x,y]=meshgrid(1:n,1:m); 
M=cos(a*x+b*y); 
TF_M_int=uint8(abs(fftshift(fft2(M))));
subplot(1,2,1); 
imshow(M);
subplot(1,2,2); 
imshow(TF_M_int);