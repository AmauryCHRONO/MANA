function P=porte_2d(n,m,lx,ly) 
    x=-floor(n/2):floor(n/2); 
    y=-floor(m/2):floor(m/2); 
    p1=abs(x)<0.5*lx; 
    p2=abs(y)<0.5*ly; 
    p1=double(p1);
    p2=double(p2);
    P=p2'*p1;