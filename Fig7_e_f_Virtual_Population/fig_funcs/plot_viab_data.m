function plot_viab_data(figcon,fignumb,...figure control
    TMZdata_mat,mean_mat,stddev_mat,time_vec,MGMT_vec...data
    )

sim_num=size(TMZdata_mat,2);
color_mat = color_timedef(MGMT_vec,time_vec);

%%%%%Apotosis Control
if figcon==1
    figure(fignumb)
    for sim_indx=1:sim_num
        errorbar(TMZdata_mat(:,sim_indx),mean_mat(:,sim_indx),stddev_mat(:,sim_indx),'o','Color', color_mat(sim_indx,:),'MarkerFaceColor', color_mat(sim_indx,:),'MarkerSize',10,'LineWidth',3)
        hold on
    end
end
          

end