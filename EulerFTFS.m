function u=EulerFTFS(u, a, dx, dt, xend, tend)

for n=1:tend/dt
    for i=2:xend/dx
        u(i, n+1) = u(i, n)-a*dt/dx*(u(i+1, n)-u(i, n));
    end
end