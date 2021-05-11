function solplot(a, u, uex, dx, xend, dt, tend, timestep, method, exactsolution)

methods = {'upwind' 'EulerFTFS' 'Lax' 'leapfrog' 'Euler BTCS' 'Crank-Nicolson' 'kim BTUW'};
lin = {'--', ':.', '-.' '-'};
i=0;

hold on

for n=1:round(timestep/dt):tend/dt+1
    if exactsolution == 1
        plot(0:dx:xend, uex(:, n), char(lin(mod(i, 4)+1)), 'color', [0.7 0.7 0.7], 'linewidth', 1)
    end
    plot(0:dx:xend, u(:, n), char(lin(mod(i, 4)+1)), 'color', 'k', 'linewidth', 1)
    i=i+1;
end

axis([0 xend min(u, [], 'all')-0.5 max(u, [], 'all')+0.5])
title(strcat(methods(method), '  cfl=', num2str(a*dt/dx)), 'fontsize', 15)
xlabel('x', 'fontsize', 15)
ylabel('u', 'fontsize', 15)
set(gcf, 'position', [100 300 400 300])

end