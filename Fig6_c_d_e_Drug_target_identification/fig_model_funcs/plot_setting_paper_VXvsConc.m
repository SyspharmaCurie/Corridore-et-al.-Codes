function plot_setting_paper_VXvsConc(um_cell,...simulations
    VX_Jack2D,MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm,MGMT_Jack_inhATR_VXcon_MGMT_M_norm,MGMT_Jack_inhATR_MGMT_M_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Chk1_Jack_inhATR_MGMT_M_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,pChk1_Jack_inhATR_VXcon_MGMT_M_norm,pChk1_Jack_inhATR_MGMT_M_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm,MGMT_Jack_inhATR_VXcon_MGMT_P_norm,MGMT_Jack_inhATR_MGMT_P_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk1_Jack_inhATR_VXcon_MGMT_P_norm,Chk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,pChk1_Jack_inhATR_VXcon_MGMT_P_norm,pChk1_Jack_inhATR_MGMT_P_norm,...
    paper_VXvsConc_fig,...plot control
    paper_VXvsConc_fignumb,...%plot figure number
    numb_comptime1 ...other
    )

global sn_Jack_MGMT_M sn_Jack_MGMT_P...
    sn_Jack_inhATR_TMZVXcon_MGMT_M sn_Jack_inhATR_VXcon_MGMT_M sn_Jack_inhATR8VX_MGMT_M sn_Jack_inhATR40VX_MGMT_M sn_Jack_inhATR200VX_MGMT_M sn_Jack_inhATR1000VX_MGMT_M ...
    sn_Jack_inhATR_TMZVXcon_MGMT_P sn_Jack_inhATR_VXcon_MGMT_P sn_Jack_inhATR8VX_MGMT_P sn_Jack_inhATR40VX_MGMT_P sn_Jack_inhATR200VX_MGMT_P sn_Jack_inhATR1000VX_MGMT_P ...
    sn_Aas ...
    sn_He_1TMZ_MGMT_M_72h sn_He_2TMZ_MGMT_M_72h sn_He_3TMZ_MGMT_M_72h sn_He_4TMZ_MGMT_M_72h sn_He_5TMZ_MGMT_M_72h sn_He_10TMZ_MGMT_M_72h sn_He_15TMZ_MGMT_M_72h sn_He_20TMZ_MGMT_M_72h ...
    sn_He_12_5TMZ_MGMT_M_72h sn_He_25TMZ_MGMT_M_72h sn_He_50TMZ_MGMT_M_72h sn_He_75TMZ_MGMT_M_72h sn_He_100TMZ_MGMT_M_72h sn_He_125TMZ_MGMT_M_72h ...
    sn_He_1TMZ_MGMT_P_72h sn_He_2TMZ_MGMT_P_72h sn_He_3TMZ_MGMT_P_72h sn_He_4TMZ_MGMT_P_72h sn_He_5TMZ_MGMT_P_72h sn_He_10TMZ_MGMT_P_72h sn_He_15TMZ_MGMT_P_72h sn_He_20TMZ_MGMT_P_72h ...
    sn_Ka_24TMZ_MGMT_M sn_Ka_50TMZ_MGMT_M sn_Ka_75TMZ_MGMT_M sn_Ka_100TMZ_MGMT_M sn_Ka_XTMZ_MGMT_M...
    sn_Ka_24TMZ_MGMT_P sn_Ka_50TMZ_MGMT_P sn_Ka_75TMZ_MGMT_P sn_Ka_100TMZ_MGMT_P sn_Ka_XTMZ_MGMT_P...
    sn_Jack_0TMZ_MGMT_M_144h sn_Jack_1TMZ_MGMT_M_144h sn_Jack_2TMZ_MGMT_M_144h sn_Jack_4TMZ_MGMT_M_144h sn_Jack_8TMZ_MGMT_M_144h sn_Jack_16TMZ_MGMT_M_144h sn_Jack_32TMZ_MGMT_M_144h ...
    sn_Jack_64TMZ_MGMT_M_144h sn_Jack_128TMZ_MGMT_M_144h sn_Jack_256TMZ_MGMT_M_144h sn_Jack_512TMZ_MGMT_M_144h sn_Jack_1024TMZ_MGMT_M_144h...
    sn_Jack_0TMZ_MGMT_P_144h sn_Jack_1TMZ_MGMT_P_144h sn_Jack_2TMZ_MGMT_P_144h sn_Jack_4TMZ_MGMT_P_144h sn_Jack_8TMZ_MGMT_P_144h sn_Jack_16TMZ_MGMT_P_144h sn_Jack_32TMZ_MGMT_P_144h...
    sn_Jack_64TMZ_MGMT_P_144h sn_Jack_128TMZ_MGMT_P_144h sn_Jack_256TMZ_MGMT_P_144h sn_Jack_512TMZ_MGMT_P_144h sn_Jack_1024TMZ_MGMT_P_144h...
    sim_mumber

