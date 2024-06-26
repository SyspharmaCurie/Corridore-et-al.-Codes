function plot_PD_ATRChk1Cellcycle(fig_num,genfig_con,t_cell,sim_cell,CyA_cell,MGMT,TMZ,TMZout0_MAX,VX)

sim_numb=size(t_cell,2);

color_mat = color_TMZVXdef(sim_numb,MGMT,TMZ,TMZout0_MAX,VX);

legend_label=legend_writer(MGMT,TMZ,VX);

ATR_subplot_numb=1;
pATR_subplot_numb=2;
Chk1_subplot_numb=3;
pChk1_subplot_numb=4;
Cdc25_subplot_numb=5;
CyA_subplot_numb=7;


if genfig_con==1
clf(figure(fig_num));
    figure(fig_num)
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
        CyA=cell2mat(CyA_cell(:,n));
    
        subplot(4,2,ATR_subplot_numb)
         plot(time,1e3*sim(:,14),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('ATR (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         legend('fontweight','default','FontSize','default');
         box off
    
        subplot(4,2,pATR_subplot_numb)
         plot(time,1e3*sim(:,15),'color',color_mat(n,:),'LineWidth',3,'DisplayName', legend_label(n,:));
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('pATR (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off
        
         subplot(4,2,Chk1_subplot_numb)
         plot(time,1e3*sim(:,16),'color',color_mat(n,:),'LineWidth',3);
         hold on
         xlim([-0.1 time(end)])
         xlabel('Time (h)','Fontsize',14)
         ylabel('CHK1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         box off

        subplot(4,2,pChk1_subplot_numb)
        plot(time,1e3*sim(:,17),'color',color_mat(n,:),'LineWidth',3);
        hold on
        xlim([-0.1 time(end)])
        % ylim([0 3.9])
        xlabel('Time (h)','Fontsize',14)
        ylabel('pCHK1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(4,2,Cdc25_subplot_numb)
        plot(time,1e3*sim(:,18),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('CDC25 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off

        subplot(4,2,CyA_subplot_numb)
        plot(time,CyA,'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 time(end)])
        xlabel('Time (h)','Fontsize',14)
        ylabel('S-phase (a.u.)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
        box off


    end
    

end

end

