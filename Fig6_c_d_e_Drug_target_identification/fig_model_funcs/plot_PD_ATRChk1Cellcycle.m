function plot_PD_ATRChk1Cellcycle(genfig_con,plot_dir,empl_inhib_name,inhib_level,t_cell,sim_cell,MGMT,TMZ,TMZout0_MAX,VX,MGMT_str)

sim_numb=size(t_cell,2);

color_mat = color_TMZVXdef(sim_numb,MGMT,TMZ,TMZout0_MAX,VX);

legend_label=legend_writer(MGMT,TMZ,VX);

ATR_subplot_numb=1;
pATR_subplot_numb=2;
Chk1_subplot_numb=3;
pChk1_subplot_numb=4;
Cdc25_subplot_numb=5;
CyA_subplot_numb=6;


if genfig_con==1
    figure
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
%         CyA=cell2mat(CyA_cell(:,n));
    
        subplot(3,2,ATR_subplot_numb)
         plot(time,1e3*sim(:,15),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('ATR (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
%          legend('fontweight','default','FontSize','default','Location','northwestoutside');
         box off
    
        subplot(3,2,pATR_subplot_numb)
         plot(time,1e3*sim(:,16),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('pATR (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off
        
         subplot(3,2,Chk1_subplot_numb)
         plot(time,1e3*sim(:,17),'color',color_mat(n,:),'LineWidth',3);
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('Chk1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off

        subplot(3,2,pChk1_subplot_numb)
        plot(time,1e3*sim(:,18),'color',color_mat(n,:),'LineWidth',3);
        hold on
        xlim([-0.1 time(end)])
        % ylim([0 3.9])
        xlabel('Time (h)','Fontsize',14)
        ylabel('pChk1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(3,2,Cdc25_subplot_numb)
        plot(time,1e3*sim(:,19),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('Cdc25 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

%         subplot(3,2,CyA_subplot_numb)
%         plot(time,CyA,'color',color_mat(n,:),'LineWidth',3);
%         hold on
%          xlim([-0.1 time(end)])
%         xlabel('Time (h)','Fontsize',14)
%         ylabel('CyA (a.u.)','Fontsize',14)
%          set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
%         box off


    end

    filename=strcat(plot_dir,'/Model_MGMT_',MGMT_str,'_',string(empl_inhib_name),'_',string(inhib_level),'inhib_PDATR.png');
    saveas(gcf, filename);
    

end

end

