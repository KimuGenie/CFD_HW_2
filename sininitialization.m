function u = sininitialization(dx, dt, xend, tend)

u = zeros(xend/dx+1, tend/dt+1);

for i=1:xend/dx+1
    x = (i-1)*dx;
    if 0<=x && x<=1
        u(i, 1) = sin(2*pi*x);
    else
        u(i, 1) = 0;
    end
end

end