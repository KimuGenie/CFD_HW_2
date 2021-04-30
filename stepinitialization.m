function u = stepinitialization(dx, dt, xend, tend)

u = zeros(xend/dx+1, tend/dt+1);

for i=1:xend/dx+1
    x = (i-1)*dx;
    if x<= 0
        u(i, 1) = 10;
    elseif 0<=x && x<=1
        u(i, 1) = -10*x+10;
    else
        u(i, 1) = 0;
    end
end

for n=1:(tend+1)/dt
    u(1, n) = 10;
end