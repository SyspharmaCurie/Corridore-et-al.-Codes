function param_istgmm_23_2_tED50(param_name,param_dist,LO,UP)

    figure(11)
    clf
for n=1:8
    paramx_dist=param_dist(:,n);
    subplot(3,3,n)
    histfit(paramx_dist,20,'kernel');
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

    figure(12)
    clf
for n=9:15
    paramx_dist=param_dist(:,n);
    subplot(3,4,n-8)
    histfit(paramx_dist,20,'kernel');
    xlim([LO(n),UP(n)])
    title(param_name(n));
end

%     figure(13)
%     clf
% for n=21:33
%     paramx_dist=param_dist(:,n);
%     if(n>31)
%         subplot(3,4,n-(20+1))
%         histfit(paramx_dist,20,'kernel');
%         hold on
%         xlim([LO(n),UP(n)])
%         title(param_name(n));
%     else
%         subplot(3,4,n-20)
%         histfit(paramx_dist,20,'kernel');
%         hold on
%         xlim([LO(n),UP(n)])
%         title(param_name(n));
%     end
% end

end

