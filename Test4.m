clear variables;  % efface les variables 
close all;        % ferme toutes les fenêtres 
clc;              % efface le contenu de la zone de commande

x=0;
n=0;
a=pi^2/6;
e=1e-3;
while abs(a-x)>e
    n=1+n;
    x=(1/(n^2))+x;
end
n

x=0;
n=0;
a=log(2);
e=1e-4;
while abs(a-x)>e
    n=1+n;
    x=((-1)^(n+1)/n)+x;
end
n