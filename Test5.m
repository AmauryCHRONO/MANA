clear variables;
clc

 a=0;
 b=1;
 e=0.01;

 f=@(x)((x+3)./sqrt(2*x+1));
 x=a:e:b;
 y=f(x);
 c=trapz(x,y);
 c
disp(3*sqrt(3)-(8/3))



g=@(x)((sin(x)).^4./x.^4);
% figure(1);
% hold on;
% x=0:0.01:15;
% y=f(x);
% plot(x,y,'color',[0,1,0,],'linewidth',3);

a=0.0001;
b=150;
e=0.001;
x=a:e:b;
y=g(x);
c=trapz(x,y);
c
disp(pi/3)
