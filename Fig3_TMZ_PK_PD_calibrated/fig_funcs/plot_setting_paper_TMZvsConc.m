function plot_setting_paper_TMZvsConc(um_cell,Jack_surv_curvm_MGMT_M,Jack_surv_curvm_MGMT_P,...simulations
    TMZout0_He_ld,He_ld_apop_curvm_MGMT_M_120h,TMZout0_He_hd,He_hd_apop_curvm_MGMT_M_72h,He_hd_apop_curvm_MGMT_M_96h,He_hd_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_144h,...
    He_ld_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_72h,He_hd_apop_curvm_MGMT_P_96h,He_hd_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_144h,...
    DSB_He_ldTMZ_MGMT_M_72h,DSB_He_ldTMZ_MGMT_P_72h,...data
    p53_He_ldTMZ_MGMT_M_24h_norm,p53_He_ldTMZ_MGMT_M_72h_norm,p53ser46_He_ldTMZ_MGMT_M_24h_norm,p53ser46_He_ldTMZ_MGMT_M_72h_norm,...
    apop_mean_He_ldTMZ_MGMT_M_120h,apop_stddev_He_ldTMZ_MGMT_M_120h,...
    apop_mean_He_ldTMZ_MGMT_P_120h,apop_stddev_He_ldTMZ_MGMT_P_120h,...
    TMZdata_He_hd,p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    apop_mean_He_hdTMZ_MGMT_M_72h,apop_stddev_He_hdTMZ_MGMT_M_72h,...
    apop_mean_He_hdTMZ_MGMT_M_96h,apop_stddev_He_hdTMZ_MGMT_M_96h,...
    apop_mean_He_hdTMZ_MGMT_M_120h,apop_stddev_He_hdTMZ_MGMT_M_120h,...
    apop_mean_He_hdTMZ_MGMT_M_144h,apop_stddev_He_hdTMZ_MGMT_M_144h,...
    apop_mean_He_hdTMZ_MGMT_P_72h,apop_stddev_He_hdTMZ_MGMT_P_72h,...
    apop_mean_He_hdTMZ_MGMT_P_96h,apop_stddev_He_hdTMZ_MGMT_P_96h,...
    apop_mean_He_hdTMZ_MGMT_P_120h,apop_stddev_He_hdTMZ_MGMT_P_120h,...
    apop_mean_He_hdTMZ_MGMT_P_144h,apop_stddev_He_hdTMZ_MGMT_P_144h,...
    TMZout0_Ka_XTMZ,O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A,O6Meg_Ka_3h_MGMT_M,TMZdata_O6Meg_Ka_3h_MGMT_P,O6Meg_Ka_3h_MGMT_P,...
    TMZout0_surv_Jack_MGMT_M,TMZdata_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,TMZdata_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
    paper_TMZvsConc_fig,...plot control
    paper_TMZvsConc_fignumb,...%plot figure number
    numb_comptime1,DSB_72h ...other
    )


