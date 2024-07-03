function plot_PK(genfig_con,plot_dir,empl_inhib_name,inhib_level,t_cell,sim_cell,MGMT,TMZ,TMZout0_MAX,VX,MGMT_str)

sim_numb=size(t_cell,2);

color_mat = color_TMZVXdef(sim_numb,MGMT,TMZ,TMZout0_MAX,VX);

legend_label=legend_writer(MGMT,TMZ,VX);

TMZout_subplot_numb=1;
TMZin_subplot_numb=2;
MTICout_subplot_numb=3;
MTICin_subplot_numb=4;
AICout_subplot_numb=5;
AICin_subplot_numb=6;
methcat_subplot_numb=7;


if genfig_con==1
    figure
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
    
        subplot(3,3,TMZout_subplot_numb)
         plot(time,1e3*sim(:,1),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('TMZout (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
%          legend('fontweight','default','FontSize','default','Location','northwestoutside');
         box off
        
         subplot(3,3,TMZin_subplot_numb)
         plot(time,1e3*sim(:,2),'color',color_mat(n,:),'LineWidth',3);
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('TMZin (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off

        subplot(3,3,MTICout_subplot_numb)
        plot(time,1e3*sim(:,3),'color',color_mat(n,:),'LineWidth',3);
        hold on
        xlim([-0.1 time(end)])
        % ylim([0 3.9])
        xlabel('Time (h)','Fontsize',14)
        ylabel('MTIC out (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,MTICin_subplot_numb)
        plot(time,1e3*sim(:,4),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('MTIC in (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,AICout_subplot_numb)
        plot(time,1e3*sim(:,5),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('AIC out (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,AICin_subplot_numb)
        plot(time,1e3*(sim(:,6)),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('AIC in (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,methcat_subplot_numb)
        plot(time,1e3*sim(:,7),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('meth. cat. (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off


    end
    
    filename=strcat(plot_dir,'/Model_MGMT_',MGMT_str,'_',string(empl_inhib_name),'_',string(inhib_level),'inhib_PK.png');
    saveas(gcf, filename);
    

end

end

