clear
close all

a=1;
xend=10; %x 끝 값
tend=6; %t 끝 값
dx=0.0125;
dt=0.01;
timestep=2; %timestep 초마다 plot함.

initialization = 1;
method = 7;
exactsolution = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialization
% 1. stepfunction  2. sinwave
%
% method
% 1. upwind  2. EulerFTFS  3. Lax  4. leafprog  5. EulerBTCS
% 6. Crank-Nicolson  7. kim BTUW
%
% exactsolution
% exactsolution을 같이 plot하길 원한다면 1, 원하지 않는다면 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%initialization
if initialization == 1
    u = stepinitialization(dx, dt, xend, tend);
elseif initialization == 2
    u = sininitialization(dx, dt, xend, tend);
end

%exactsolution
uex=[];
if exactsolution
    if initialization == 1
        uex = stepexactsolution(u, a, dx, dt, xend, tend);
    elseif initialization == 2
        uex = sinexactsolution(u, a, dx, dt, xend, tend);
    end
end

%methods
if method == 1
    u = upwind(u, a, dx, dt, xend, tend);
elseif method == 2
    u = EulerFTFS(u, a, dx, dt, xend, tend);
elseif method == 3
    u = Lax(u, a, dx, dt, xend, tend);
elseif method == 4
    u = leapfrog(u, a, dx, dt, xend, tend);
elseif method == 5
    u = EulerBTCS(u, a, dx, dt, xend, tend);
elseif method == 6
    u = C_N(u, a, dx, dt, xend, tend);
elseif method == 7
    u = kim_BTUW(u, a, dx, dt, xend, tend);
end

%solution plot
solplot(a, u, uex, dx, xend, dt, tend, timestep, method, exactsolution)

%del peak
p = del_peak(u, uex, dt, tend, timestep);
p(4)