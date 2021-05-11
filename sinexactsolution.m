function u=sinexactsolution(u, a, dx, dt, xend, tend)

for n=1:tend/dt+1
    for i=1:xend/dx
        x = (i-1)*dx;
    if 0<=x-a*(n-1)*dt && x-a*(n-1)*dt<=1
        u(i, n) = sin(2*pi*(x-a*(n-1)*dt));
    else
        u(i, n) = 0;
    end
    end
end

end