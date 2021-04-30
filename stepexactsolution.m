function u=stepexactsolution(u, a, dx, dt, xend, tend)

for n=1:tend/dt
    for i=1:xend/dx
        x = (i-1)*dx;
    if x-a*(n-1)*dt<= 0
        u(i, n) = 10;
    elseif 0<=x-a*(n-1)*dt && x-a*(n-1)*dt<=1
        u(i, n) = -10*(x-a*(n-1)*dt)+10;
    elseif x-a*(n-1)*dt>=1
        u(i, n) = 0;
    end
    end
end