function p=del_peak(u, uex, dt, tend, timestep)

i=1;
for n=1:round(timestep/dt):tend/dt+1
    p(i) = round(max(u(:, n))/max(uex(:, n))*100, 1); %exact solution 대비 수치해의 peak값 비율(%)
    i=i+1;
end

end