%%%%% Jackson inhibited ATR%%%%%
if paper_VXvsConc_fig==1 
    clf(figure(paper_VXvsConc_fignumb));
    figure(paper_VXvsConc_fignumb)
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
    %% Model simulations
%     um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M}
%     um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P} 
    Jack_inhATR_MGMT_M_sim_cell={um_cell{sn_Jack_inhATR_VXcon_MGMT_M} um_cell{sn_Jack_inhATR8VX_MGMT_M} um_cell{sn_Jack_inhATR40VX_MGMT_M} um_cell{sn_Jack_inhATR200VX_MGMT_M} um_cell{sn_Jack_inhATR1000VX_MGMT_M}};
    Jack_inhATR_MGMT_P_sim_cell={um_cell{sn_Jack_inhATR_VXcon_MGMT_P} um_cell{sn_Jack_inhATR8VX_MGMT_P} um_cell{sn_Jack_inhATR40VX_MGMT_P} um_cell{sn_Jack_inhATR200VX_MGMT_P} um_cell{sn_Jack_inhATR1000VX_MGMT_P}};
   
    sim_numb=size(Jack_inhATR_MGMT_M_sim_cell,2);
    for n=1:sim_numb
            Jack_inhATR_MGMT_M_sim=cell2mat(Jack_inhATR_MGMT_M_sim_cell(n));
            MGMT_24h_vec_MGMT_M(n)=Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,10);
            O6meG_tot_24h_vec_MGMT_M(n)=Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,8)+Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,11)+Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,12);
            DSB_24h_vec_MGMT_M(n)=Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,14);
            pATR_24h_vec_MGMT_M(n)=Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,16);
            Chk1_24h_vec_MGMT_M(n)=Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,17);
            pChk1_24h_vec_MGMT_M(n)=Jack_inhATR_MGMT_M_sim(24*numb_comptime1+1,18);
            
            Jack_inhATR_MGMT_P_sim=cell2mat(Jack_inhATR_MGMT_P_sim_cell(n));
            MGMT_24h_vec_MGMT_P(n)=Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,10);
            O6meG_tot_24h_vec_MGMT_P(n)=Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,8)+Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,11)+Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,12);
            DSB_24h_vec_MGMT_P(n)=Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,14);
            pATR_24h_vec_MGMT_P(n)=Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,16);
            Chk1_24h_vec_MGMT_P(n)=Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,17);
            pChk1_24h_vec_MGMT_P(n)=Jack_inhATR_MGMT_P_sim(24*numb_comptime1+1,18);  
     end
    
    %% Data
    VX_Jack2D_plot=1e3*VX_Jack2D;
    VX_Jack2D_plot(1:2)=[0.1 0.1];
    MGMT_Jack_inhATR_MGMT_M_data=[MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm MGMT_Jack_inhATR_VXcon_MGMT_M_norm MGMT_Jack_inhATR_MGMT_M_norm];
    Chk1_Jack_inhATR_MGMT_M_data=[Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm Chk1_Jack_inhATR_VXcon_MGMT_M_norm Chk1_Jack_inhATR_MGMT_M_norm];
    pChk1_Jack_inhATR_MGMT_M_data=[pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm pChk1_Jack_inhATR_VXcon_MGMT_M_norm pChk1_Jack_inhATR_MGMT_M_norm];

    MGMT_Jack_inhATR_MGMT_P_data=[MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm MGMT_Jack_inhATR_VXcon_MGMT_P_norm MGMT_Jack_inhATR_MGMT_P_norm];
    Chk1_Jack_inhATR_MGMT_P_data=[Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm Chk1_Jack_inhATR_VXcon_MGMT_P_norm Chk1_Jack_inhATR_MGMT_P_norm];
    pChk1_Jack_inhATR_MGMT_P_data=[pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm pChk1_Jack_inhATR_VXcon_MGMT_P_norm pChk1_Jack_inhATR_MGMT_P_norm];
    
    

    %% plot
