function param_istgmm_22_Maite_TMZalone(param_name,param_dist,LO,UP)

    figure(11)
    clf
for n=1:4
    paramx_dist=param_dist(:,n);
    subplot(2,2,n)
    histfit(paramx_dist,20,'kernel');
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

end

