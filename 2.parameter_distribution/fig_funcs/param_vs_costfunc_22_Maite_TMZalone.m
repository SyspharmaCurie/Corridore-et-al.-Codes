function param_vs_costfunc_22_Maite_TMZalone(param_name,param_dist,cost_dist,LO,UP)

    figure(10)
    clf
for n=1:4
    paramx_dist=param_dist(:,n);
    subplot(2,2,n)
    plot(paramx_dist,cost_dist,'*')
    title(param_name(n));
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

end