[color_mat_VXvsConc_MGMT_M,color_mat_VXvsConc_MGMT_P] = color_VXvsConc();
      
    MGMT_subplot_numb=1;
    O6meG_tot_subplot_numb=2;
    DSB_subplot_numb=3;
    pATR_subplot_numb=4;
    Chk1_subplot_numb=5;
    pChk1_subplot_numb=6;

    subplot(2,3,MGMT_subplot_numb);
    semilogx(VX_Jack2D_plot(2:6),1e3*MGMT_24h_vec_MGMT_M,'-b','LineWidth',3);
    hold on
    semilogx(VX_Jack2D_plot(2:6),1e3*MGMT_24h_vec_MGMT_P,'-r','LineWidth',3);
    for n=1:6
        scatter(VX_Jack2D_plot(n),1e3*MGMT_Jack_inhATR_MGMT_M_data(n),80,'filled','MarkerFaceColor',color_mat_VXvsConc_MGMT_M(n,:),'MarkerEdgeColor',[0 0 0])
        hold on
        scatter(VX_Jack2D_plot(n),1e3*MGMT_Jack_inhATR_MGMT_P_data(n),80,'filled','MarkerFaceColor',color_mat_VXvsConc_MGMT_P(n,:),'MarkerEdgeColor',[0 0 0])
    end
    xlim([0.1 1100])
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    ylabel('MGMT protein (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',2)
    title('(A)', 'FontSize', 15);
    box off

    subplot(2,3,O6meG_tot_subplot_numb)
    semilogx(VX_Jack2D_plot(2:6),1e3*O6meG_tot_24h_vec_MGMT_M,'-b','LineWidth',3);
    hold on
    semilogx(VX_Jack2D_plot(2:6),1e3*O6meG_tot_24h_vec_MGMT_P,'-r','LineWidth',3);
    xlim([0.1 1100])
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    ylabel('O6meG tot (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',2)
    title('(B)', 'FontSize', 15);
    
    box off

    subplot(2,3,DSB_subplot_numb)
    semilogx(VX_Jack2D_plot(2:6),1e3*DSB_24h_vec_MGMT_M,'-b','LineWidth',3);
    hold on
    semilogx(VX_Jack2D_plot(2:6),1e3*DSB_24h_vec_MGMT_P,'-r','LineWidth',3);
    xlim([0.1 1100])
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    ylabel('DSB (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',2)
    title('(C)', 'FontSize', 15);
    box off

    subplot(2,3,pATR_subplot_numb)
    semilogx(VX_Jack2D_plot(2:6),1e3*pATR_24h_vec_MGMT_M,'-b','LineWidth',3);
    hold on
    semilogx(VX_Jack2D_plot(2:6),1e3*pATR_24h_vec_MGMT_P,'-r','LineWidth',3);
    xlim([0.1 1100])
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    xlabel('VX-970 (\muM)','Fontsize',14)
    ylabel('ATR* (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',2)
    title('(D)', 'FontSize', 15);
    box off

    subplot(2,3,Chk1_subplot_numb);
    semilogx(VX_Jack2D_plot(2:6),1e3*Chk1_24h_vec_MGMT_M,'-b','LineWidth',3);
    hold on
    semilogx(VX_Jack2D_plot(2:6),1e3*Chk1_24h_vec_MGMT_P,'-r','LineWidth',3);
    for n=1:6
        scatter(VX_Jack2D_plot(n),1e3*Chk1_Jack_inhATR_MGMT_M_data(n),80,'filled','MarkerFaceColor',color_mat_VXvsConc_MGMT_M(n,:),'MarkerEdgeColor',[0 0 0])
        hold on
        scatter(VX_Jack2D_plot(n),1e3*Chk1_Jack_inhATR_MGMT_P_data(n),80,'filled','MarkerFaceColor',color_mat_VXvsConc_MGMT_P(n,:),'MarkerEdgeColor',[0 0 0])
    end
    xlim([0.1 1100])
    ylim([6 16])
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    xlabel('VX-970 (\muM)','Fontsize',14)
    ylabel('Chk1 (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',2)
    title('(E)', 'FontSize', 15);
    box off

    subplot(2,3,pChk1_subplot_numb);
    semilogx(VX_Jack2D_plot(2:6),1e3*pChk1_24h_vec_MGMT_M,'-b','LineWidth',3);
    hold on
    semilogx(VX_Jack2D_plot(2:6),1e3*pChk1_24h_vec_MGMT_P,'-r','LineWidth',3);
    for n=1:6
        scatter(VX_Jack2D_plot(n),1e3*pChk1_Jack_inhATR_MGMT_M_data(n),80,'filled','MarkerFaceColor',color_mat_VXvsConc_MGMT_M(n,:),'MarkerEdgeColor',[0 0 0])
        hold on
        scatter(VX_Jack2D_plot(n),1e3*pChk1_Jack_inhATR_MGMT_P_data(n),80,'filled','MarkerFaceColor',color_mat_VXvsConc_MGMT_P(n,:),'MarkerEdgeColor',[0 0 0])
    end
    xlim([0.1 1100])
    ylim([0 5])
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    xlabel('VX-970 (\muM)','Fontsize',14)
    ylabel('Chk1* (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',2)
    title('(F)', 'FontSize', 15);
    box off

end
end

