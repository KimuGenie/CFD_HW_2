function solplot(u, dx, xend, dt, tend, timestep)

lin = {'k-.', 'k-', 'k--'};
i=0;

hold on
for n=1:round(timestep/dt):tend/dt+1
    i=i+1;
    plot(0:dx:xend, u(:, n), char(lin(mod(i, 3)+1)), 'linewidth', 1)
end

axis([0 xend min(u, [], 'all')-0.5 max(u, [], 'all')+0.5])