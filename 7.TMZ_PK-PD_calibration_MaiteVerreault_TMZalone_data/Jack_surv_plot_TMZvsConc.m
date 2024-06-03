function Jack_surv_plot_TMZvsConc(um_cell,Jack_surv_curvm_MGMT_M,Jack_surv_curvm_MGMT_P,...
    numb_comptime1,...parameter
    TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,...data
    surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
    Jack_surv_plot_TMZvsConc_fig,Jack_surv_plot_TMZvsConc_fignumb)

global sn_Jack_MGMT_M sn_Jack_MGMT_P...
    sn_Jack_inhATR_TMZVXcon_MGMT_M sn_Jack_inhATR_VXcon_MGMT_M sn_Jack_inhATR8VX_MGMT_M sn_Jack_inhATR40VX_MGMT_M sn_Jack_inhATR200VX_MGMT_M sn_Jack_inhATR1000VX_MGMT_M ...
    sn_Jack_inhATR_TMZVXcon_MGMT_P sn_Jack_inhATR_VXcon_MGMT_P sn_Jack_inhATR8VX_MGMT_P sn_Jack_inhATR40VX_MGMT_P sn_Jack_inhATR200VX_MGMT_P sn_Jack_inhATR1000VX_MGMT_P ...
    sn_Aas ...
    sn_He_0TMZ_MGMT_M_72h sn_He_1TMZ_MGMT_M_72h sn_He_2TMZ_MGMT_M_72h sn_He_3TMZ_MGMT_M_72h sn_He_4TMZ_MGMT_M_72h sn_He_5TMZ_MGMT_M_72h sn_He_10TMZ_MGMT_M_72h sn_He_15TMZ_MGMT_M_72h sn_He_20TMZ_MGMT_M_72h ...
    sn_He_12_5TMZ_MGMT_M_72h sn_He_25TMZ_MGMT_M_72h sn_He_50TMZ_MGMT_M_72h sn_He_75TMZ_MGMT_M_72h sn_He_100TMZ_MGMT_M_72h sn_He_125TMZ_MGMT_M_72h ...
    sn_He_0TMZ_MGMT_P_72h sn_He_1TMZ_MGMT_P_72h sn_He_2TMZ_MGMT_P_72h sn_He_3TMZ_MGMT_P_72h sn_He_4TMZ_MGMT_P_72h sn_He_5TMZ_MGMT_P_72h sn_He_10TMZ_MGMT_P_72h sn_He_15TMZ_MGMT_P_72h sn_He_20TMZ_MGMT_P_72h ...
    sn_Ka_24TMZ_MGMT_M sn_Ka_50TMZ_MGMT_M sn_Ka_75TMZ_MGMT_M sn_Ka_100TMZ_MGMT_M sn_Ka_XTMZ_MGMT_M...
    sn_Ka_24TMZ_MGMT_P sn_Ka_50TMZ_MGMT_P sn_Ka_75TMZ_MGMT_P sn_Ka_100TMZ_MGMT_P sn_Ka_XTMZ_MGMT_P...
    sn_surv_250TMZ_MGMT_M_24h sn_surv_500TMZ_MGMT_M_24h sn_surv_1000TMZ_MGMT_M_24h sn_surv_1500TMZ_MGMT_M_24h sn_surv_2000TMZ_MGMT_M_24h...
    sn_surv_25TMZ_MGMT_M_48h sn_surv_50TMZ_MGMT_M_48h...
    sn_surv_100TMZ_MGMT_M_72h sn_surv_200TMZ_MGMT_M_72h sn_surv_300TMZ_MGMT_M_72h sn_surv_400TMZ_MGMT_M_72h...
    sn_surv_0TMZ_MGMT_M_144h sn_surv_1TMZ_MGMT_M_144h sn_surv_2TMZ_MGMT_M_144h sn_surv_4TMZ_MGMT_M_144h sn_surv_8TMZ_MGMT_M_144h sn_surv_16TMZ_MGMT_M_144h sn_surv_32TMZ_MGMT_M_144h ...
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h...
    sim_number