global sn_Jack_MGMT_M sn_Jack_MGMT_P...
    sn_Jack_inhATR_TMZVXcon_MGMT_M sn_Jack_inhATR_VXcon_MGMT_M sn_Jack_inhATR8VX_MGMT_M sn_Jack_inhATR40VX_MGMT_M sn_Jack_inhATR200VX_MGMT_M sn_Jack_inhATR1000VX_MGMT_M ...
    sn_Jack_inhATR_TMZVXcon_MGMT_P sn_Jack_inhATR_VXcon_MGMT_P sn_Jack_inhATR8VX_MGMT_P sn_Jack_inhATR40VX_MGMT_P sn_Jack_inhATR200VX_MGMT_P sn_Jack_inhATR1000VX_MGMT_P ...
    sn_Aas ...
    sn_He_0TMZ_MGMT_M_144h sn_He_1TMZ_MGMT_M_144h sn_He_2TMZ_MGMT_M_144h sn_He_3TMZ_MGMT_M_144h sn_He_4TMZ_MGMT_M_144h sn_He_5TMZ_MGMT_M_144h sn_He_10TMZ_MGMT_M_144h sn_He_15TMZ_MGMT_M_144h sn_He_20TMZ_MGMT_M_144h ...
    sn_He_12_5TMZ_MGMT_M_144h sn_He_25TMZ_MGMT_M_144h sn_He_50TMZ_MGMT_M_144h sn_He_75TMZ_MGMT_M_144h sn_He_100TMZ_MGMT_M_144h sn_He_125TMZ_MGMT_M_144h ...
    sn_He_0TMZ_MGMT_P_144h sn_He_1TMZ_MGMT_P_144h sn_He_2TMZ_MGMT_P_144h sn_He_3TMZ_MGMT_P_144h sn_He_4TMZ_MGMT_P_144h sn_He_5TMZ_MGMT_P_144h sn_He_10TMZ_MGMT_P_144h sn_He_15TMZ_MGMT_P_144h sn_He_20TMZ_MGMT_P_144h ...
    sn_He_12_5TMZ_MGMT_P_144h sn_He_25TMZ_MGMT_P_144h sn_He_50TMZ_MGMT_P_144h sn_He_75TMZ_MGMT_P_144h sn_He_100TMZ_MGMT_P_144h sn_He_125TMZ_MGMT_P_144h ...
    sn_Ka_20TMZ_MGMT_M sn_Ka_50TMZ_MGMT_M sn_Ka_75TMZ_MGMT_M sn_Ka_XTMZ_MGMT_M...
    sn_Ka_20TMZ_MGMT_P sn_Ka_50TMZ_MGMT_P sn_Ka_100TMZ_MGMT_P sn_Ka_XTMZ_MGMT_P...
    sn_surv_0TMZ_MGMT_M_144h sn_surv_1TMZ_MGMT_M_144h sn_surv_2TMZ_MGMT_M_144h sn_surv_4TMZ_MGMT_M_144h sn_surv_8TMZ_MGMT_M_144h sn_surv_16TMZ_MGMT_M_144h sn_surv_32TMZ_MGMT_M_144h ...
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h sn_surv_3000TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h sn_surv_3000TMZ_MGMT_P_144h...
    sim_number

