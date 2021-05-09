function solplot(a, u, uex, dx, xend, dt, tend, timestep, method, exactsolution)

methods = {'upwind' 'downwind' 'EulerFTFS' 'Lax' 'leafprog' 'Euler BTCS' 'Crank-Nicolson' 'kim BTUW'};
lin = {'k-.', 'k-', 'k--'};
i=0;

hold on

if exactsolution == 1
for n=1:round(timestep/dt):tend/dt+1
    plot(0:dx:xend, uex(:, n), 'color', [0.5 0.5 0.5], 'linewidth', 1)
end
end


for n=1:round(timestep/dt):tend/dt+1
    i=i+1;
    plot(0:dx:xend, u(:, n), char(lin(mod(i, 3)+1)), 'linewidth', 1)
end

axis([0 xend min(u, [], 'all')-0.5 max(u, [], 'all')+0.5])
title(strcat(methods(method), '  cfl=', num2str(a*dt/dx)), 'fontsize', 15)
xlabel('x', 'fontsize', 15)
ylabel('u', 'fontsize', 15)
set(gcf, 'position', [100 300 400 300])