if Jack_surv_plot_TMZvsConc_fig==1
    
% Model
    Jack_surv_MGMT_M_sim_cell={um_cell{sn_surv_0TMZ_MGMT_M_144h} um_cell{sn_surv_1TMZ_MGMT_M_144h} um_cell{sn_surv_2TMZ_MGMT_M_144h} um_cell{sn_surv_4TMZ_MGMT_M_144h} um_cell{sn_surv_8TMZ_MGMT_M_144h} um_cell{sn_surv_16TMZ_MGMT_M_144h} um_cell{sn_surv_32TMZ_MGMT_M_144h} um_cell{sn_surv_64TMZ_MGMT_M_144h} um_cell{sn_surv_128TMZ_MGMT_M_144h} um_cell{sn_surv_256TMZ_MGMT_M_144h} um_cell{sn_surv_512TMZ_MGMT_M_144h} um_cell{sn_surv_1024TMZ_MGMT_M_144h}};
    Jack_surv_MGMT_P_sim_cell={um_cell{sn_surv_0TMZ_MGMT_P_144h} um_cell{sn_surv_1TMZ_MGMT_P_144h} um_cell{sn_surv_2TMZ_MGMT_P_144h} um_cell{sn_surv_4TMZ_MGMT_P_144h} um_cell{sn_surv_8TMZ_MGMT_P_144h} um_cell{sn_surv_16TMZ_MGMT_P_144h} um_cell{sn_surv_32TMZ_MGMT_P_144h} um_cell{sn_surv_64TMZ_MGMT_P_144h} um_cell{sn_surv_128TMZ_MGMT_P_144h} um_cell{sn_surv_256TMZ_MGMT_P_144h} um_cell{sn_surv_512TMZ_MGMT_P_144h} um_cell{sn_surv_1024TMZ_MGMT_P_144h}};
    
    Jack_surv_MGMT_M_sim_numb=size(Jack_surv_MGMT_M_sim_cell,2);
    O6meG_tot_144h_vec_MGMT_M=zeros(1,Jack_surv_MGMT_M_sim_numb);
    DSB_144h_vec_MGMT_M=zeros(1,Jack_surv_MGMT_M_sim_numb);
    pATR_144h_vec_MGMT_M=zeros(1,Jack_surv_MGMT_M_sim_numb);
    p53_144h_vec_MGMT_M=zeros(1,Jack_surv_MGMT_M_sim_numb);
    p53ser46_144h_vec_MGMT_M=zeros(1,Jack_surv_MGMT_M_sim_numb);
    
    Jack_surv_MGMT_P_sim_numb=size(Jack_surv_MGMT_P_sim_cell,2);
    O6meG_tot_144h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    DSB_144h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    pATR_144h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    p53_144h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    p53ser46_144h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);

     for n=1:Jack_surv_MGMT_M_sim_numb
            Jack_surv_MGMT_M_sim=cell2mat(Jack_surv_MGMT_M_sim_cell(n));
            O6meG_tot_144h_vec_MGMT_M(n)=Jack_surv_MGMT_M_sim(144*numb_comptime1+1,8)+Jack_surv_MGMT_M_sim(144*numb_comptime1+1,11)+Jack_surv_MGMT_M_sim(144*numb_comptime1+1,12);
            DSB_144h_vec_MGMT_M(n)=Jack_surv_MGMT_M_sim(144*numb_comptime1+1,14);
            pATR_144h_vec_MGMT_M(n)=Jack_surv_MGMT_M_sim(144*numb_comptime1+1,16);
            p53_144h_vec_MGMT_M(n)=Jack_surv_MGMT_M_sim(144*numb_comptime1+1,20);
            p53ser46_144h_vec_MGMT_M(n)=Jack_surv_MGMT_M_sim(144*numb_comptime1+1,21);
     end
     for n=1:Jack_surv_MGMT_P_sim_numb
            Jack_surv_MGMT_P_sim=cell2mat(Jack_surv_MGMT_P_sim_cell(n));
            O6meG_tot_144h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(144*numb_comptime1+1,8)+Jack_surv_MGMT_P_sim(144*numb_comptime1+1,11)+Jack_surv_MGMT_P_sim(144*numb_comptime1+1,12);
            DSB_144h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(144*numb_comptime1+1,14);
            pATR_144h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(144*numb_comptime1+1,16);
            p53_144h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(144*numb_comptime1+1,20);
            p53ser46_144h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(144*numb_comptime1+1,21);
     end
    % plot
    clf(figure(Jack_surv_plot_TMZvsConc_fignumb));
    figure(Jack_surv_plot_TMZvsConc_fignumb)
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
        O6meG_tot_subplot_numb=1;
    DSB_subplot_numb=2;
    pATR_subplot_numb=3;
    p53_subplot_numb=5;
    p53ser46_subplot_numb=6;
    
    subplot(3,2,O6meG_tot_subplot_numb)
    semilogx(TMZout0_surv_Jack_MGMT_M,1e3*O6meG_tot_144h_vec_MGMT_M,'color','b','LineWidth',3);
    hold on
    semilogx(TMZout0_surv_Jack_MGMT_P,1e3*O6meG_tot_144h_vec_MGMT_P,'color','r','LineWidth',3);
    xlim([0.1 1e3])
    ylabel('O6meG tot (nM)','Fontsize',14)
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
    title('(A)', 'FontSize', 15);
    legend('MGMT-','MGMT+')
    box off
    
    subplot(3,2,DSB_subplot_numb)
    semilogx(TMZout0_surv_Jack_MGMT_M,1e3*DSB_144h_vec_MGMT_M,'color','b','LineWidth',3);
    hold on
    semilogx(TMZout0_surv_Jack_MGMT_P,1e3*DSB_144h_vec_MGMT_P,'color','r','LineWidth',3);
    xlim([0.1 1e3])
    ylabel('DSB (nM)','Fontsize',14)
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
    title('(B)', 'FontSize', 15);
    box off
    
    subplot(3,2,pATR_subplot_numb)
    semilogx(TMZout0_surv_Jack_MGMT_M,1e3*pATR_144h_vec_MGMT_M,'color','b','LineWidth',3);
    hold on
    semilogx(TMZout0_surv_Jack_MGMT_P,1e3*pATR_144h_vec_MGMT_P,'color','r','LineWidth',3);
    xlim([0.1 1e3])
    ylabel('pATR (nM)','Fontsize',14)
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
    title('(C)', 'FontSize', 15);
    box off
    
    subplot(3,2,p53_subplot_numb)
    semilogx(TMZout0_surv_Jack_MGMT_M,1e3*p53_144h_vec_MGMT_M,'color','b','LineWidth',3);
    hold on
    semilogx(TMZout0_surv_Jack_MGMT_P,1e3*p53_144h_vec_MGMT_P,'color','r','LineWidth',3);
    xlim([0.1 1e3])
    xlabel('TMZ (\muM)')
    ylabel('p53 (nM)','Fontsize',14)
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
    title('(D)', 'FontSize', 15);
    box off
         
    subplot(3,2,p53ser46_subplot_numb)
    semilogx(TMZout0_surv_Jack_MGMT_M,1e3*p53ser46_144h_vec_MGMT_M,'color','b','LineWidth',3);
    hold on
    semilogx(TMZout0_surv_Jack_MGMT_P,1e3*p53ser46_144h_vec_MGMT_P,'color','r','LineWidth',3);
    xlim([0.1 1e3])
    ylabel('p53ser46 (nM)','Fontsize',14)
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
    title('(E)', 'FontSize', 15);
    box off
    
      


end

end

