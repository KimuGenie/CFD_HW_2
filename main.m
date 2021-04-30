clear
close all

a=1;
xend=10;
tend=3;
dx=0.01;
dt=0.01;
timestep=1;

%u = stepinitialization(dx, dt, xend, tend);
u = sininitialization(dx, dt, xend, tend);
%u = upwind(u, a, dx, dt, xend, tend);
%u = EulerFTFS(u, a, dx, dt, xend, tend);
%u = Lax(u, a, dx, dt, xend, tend);
%u=leafprog(u, a, dx, dt, xend, tend);
%u=EulerBTCS(u, a, dx, dt, xend, tend);
u=C_N(u, a, dx, dt, xend, tend);
%u = stepexactsolution(u, a, dx, dt, xend, tend);
%u=sinexactsolution(u, a, dx, dt, xend, tend);

solplot(u, dx, xend, dt, tend, timestep)

disp(['cfl=', num2str(a*dt/dx)])