function u=downwind(u, a, dx, dt, xend, tend)

for n=1:tend/dt
    for i=xend/dx:-1:2
        u(i, n+1) = u(i, n)-a*dt/dx*(u(i, n)-u(i+1, n));
    end
end