if paper_TMZvsConc_fig==1
    
    O6meG_tot_subplot_numb=1;
    DSB_subplot_numb=2;
    p53_subplot_numb=3;
    p53ser46_subplot_numb=4;
    apop_He_subplot_numb=5;
    surv_Jack_subplot_numb=6;

    clf(figure(paper_TMZvsConc_fignumb));
    figure(paper_TMZvsConc_fignumb)
    set(gcf,'Position', [100 200 900 600]);
    set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)
    
    %% subplot 1 2 3 4
    % model
    Ka_TMZ_MGMT_M=[0 20 TMZout0_Ka_XTMZ 50 75 100 125];
    Ka_TMZ_MGMT_P=[0 20 TMZout0_Ka_XTMZ 50 100 125];
    
    Ka_TMZ_data_MGMT_M=[20 TMZout0_Ka_XTMZ 50 75];

    Ka_MGMT_M_sim_cell= {um_cell{sn_He_0TMZ_MGMT_M_144h} um_cell{sn_Ka_20TMZ_MGMT_M} um_cell{sn_Ka_XTMZ_MGMT_M} um_cell{sn_Ka_50TMZ_MGMT_M} um_cell{sn_Ka_75TMZ_MGMT_M} um_cell{sn_He_100TMZ_MGMT_M_144h} um_cell{sn_He_125TMZ_MGMT_M_144h}};

    Ka_MGMT_P_sim_cell= {um_cell{sn_He_0TMZ_MGMT_P_144h} um_cell{sn_Ka_20TMZ_MGMT_P} um_cell{sn_Ka_XTMZ_MGMT_P} um_cell{sn_Ka_50TMZ_MGMT_P} um_cell{sn_Ka_100TMZ_MGMT_P} um_cell{sn_He_125TMZ_MGMT_P_144h}};

    O6meG_tot_3h_vec_MGMT_M=zeros(size(Ka_MGMT_M_sim_cell));
    O6meG_tot_3h_vec_MGMT_P=zeros(size(Ka_MGMT_P_sim_cell));

    for n=1:length(Ka_MGMT_M_sim_cell)
        Ka_MGMT_M_sim=cell2mat(Ka_MGMT_M_sim_cell(n));
        O6meG_tot_3h_vec_MGMT_M(n)=Ka_MGMT_M_sim(3*numb_comptime1+1,8)+Ka_MGMT_M_sim(3*numb_comptime1+1,10)+Ka_MGMT_M_sim(3*numb_comptime1+1,11);
    end
    for n=1:length(Ka_MGMT_P_sim_cell)
        Ka_MGMT_P_sim=cell2mat(Ka_MGMT_P_sim_cell(n));
        O6meG_tot_3h_vec_MGMT_P(n)=Ka_MGMT_P_sim(3*numb_comptime1+1,8)+Ka_MGMT_P_sim(3*numb_comptime1+1,10)+Ka_MGMT_P_sim(3*numb_comptime1+1,11);    
    end

    He_MGMT_M_TMZ=[TMZout0_He_ld TMZout0_He_hd];
    [He_MGMT_M_TMZ_sort,I_He_MGMT_M_TMZ_sort]=sort(He_MGMT_M_TMZ);
    He_all_MGMT_M_sim_cell={um_cell{sn_He_0TMZ_MGMT_M_144h} um_cell{sn_He_1TMZ_MGMT_M_144h} um_cell{sn_He_2TMZ_MGMT_M_144h} um_cell{sn_He_3TMZ_MGMT_M_144h} um_cell{sn_He_4TMZ_MGMT_M_144h} um_cell{sn_He_5TMZ_MGMT_M_144h} um_cell{sn_He_10TMZ_MGMT_M_144h} um_cell{sn_He_12_5TMZ_MGMT_M_144h} um_cell{sn_He_15TMZ_MGMT_M_144h} um_cell{sn_He_20TMZ_MGMT_M_144h}  um_cell{sn_He_25TMZ_MGMT_M_144h} um_cell{sn_He_50TMZ_MGMT_M_144h} um_cell{sn_He_75TMZ_MGMT_M_144h} um_cell{sn_He_100TMZ_MGMT_M_144h} um_cell{sn_He_125TMZ_MGMT_M_144h}};

    He_MGMT_M_sim_numb=length(He_all_MGMT_M_sim_cell);
    DSB_72h_vec_MGMT_M=zeros(1,He_MGMT_M_sim_numb);
    p53_24h_vec_MGMT_M=zeros(1,He_MGMT_M_sim_numb);
    p53_72h_vec_MGMT_M=zeros(1,He_MGMT_M_sim_numb);
    p53ser46_24h_vec_MGMT_M=zeros(1,He_MGMT_M_sim_numb);
    p53ser46_72h_vec_MGMT_M=zeros(1,He_MGMT_M_sim_numb);
    
    for n=1:He_MGMT_M_sim_numb
            He_MGMT_M_sim=cell2mat(He_all_MGMT_M_sim_cell(n));
            DSB_72h_vec_MGMT_M(n)=He_MGMT_M_sim(72*numb_comptime1+1,13);

            p53_24h_vec_MGMT_M(n)=He_MGMT_M_sim(24*numb_comptime1+1,19);
            p53_72h_vec_MGMT_M(n)=He_MGMT_M_sim(72*numb_comptime1+1,19);

            p53ser46_24h_vec_MGMT_M(n)=He_MGMT_M_sim(24*numb_comptime1+1,20);
            p53ser46_72h_vec_MGMT_M(n)=He_MGMT_M_sim(72*numb_comptime1+1,20);
    end
     
     
     He_ld_MGMT_P_sim_cell={um_cell{sn_He_0TMZ_MGMT_P_144h} um_cell{sn_He_1TMZ_MGMT_P_144h} um_cell{sn_He_2TMZ_MGMT_P_144h} um_cell{sn_He_3TMZ_MGMT_P_144h} um_cell{sn_He_4TMZ_MGMT_P_144h} um_cell{sn_He_5TMZ_MGMT_P_144h} um_cell{sn_He_10TMZ_MGMT_P_144h} um_cell{sn_He_15TMZ_MGMT_P_144h} um_cell{sn_He_20TMZ_MGMT_P_144h}};
     Jack_surv_MGMT_P_sim_cell={um_cell{sn_surv_0TMZ_MGMT_P_144h} um_cell{sn_surv_1TMZ_MGMT_P_144h} um_cell{sn_surv_2TMZ_MGMT_P_144h} um_cell{sn_surv_4TMZ_MGMT_P_144h} um_cell{sn_surv_8TMZ_MGMT_P_144h} um_cell{sn_surv_16TMZ_MGMT_P_144h} um_cell{sn_surv_32TMZ_MGMT_P_144h} um_cell{sn_surv_64TMZ_MGMT_P_144h} um_cell{sn_surv_128TMZ_MGMT_P_144h} um_cell{sn_surv_256TMZ_MGMT_P_144h} um_cell{sn_surv_512TMZ_MGMT_P_144h} um_cell{sn_surv_1024TMZ_MGMT_P_144h}};
     DSB_He_Jack_surv_MGMT_P_sim=[He_ld_MGMT_P_sim_cell Jack_surv_MGMT_P_sim_cell(7:end)];
     He_Jack_surv_MGMT_P_TMZ=[TMZout0_He_ld TMZout0_surv_Jack_MGMT_P(7:end-1)];
     
     DSB_He_Jack_surv_MGMT_P_sim_numb=length(DSB_He_Jack_surv_MGMT_P_sim);
     DSB_72h_vec_MGMT_P=zeros(1,DSB_He_Jack_surv_MGMT_P_sim_numb);

     for n=1:DSB_He_Jack_surv_MGMT_P_sim_numb
            He_Jack_surv_MGMT_P_sim=cell2mat(DSB_He_Jack_surv_MGMT_P_sim(n));
            DSB_72h_vec_MGMT_P(n)=He_Jack_surv_MGMT_P_sim(72*numb_comptime1+1,13);
     end
     
     
    Jack_surv_MGMT_P_sim_numb=size(Jack_surv_MGMT_P_sim_cell,2);
    p53_24h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    p53_72h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    p53ser46_24h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    p53ser46_72h_vec_MGMT_P=zeros(1,Jack_surv_MGMT_P_sim_numb);
    for n=1:Jack_surv_MGMT_P_sim_numb
            Jack_surv_MGMT_P_sim=cell2mat(Jack_surv_MGMT_P_sim_cell(n));
            p53_24h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(24*numb_comptime1+1,19);
            p53_72h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(72*numb_comptime1+1,19);

            p53ser46_24h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(24*numb_comptime1+1,20);
            p53ser46_72h_vec_MGMT_P(n)=Jack_surv_MGMT_P_sim(72*numb_comptime1+1,20);
     end

    % data
    O6Meg_Ka_LN229_MGMT_M_3h_data=zeros(1,4);
    O6Meg_Ka_LN229_MGMT_M_3h_data(2)=O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A(2);
    O6Meg_Ka_LN229_MGMT_M_3h_data([1 3 4])=O6Meg_Ka_3h_MGMT_M(2:4)';

    
    subplot(3,2,O6meG_tot_subplot_numb)
    plot(Ka_TMZ_MGMT_M,1e3*O6meG_tot_3h_vec_MGMT_M,'color',color_timedef('m',3),'LineWidth',3.5);
    hold on
    plot(Ka_TMZ_MGMT_P,1e3*O6meG_tot_3h_vec_MGMT_P,'color',color_timedef('p',3),'LineWidth',3.5);
    scatter(Ka_TMZ_data_MGMT_M,1e3*O6Meg_Ka_LN229_MGMT_M_3h_data,80,'filled','MarkerFaceColor',color_timedef('m',3))
    scatter(TMZdata_O6Meg_Ka_3h_MGMT_P,1e3*O6Meg_Ka_3h_MGMT_P,80,'filled','MarkerFaceColor',color_timedef('p',3))
    xlim([0 126])
