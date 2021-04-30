function u=Lax(u, a, dx, dt, xend, tend)

for n=1:tend/dt
    for i=2:xend/dx
        u(i, n+1) = (u(i+1, n)+u(i-1, n))/2 - a*dt/(2*dx)*(u(i+1, n)-u(i-1, n));
    end
end