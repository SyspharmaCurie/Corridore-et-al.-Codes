function plot_viab(fignumb,...figure control
    TMZsurv_curvm,surv_curvm_MGMT_M_mat,surv_curvm_MGMT_P_mat,ttitle)

sim_num=size(surv_curvm_MGMT_M_mat,2);

%%%%%Apotosis Control
figure(fignumb)
for sim_indx=1:sim_num
    semilogx(TMZsurv_curvm,surv_curvm_MGMT_M_mat(:,sim_indx),'-','Color', [0.1 0.2 0.7],'LineWidth',3)
    hold on
    semilogx(TMZsurv_curvm,surv_curvm_MGMT_P_mat(:,sim_indx),'-','Color', color_conv_an_rgb('#D83600'),'LineWidth',3)
    hold on
end
ylim([-0.5,105])
xlabel('Temozolomide (\mumol/L)')
xlim([0.1,2e3])
ylim([-0.5,105])
ylabel('Percent survival')
title(ttitle);
set(gca,'fontweight','bold','FontSize',15)

          

end