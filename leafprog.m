function u=leafprog(u, a, dx, dt, xend, tend)

for i=2:xend/dx
    u(i, 2) = u(i, 1)-a*dt/dx*(u(i, 1)-u(i-1, 1));
end

for n=2:tend/dt
    for i=2:xend/dx
        u(i, n+1) = u(i, n-1)-a*dt/dx*(u(i+1, n)-u(i-1, n));
    end
end