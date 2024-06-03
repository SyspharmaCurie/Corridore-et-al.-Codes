function plot_apopcurv_data(figcon,fignumb,...figure control
    TMZdata_surv_mat,surv_mean_mat,surv_stddev_mat,surv_time_vec,MGMT_vec...data
    )

sim_num=size(TMZdata_surv_mat,2);
color_mat = plot_colors_time(MGMT_vec,surv_time_vec);

%%%%%Apotosis Control
if figcon==1
    figure(fignumb)
    clf
    hAx=axes;  
    for sim_indx=1:sim_num
        errorbar(TMZdata_surv_mat(:,sim_indx),surv_mean_mat(:,sim_indx),surv_stddev_mat(:,sim_indx),'o','Color', color_mat(sim_indx,:),'MarkerFaceColor', color_mat(sim_indx,:),'MarkerSize',10,'LineWidth',3)
        hold on
    end
    hAx.XScale='log';
    xlim([0.1,2e3])
    ylim([-0.5,105])
    xlabel('Temozolomide (\mumol/L)')
    ylabel('Percent survival')
    set(gca,'fontweight','bold','FontSize',15)
end
          

end