function [] = plot_paper_temDyn(fig_num,t_cell,sim_cell,CyA_cell,MGMT,TMZ,numb_comptime1,upAsy,sness,tED50)

sim_numb=size(t_cell,2);


color_mat = color_paper_temDyn(sim_numb,MGMT,TMZ);
legend_label=legend_writer_paper_1(MGMT,TMZ);

for n=1:length(MGMT)
    if MGMT(n)=='m'
        plotline(n)='-';
    elseif MGMT(n)=='p'
        plotline(n)=':';
    end
end

TMZin_subplot_numb=1;
N37meAG_subplot_numb=2;
MGMT_subplot_numb=3;
O6meG_subplot_numb=4;
SSB_subplot_numb=5;
DSB_subplot_numb=6;
ATR_subplot_numb=7;
pATR_subplot_numb=8;
Chk1_subplot_numb=9;
pChk1_subplot_numb=10;
Cdc25_subplot_numb=11;
CyA_subplot_numb=12;
p53_subplot_numb=13;
p53ser46_subplot_numb=14;
int_p53ser46=15;

xsup=120;

clf(figure(fig_num));
    figure(fig_num);
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3.5)
         
    for n=1:sim_numb
        time=cell2mat(t_cell(:,n));
        sim=cell2mat(sim_cell(:,n));
        CyA=cell2mat(CyA_cell(:,n));
        [t_p53_vec,p53_vec]= cell_pop_p53vec(time(end),numb_comptime1,time,sim);
        p53_integr_vec=cumtrapz(t_p53_vec,p53_vec) ;
        logistic_f_vec=cell_pop_logistic_f(t_p53_vec,upAsy,sness,tED50);

        subplot(4,4,TMZin_subplot_numb)
        plot(time,1e3*sim(:,2),plotline(n),'color',color_mat(n,:),'LineWidth',3.5,'DisplayName', legend_label(n,:));
        color_mat(n,:)
        hold on
        xlim([-5 xsup])
        ylim([0 3.5e4])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('TMZ (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         legend('fontweight','default','FontSize','default');
         %title('(A)', 'FontSize', 15);
        box off
    
        subplot(4,4,N37meAG_subplot_numb)
         plot(time,1e3*sim(:,12),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
         hold on
         xlim([-5 xsup])
         %xlabel('Time (h)','Fontsize',14)
         ylabel('N37mA/G (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(C)', 'FontSize', 15);
         box off

        subplot(4,4,MGMT_subplot_numb)
        plot(time,1e3*sim(:,9),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        % ylim([0 3.9])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('MGMT protein (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(D)', 'FontSize', 15);
        box off
        
         subplot(4,4,O6meG_subplot_numb)
         plot(time,1e3*sim(:,8),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
         hold on
         xlim([-10 xsup])
         %xlabel('Time (h)','Fontsize',14)
         ylabel('O6mG (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(E)', 'FontSize', 15);
         box off

        subplot(4,4,SSB_subplot_numb)
        plot(time,1e3*sim(:,11),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('SSB (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(G)', 'FontSize', 15);
        box off

        subplot(4,4,DSB_subplot_numb)
        plot(time,1e3*sim(:,13),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('DSB (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(H)', 'FontSize', 15);
        box off

        subplot(4,4,ATR_subplot_numb)
        plot(time,1e3*sim(:,14),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        ylim([0 inf])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('ATR (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(I)', 'FontSize', 15);
        box off

        subplot(4,4,pATR_subplot_numb)
        plot(time,1e3*sim(:,15),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        % ylim([-1 120])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('pATR (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(I)', 'FontSize', 15);
        box off

        subplot(4,4,Chk1_subplot_numb)
        plot(time,1e3*sim(:,16),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        ylim([0 inf])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('Chk1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(K)', 'FontSize', 15);
        box off

        subplot(4,4,pChk1_subplot_numb)
        plot(time,1e3*sim(:,17),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
         xlim([-1 xsup])
        %xlabel('Time (h)','Fontsize',14)
        ylabel('pChk1 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(J)', 'FontSize', 15);
        box off

        subplot(4,4,p53_subplot_numb)
        plot(time,1e3*sim(:,19),plotline(n),'color',color_mat(n,:),'LineWidth',3.5,'DisplayName', legend_label(n,:));
        hold on
        xlim([-1 xsup])
        % ylim([0 3.9])
        xlabel('Time (h)','Fontsize',14)
        ylabel('p53 (nM)','Fontsize',14)
        set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
%          legend('fontweight','default','FontSize','default');
        legend('off');    
         %title('(M)', 'FontSize', 15);
        box off
         
        subplot(4,4,p53ser46_subplot_numb)
        plot(time,1e3*sim(:,20),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        xlabel('Time (h)','Fontsize',14)
        ylabel('p53ser46 (nM)','Fontsize',14)
        set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(N)', 'FontSize', 15);
        box off
        
        subplot(4,4,int_p53ser46)
        plot(t_p53_vec,logistic_f_vec,'--','color',[0 0.7 0],'LineWidth',2)
        hold on
        plot(t_p53_vec,p53_integr_vec,plotline(n),'color',color_mat(n,:),'LineWidth',3.5)
        xlabel('Time (h)','Fontsize',14)
        ylabel('\int p53');
        set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
        box off
        
        subplot(4,4,Cdc25_subplot_numb)
        plot(time,1e3*sim(:,18),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        % ylim([-1 120])
        xlabel('Time (h)','Fontsize',14)
        ylabel('Cdc25 (nM)','Fontsize',14)
         set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
         %title('(O)', 'FontSize', 15);
        box off
        
        subplot(4,4,CyA_subplot_numb)
%         yyaxis left
        plot(time, CyA,plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
        hold on
        xlim([-1 xsup])
        ylabel('S-phase (a.u.)','Fontsize',14)
        xlabel('Time (h)','Fontsize',14)
        set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
        %title('(P)', 'FontSize', 15);
%         yyaxis right
%         plot(time, CyA.^n_cc./(K_cc.^n_cc+CyA.^n_cc),plotline(n),'color',color_mat(n,:),'LineWidth',3.5);
%         ylabel('CyA Hill fun','Fontsize',14)
%         hold on
        box off

    end

end

