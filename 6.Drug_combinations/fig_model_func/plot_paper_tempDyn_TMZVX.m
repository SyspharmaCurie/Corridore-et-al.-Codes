function [] = plot_paper_tempDyn_TMZVX(fig_num,t_cell,sim_cell,CyA_cell,MGMT,TMZ,TMZout0_MAX,VX)

sim_numb=size(t_cell,2);
color_mat = color_TMZVXdef(sim_numb,MGMT,TMZ,TMZout0_MAX,VX);

legend_label=legend_writer(MGMT,TMZ,VX);
MGMT_subplot_numb=1;
O6meG_tot_subplot_numb=2;
DSB_subplot_numb=3;
pATR_subplot_numb=4;
Chk1_subplot_numb=5;
pChk1_subplot_numb=6;


clf(figure(fig_num));
    figure(fig_num)
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
        CyA=cell2mat(CyA_cell(:,n));

        subplot(2,3,MGMT_subplot_numb)
        plot(time,1e3*sim(:,10),'color',color_mat(n,:),'LineWidth',3);
        hold on
        xlim([-0.1 25])
        % ylim([0 3.9])
%         xlabel('time (h)','Fontsize',14)
        ylabel('MGMT protein (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         ax(MGMT_subplot_numb,n)=gca;
         %title('(A)', 'FontSize', 15);
        box off
        
         subplot(2,3,O6meG_tot_subplot_numb)
        plot(time,1e3*(sim(:,8)+sim(:,11)+sim(:,12)),'color',color_mat(n,:),'LineWidth',3,'DisplayName',legend_label(n,:));
        hold on
         xlim([-0.1 25])
%         xlabel('time (h)','Fontsize',14)
        ylabel('O6meG tot (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         ax(O6meG_tot_subplot_numb,n)=gca;
         %title('(B)', 'FontSize', 15);
%          legend('fontweight','default','FontSize','default');
        box off

        subplot(2,3,DSB_subplot_numb)
        plot(time,1e3*sim(:,14),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 25])
%         xlabel('time (h)','Fontsize',14)
        ylabel('DSB (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         ax(DSB_subplot_numb,n)=gca;
         %title('(D)', 'FontSize', 15);
        box off

        subplot(2,3,pATR_subplot_numb)
        plot(time,1e3*sim(:,16),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 25])
        % ylim([-1 120])
        xlabel('time (h)','Fontsize',14)
        ylabel('ATR* (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         ax(pATR_subplot_numb,n)=gca;
         %title('(E)', 'FontSize', 15);
        box off

        subplot(2,3,Chk1_subplot_numb)
        plot(time,1e3*sim(:,17),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 25])
        ylim([8 16])
        xlabel('time (h)','Fontsize',14)
        ylabel('Chk1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         ax(Chk1_subplot_numb,n)=gca;
         %title('(F)', 'FontSize', 15);
        box off

        subplot(2,3,pChk1_subplot_numb)
        plot(time,1e3*sim(:,18),'color',color_mat(n,:),'LineWidth',3);
        hold on
         xlim([-0.1 25])
%         ylim([1.5 8])
        xlabel('time (h)','Fontsize',14)
        ylabel('Chk1* (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
         ax(pChk1_subplot_numb,n)=gca;
         %title('(G)', 'FontSize', 15);
        box off

    end



end

