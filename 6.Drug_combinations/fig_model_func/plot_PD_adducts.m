function plot_PD_adducts(genfig_con,plot_dir,empl_inhib_name,inhib_level,t_cell,sim_cell,MGMT,TMZ,TMZout0_MAX,VX,MGMT_str)

sim_numb=size(t_cell,2);

color_mat = color_TMZVXdef(sim_numb,MGMT,TMZ,TMZout0_MAX,VX);

legend_label=legend_writer(MGMT,TMZ,VX);

N37meAG_subplot_numb=1;
RNAMGMT_subplot_numb=2;
MGMT_subplot_numb=3;
O6meG_subplot_numb=4;
GT_subplot_numb=5;
SSB_subplot_numb=6;
SSB_tot_subplot_numb=7;
DSB_subplot_numb=8;


if genfig_con==1
    figure
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
    
        subplot(3,3,N37meAG_subplot_numb)
         plot(time,1e3*sim(:,13),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('N37meAG (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
%          legend('fontweight','default','FontSize','default','Location','northwestoutside');
         box off
    
        subplot(3,3,RNAMGMT_subplot_numb)
         plot(time,1e3*sim(:,9),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('RNA MGMT (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off
        
         subplot(3,3,MGMT_subplot_numb)
         plot(time,1e3*sim(:,10),'color',color_mat(n,:),'LineWidth',3);
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('MGMT pr (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off

        subplot(3,3,O6meG_subplot_numb)
        plot(time,1e3*sim(:,8),'color',color_mat(n,:),'LineWidth',3);
        hold on
        xlim([-0.1 time(end)])
        % ylim([0 3.9])
        xlabel('Time (h)','Fontsize',14)
        ylabel('O6meG (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,GT_subplot_numb)
        plot(time,1e3*sim(:,11),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('GT (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,SSB_subplot_numb)
        plot(time,1e3*sim(:,12),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('SSB (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,SSB_tot_subplot_numb)
        plot(time,1e3*(sim(:,8)+sim(:,11)+sim(:,12)),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('O6meg tot (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,3,DSB_subplot_numb)
        plot(time,1e3*sim(:,14),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('DSB (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off


    end
    
    filename=strcat(plot_dir,'/Model_MGMT_',MGMT_str,'_',string(empl_inhib_name),'_',string(inhib_level),'inhib_PDadd.png');
    saveas(gcf, filename);

end

end