%     ylim([0 175])
    ylabel('O6meG tot (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
    %title('(A)', 'FontSize', 15);
    legend('MGMT-,3h','MGMT+,3h','Location','northwest')
    box off
    
    subplot(3,2,DSB_subplot_numb)
    plot(He_MGMT_M_TMZ_sort,1e3*DSB_72h_vec_MGMT_M,'color',color_timedef('m',72),'LineWidth',3.5);
    hold on
    plot(He_Jack_surv_MGMT_P_TMZ,1e3*DSB_72h_vec_MGMT_P,'color',color_timedef('p',72),'LineWidth',3.5);
    scatter(TMZout0_He_ld,1e3*DSB_He_ldTMZ_MGMT_M_72h,80,'filled','MarkerFaceColor',color_timedef('m',72))
    scatter(TMZout0_He_ld,1e3*DSB_He_ldTMZ_MGMT_P_72h,80,'filled','MarkerFaceColor',color_timedef('p',72))
    scatter(TMZout0_He_ld(1),1e3*DSB_72h,80,'filled','MarkerFaceColor','black')
    xlim([0 126])
    ylabel('DSB (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
    %title('(B)', 'FontSize', 15);
    box off
    
    subplot(3,2,p53_subplot_numb)
    plot(He_MGMT_M_TMZ_sort,1e3*p53_24h_vec_MGMT_M,'color',color_timedef('m',24),'LineWidth',3.5);
    hold on
    plot(He_MGMT_M_TMZ_sort,1e3*p53_72h_vec_MGMT_M,'color',color_timedef('m',72),'LineWidth',3.5,'MarkerSize',1);
    plot(TMZout0_surv_Jack_MGMT_P(1:end-1),1e3*p53_24h_vec_MGMT_P,'color',color_timedef('p',24),'LineWidth',3.5);
    plot(TMZout0_surv_Jack_MGMT_P(1:end-1),1e3*p53_72h_vec_MGMT_P,'color',color_timedef('p',72),'LineWidth',3.5,'MarkerSize',1);
%     scatter(TMZout0_Aas,1e3*p53_Aas_norm(1),80,'d','filled','MarkerFaceColor',He_p53_blue,'MarkerEdgeColor',[0 0 0])
    scatter(TMZout0_He_ld,1e3*p53_He_ldTMZ_MGMT_M_24h_norm,80,'filled','MarkerFaceColor',color_timedef('m',24))
    scatter(TMZdata_He_hd,1e3*p53_He_hdTMZ_MGMT_M_24h_norm,80,'filled','MarkerFaceColor',color_timedef('m',24))
    scatter(TMZout0_He_ld,1e3*p53_He_ldTMZ_MGMT_M_72h_norm,80,'filled','MarkerFaceColor',color_timedef('m',72))
    scatter(TMZdata_He_hd,1e3*p53_He_hdTMZ_MGMT_M_72h_norm,80,'filled','MarkerFaceColor',color_timedef('m',72))
    xlim([0 126])
    xlabel('TMZ (\muM)')
    ylabel('P53 (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
    %title('(C)', 'FontSize', 15);
    legend('MGMT-,24h','MGMT-,72h','MGMT+,24h','MGMT+,72h','Location','northwest')
    box off
         
    subplot(3,2,p53ser46_subplot_numb)
    plot(He_MGMT_M_TMZ_sort,1e3*p53ser46_24h_vec_MGMT_M,'color',color_timedef('m',24),'LineWidth',3.5);
    hold on
    plot(He_MGMT_M_TMZ_sort,1e3*p53ser46_72h_vec_MGMT_M,'color',color_timedef('m',72),'LineWidth',3.5);
    plot(TMZout0_surv_Jack_MGMT_P(1:end-1),1e3*p53ser46_24h_vec_MGMT_P,'color',color_timedef('p',24),'LineWidth',3.5);
    plot(TMZout0_surv_Jack_MGMT_P(1:end-1),1e3*p53ser46_72h_vec_MGMT_P,'color',color_timedef('p',72),'LineWidth',3.5,'MarkerSize',1);
    scatter(TMZout0_He_ld,1e3*p53ser46_He_ldTMZ_MGMT_M_24h_norm,80,'filled','MarkerFaceColor',color_timedef('m',24))
    scatter(TMZdata_He_hd,1e3*p53ser46_He_hdTMZ_MGMT_M_24h_norm,80,'filled','MarkerFaceColor',color_timedef('m',24))
    scatter(TMZout0_He_ld,1e3*p53ser46_He_ldTMZ_MGMT_M_72h_norm,80,'filled','MarkerFaceColor',color_timedef('m',72))
    scatter(TMZdata_He_hd,1e3*p53ser46_He_hdTMZ_MGMT_M_72h_norm,80,'filled','MarkerFaceColor',color_timedef('m',72))
    xlim([0 126])
    ylabel('P53ser46 (nM)','Fontsize',14)
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
    %%title('(D)', 'FontSize', 15);
    box off
    
    %% subplots 5-6
    
    figure(paper_TMZvsConc_fignumb)
    subplot_surv_DuanHonBert=subplot(3,2,apop_He_subplot_numb);
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_M_72h,'color', color_timedef('m',72) ,'LineWidth',3.5)
    hold on
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_M_96h,'--','color', color_timedef('m',96) ,'LineWidth',3.5)
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_M_120h,'--','color', color_timedef('m',120) ,'LineWidth',3.5)
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_M_144h,'color', color_timedef('m',144) ,'LineWidth',3.5)
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_P_72h,'color', color_timedef('p',72) ,'LineWidth',3.5)
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_P_96h,'--','color', color_timedef('p',96) ,'LineWidth',3.5)
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_P_120h,'--','color', color_timedef('p',120) ,'LineWidth',3.5)
    semilogx(TMZdata_He_hd,He_hd_apop_curvm_MGMT_P_144h,'color', color_timedef('p',144)' ,'LineWidth',3.5)
    
    semilogx(TMZout0_He_ld,He_ld_apop_curvm_MGMT_M_120h,'--','color', color_timedef('m',120) ,'LineWidth',3.5)
    semilogx(TMZout0_He_ld,He_ld_apop_curvm_MGMT_P_120h,'--','color', color_timedef('p',120) ,'LineWidth',3.5)
    
    errorbar(TMZout0_He_ld,apop_mean_He_ldTMZ_MGMT_M_120h,apop_stddev_He_ldTMZ_MGMT_M_120h,'o','color', color_timedef('m',120) ,'MarkerFaceColor', color_timedef('m',120),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_M_72h,apop_stddev_He_hdTMZ_MGMT_M_72h,'o','color', color_timedef('m',72) ,'MarkerFaceColor', color_timedef('m',72),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_M_96h,apop_stddev_He_hdTMZ_MGMT_M_96h,'o','color', color_timedef('m',96) ,'MarkerFaceColor', color_timedef('m',96),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_M_120h,apop_stddev_He_hdTMZ_MGMT_M_120h,'o','color', color_timedef('m',120) ,'MarkerFaceColor', color_timedef('m',120),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_M_144h,apop_stddev_He_hdTMZ_MGMT_M_144h,'o','color', color_timedef('m',144) ,'MarkerFaceColor', color_timedef('m',144),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZout0_He_ld,apop_mean_He_ldTMZ_MGMT_P_120h,apop_stddev_He_ldTMZ_MGMT_P_120h,'o','color', color_timedef('p',120) ,'MarkerFaceColor', color_timedef('p',120),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_P_72h,apop_stddev_He_hdTMZ_MGMT_P_72h,'o','color', color_timedef('p',72) ,'MarkerFaceColor', color_timedef('p',72),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_P_96h,apop_stddev_He_hdTMZ_MGMT_P_96h,'o','color', color_timedef('p',96) ,'MarkerFaceColor', color_timedef('p',96),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_P_120h,apop_stddev_He_hdTMZ_MGMT_P_120h,'o','color', color_timedef('p',120) ,'MarkerFaceColor', color_timedef('p',120),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_P_144h,apop_stddev_He_hdTMZ_MGMT_P_144h,'o','color', color_timedef('p',144) ,'MarkerFaceColor', color_timedef('p',144),'MarkerSize',9,'LineWidth',1)
    subplot_surv_DuanHonBert.XScale='log';
    xlim([0.5,3e2])
    ylim([-0.5,50])
    xlabel('TMZ (\muM)')
    ylabel('Apoptosis (%)')
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
    legend('MGMT-,72h','MGMT-,96h','MGMT-,120h','MGMT-,144h','MGMT+,72h','MGMT+,96h','MGMT+,120h','MGMT+,144h','Location','northwest')
    %title('(F)', 'FontSize', 15);
    box off

    
    figure(paper_TMZvsConc_fignumb)
    subplot_surv_Jack=subplot(3,2,surv_Jack_subplot_numb);
    semilogx(TMZout0_surv_Jack_MGMT_M,Jack_surv_curvm_MGMT_M(:),'-','color', color_timedef('m',144)  ,'LineWidth',3.5)
    hold on
    semilogx(TMZout0_surv_Jack_MGMT_P,Jack_surv_curvm_MGMT_P(:),'-','color', color_timedef('p',144) ,'LineWidth',3.5)
    errorbar(TMZdata_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,'o','color', color_timedef('m',144)  ,'MarkerFaceColor', color_timedef('m',144),'MarkerSize',9,'LineWidth',1)
    errorbar(TMZdata_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,'o','color', color_timedef('p',144) ,'MarkerFaceColor', color_timedef('p',144),'MarkerSize',9,'LineWidth',1);
    subplot_surv_Jack.XScale='log';
    xlim([0.1,2e3])
    ylim([-0.5,105])
    xlabel('TMZ (\muM)')
    ylabel('Survival (%)')
    xticks([0.1 1e0 1e1 1e2 1e3])
    xticklabels({'0','10^0','10^1','10^2','10^3'})
    set(gca,'fontweight','bold','FontSize',14,'LineWidth',3.5)
    %title('(F)', 'FontSize', 15);
    box off
end

end