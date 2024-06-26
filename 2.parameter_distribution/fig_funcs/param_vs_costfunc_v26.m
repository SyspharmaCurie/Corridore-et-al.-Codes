function param_vs_costfunc_v26(param_name,param_dist,cost_dist,LO,UP)

    figure(21)
    clf
for n=1:8
    paramx_dist=param_dist(:,n);
    subplot(3,3,n)
    plot(paramx_dist,cost_dist,'*')
    title(param_name(n));
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

    figure(22)
    clf
for n=9:20
    paramx_dist=param_dist(:,n);
    subplot(3,4,n-8)
    plot(paramx_dist,cost_dist,'*')
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

    figure(23)
    clf
for n=21:35
    paramx_dist=param_dist(:,n);
    subplot(4,4,n-20)
    plot(paramx_dist,cost_dist,'*')
    hold on
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

end

