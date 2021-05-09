clear
close all

a=1;
xend=10;
tend=6;
dx=0.01;
dt=0.01;
timestep=2;

initialization = 2;
method = 8;
exactsolution = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialization
% 1. stepfunction  2. sinwave
%
% method
% 1. upwind  2. downwind  3. EulerFTFS  4. Lax  5. leafprog  6. EulerBTCS
% 7. Crank-Nicolson  8. kim BTUW
%
% exactsolution
% exactsolution을 같이 plot하기 원한다면 1, 원하지 않는다면 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if initialization == 1
    u = stepinitialization(dx, dt, xend, tend);
elseif initialization == 2
    u = sininitialization(dx, dt, xend, tend);
end

uex=[];
if exactsolution
    if initialization == 1
        uex = stepexactsolution(u, a, dx, dt, xend, tend);
    elseif initialization == 2
        uex = sinexactsolution(u, a, dx, dt, xend, tend);
    end
end

if method == 1
    u = upwind(u, a, dx, dt, xend, tend);
elseif method == 2
    u = downwind(u, a, dx, dt, xend, tend);
elseif method == 3
    u = EulerFTFS(u, a, dx, dt, xend, tend);
elseif method == 4
    u = Lax(u, a, dx, dt, xend, tend);
elseif method == 5
    u = leafprog(u, a, dx, dt, xend, tend);
elseif method == 6
    u = EulerBTCS(u, a, dx, dt, xend, tend);
elseif method == 7
    u = C_N(u, a, dx, dt, xend, tend);
elseif method == 8
    u = kim_BTUW(u, a, dx, dt, xend, tend);
end

solplot(a, u, uex, dx, xend, dt, tend, timestep, method, exactsolution)