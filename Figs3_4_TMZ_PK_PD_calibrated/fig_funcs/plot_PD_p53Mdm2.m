function [] = plot_PD_p53Mdm2(fig_num,genfig_con,t_cell,sim_cell,MGMT,TMZ,TMZout0_MAX,VX)

sim_numb=size(t_cell,2);

color_mat = color_TMZVXdef(sim_numb,MGMT,TMZ,TMZout0_MAX,VX);

legend_label=legend_writer(MGMT,TMZ,VX);

p53_subplot_numb=1;
p53ser46_subplot_numb=2;
RNAMdm2_subplot_numb=3;
Mdm2_subplot_numb=4;


if genfig_con==1
clf(figure(fig_num));
    figure(fig_num)
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
    
        subplot(2,2,p53_subplot_numb)
         plot(time,1e3*sim(:,19),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('P53 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         legend('fontweight','default','FontSize','default');
         box off
    
        subplot(2,2,p53ser46_subplot_numb)
         plot(time,1e3*sim(:,20),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('P53ser46 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off
        
         subplot(2,2,RNAMdm2_subplot_numb)
         plot(time,1e3*sim(:,21),'color',color_mat(n,:),'LineWidth',3);
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('RNA MDM2 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off

        subplot(2,2,Mdm2_subplot_numb)
        plot(time,1e3*sim(:,22),'color',color_mat(n,:),'LineWidth',3);
        hold on
        xlim([-0.1 time(end)])
        % ylim([0 3.9])
        xlabel('Time (h)','Fontsize',14)
        ylabel('MDM2 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off


    end
    

end

end

