function plot_viab(figcon,fignumb,...figure control
    TMZsurv_curvm_mat,surv_curvm_mat,time_vec,MGMT_vec,...simulations
    viab)

sim_num=size(surv_curvm_mat,2);
color_mat = color_timedef(MGMT_vec,time_vec);

%%%%%Apotosis Control
if figcon==1
    figure(fignumb)
    clf
    hAx=axes;  
    for sim_indx=1:sim_num
        semilogx(TMZsurv_curvm_mat(:,sim_indx),surv_curvm_mat(:,sim_indx),'-','Color', color_mat(sim_indx,:),'LineWidth',3)
        hold on
    end
    hAx.XScale='log';
    ylim([-0.5,105])
    xlabel('Temozolomide (\mumol/L)')
    if viab=='s'
        xlim([0.1,2e3])
        ylim([-0.5,105])
        ylabel('Percent survival')
    elseif viab=='a'
        xlim([1,200])
        ylim([-0.5,50])
        ylabel('apop')
    end
    set(gca,'fontweight','bold','FontSize',15)
end
          

end