function u=kim_BTUW(u, v, dx, dt, xend, tend)

A=zeros(xend/dx-1);
b=[];
c=[];
d=[];
imax = xend/dx+1;

for n=1:tend/dt
    for i=2:imax-1
        b(i)=-v*dt/dx;
        d(i)=1+v*dt/dx;
        c(i)=u(i, n);
    end
    
    for i=1:imax-3
        A(i+1,i)=b(i+2);
    end
    for i=1:imax-2
        A(i,i)=d(i+1);
        C(i,1)=c(i+1);
    end
    C(1, 1)=C(1, 1)-b(2)*u(1, n+1);
    U=A\C; %gauss elimination
    
    for i=1:imax-2
        u(i+1, n+1)=U(i);
    end
end

end