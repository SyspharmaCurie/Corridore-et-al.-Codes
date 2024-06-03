function param_istgmm_v26(param_name,param_dist,opt_scale_param,LO,UP)

    figure(11)
    clf
for n=1:8
    paramx_dist=param_dist(:,n);
    subplot(3,3,n)
    hf=histfit(paramx_dist,20,'kernel');
    hf_YData=get(hf(1),'Ydata');
    X4=opt_scale_param(n)*ones(1,100);
    Y4=linspace(0,max(hf_YData),100);
    hold on
    plot(X4,Y4,'--g','LineWidth',2);
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

    figure(12)
    clf
for n=9:20
    paramx_dist=param_dist(:,n);
    subplot(3,4,n-8)
    histfit(paramx_dist,20,'kernel');
    hf_YData=get(hf(1),'Ydata');
    X4=opt_scale_param(n)*ones(1,100);
    Y4=linspace(0,max(hf_YData),100);
    hold on
    plot(X4,Y4,'--g','LineWidth',2);
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

    figure(13)
    clf
for n=21:35
    paramx_dist=param_dist(:,n);
    subplot(4,4,n-20)
    histfit(paramx_dist,20,'kernel');
    hf_YData=get(hf(1),'Ydata');
    X4=opt_scale_param(n)*ones(1,100);
    Y4=linspace(0,max(hf_YData),100);
    hold on
    plot(X4,Y4,'--g','LineWidth',2);
    hold on
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

end

