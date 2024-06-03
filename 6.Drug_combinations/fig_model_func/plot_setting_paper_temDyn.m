function plot_setting_paper_temDyn(tm_cell,um_cell,CyAm_cell,tcellpopm_cell,cellpopm_cell,...simulations
    TMZout0_Jack,MGMT_Jack_MGMT_M_time,MGMT_Jack_MGMT_M_norm,Chk1_Jack_MGMT_M_time,Chk1_Jack_MGMT_M_norm,pChk1_Jack_MGMT_M_time,pChk1_Jack_MGMT_M_norm,...data
    MGMT_Jack_MGMT_P_time,MGMT_Jack_MGMT_P_norm,Chk1_Jack_MGMT_P_time,Chk1_Jack_MGMT_P_norm,pChk1_Jack_MGMT_P_time,pChk1_Jack_MGMT_P_norm,...
    TMZout0_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
    TMZout0_Aas,pChk1_Aas_time,pChk1_Aas_norm,cdc25c_Aas_time,cdc25c_Aas_norm,p53_Aas_time,p53_Aas_norm,...
    p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    paper_tempDyn_fig,...plot control
    paper_tempDyn_fignumb,...%plot figure number
    numb_comptime1,upAsy,sness,tED50...
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
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h...
    sim_number


%% PKPD temporal dynamics
if paper_tempDyn_fig==1
%%%%%Jack %%%%%
t_cell_1st={tm_cell{sn_Jack_MGMT_M} tm_cell{sn_Jack_MGMT_P} tm_cell{sn_Aas} tm_cell{sn_Ka_100TMZ_MGMT_P}};
sim_cell_1st={um_cell{sn_Jack_MGMT_M} um_cell{sn_Jack_MGMT_P}  um_cell{sn_Aas} um_cell{sn_Ka_100TMZ_MGMT_P}};
CyA_cell_1st={CyAm_cell{sn_Jack_MGMT_M} CyAm_cell{sn_Jack_MGMT_P} CyAm_cell{sn_Aas} CyAm_cell{sn_Ka_100TMZ_MGMT_P}};

data_12_5TMZ_MGMT_M_mat=[MGMT_Jack_MGMT_M_time' MGMT_Jack_MGMT_M_norm' Chk1_Jack_MGMT_M_time' Chk1_Jack_MGMT_M_norm' pChk1_Jack_MGMT_M_time' pChk1_Jack_MGMT_M_norm'];
data_12_5TMZ_MGMT_P_mat=[MGMT_Jack_MGMT_P_time' MGMT_Jack_MGMT_P_norm' Chk1_Jack_MGMT_P_time' Chk1_Jack_MGMT_P_norm' pChk1_Jack_MGMT_P_time' pChk1_Jack_MGMT_P_norm'];

data_12_5TMZ_mat=[data_12_5TMZ_MGMT_M_mat data_12_5TMZ_MGMT_P_mat];

data_100TMZ_MGMT_M_mat=zeros(4,10);
data_100TMZ_MGMT_M_mat(:,:)=nan;

pChk1_Aas_data_mat=[pChk1_Aas_time',pChk1_Aas_norm'];
data_100TMZ_MGMT_M_mat(:,1:2)=pChk1_Aas_data_mat;

cdc25c_Aas_data_mat=[cdc25c_Aas_time' , cdc25c_Aas_norm'];
data_100TMZ_MGMT_M_mat(1:size(cdc25c_Aas_data_mat,1),3:4)=cdc25c_Aas_data_mat;

p53_Aas_data_mat=[p53_Aas_time',p53_Aas_norm'];
data_100TMZ_MGMT_M_mat(1:size(p53_Aas_data_mat,1),5:6)=p53_Aas_data_mat;


p53_He_100TMZ_data_mat=[24 p53_He_hdTMZ_MGMT_M_24h_norm(6);
                        72 p53_He_hdTMZ_MGMT_M_72h_norm(6)];
data_100TMZ_MGMT_M_mat(1:size(p53_He_100TMZ_data_mat,1),7:8)=p53_He_100TMZ_data_mat;

p53ser46_He_100TMZ_data_mat=[24 p53ser46_He_hdTMZ_MGMT_M_24h_norm(6);
                             72 p53ser46_He_hdTMZ_MGMT_M_72h_norm(6)];
data_100TMZ_MGMT_M_mat(1:size(p53ser46_He_100TMZ_data_mat,1),9:10)=p53ser46_He_100TMZ_data_mat;


plot_paper_temDyn(paper_tempDyn_fignumb,t_cell_1st,sim_cell_1st,CyA_cell_1st,'mpmp',[12.5 12.5 100 100],numb_comptime1,upAsy,sness,tED50);
plot_paper_temDyn_data(paper_tempDyn_fignumb,data_12_5TMZ_mat,'mmmppp',TMZout0_Jack*ones(1,6),[3 9 10 3 9 10]);
plot_paper_temDyn_data(paper_tempDyn_fignumb,data_100TMZ_MGMT_M_mat,'mmmmm',TMZout0_Aas*ones(1,5),[10 11 13 13 14]);

%%% cell population
cell_pop_subplot_numb=[16];

    %model
    cell_pop_plot_sim_indx_144h_MGMT_M=[sn_surv_16TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h];
%     cell_pop_plot_sim_numb_MGMT_M=size(cell_pop_plot_sim_indx_144h_MGMT_M,2);
    
    
    cell_pop_plot_sim_indx_144h_MGMT_P=[sn_surv_16TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h];
%     cell_pop_plot_sim_numb_MGMT_P=size(cell_pop_plot_sim_indx_144h_MGMT_P,2);
    
    %data
    cell_pop_data_plot_144h_MGMT_M_selec=[16 128 1024];%TMZout0_surv_Jack_MGMT_M;
    cell_pop_data_plot_144h_MGMT_M_numb=length(cell_pop_data_plot_144h_MGMT_M_selec);
    CC = ismember(TMZout0_surv_Jack_MGMT_M, cell_pop_data_plot_144h_MGMT_M_selec);
    cell_pop_data_plot_144h_MGMT_M_indx = find(CC);
    cell_pop_data_plot_144h_MGMT_M_t=144*ones(cell_pop_data_plot_144h_MGMT_M_numb,1);
    surv_mean_Jack_plot_MGMT_M=surv_mean_Jack_MGMT_M(cell_pop_data_plot_144h_MGMT_M_indx);
    surv_stddev_Jack_plot_MGMT_M=surv_stddev_Jack_MGMT_M(cell_pop_data_plot_144h_MGMT_M_indx);
    
    
    cell_pop_data_plot_144h_MGMT_P_selec=[16 128 1024];%TMZout0_surv_Jack_MGMT_P;%
    cell_pop_data_plot_144h_MGMT_P_numb=length(cell_pop_data_plot_144h_MGMT_P_selec);
    CC = ismember(TMZout0_surv_Jack_MGMT_P, cell_pop_data_plot_144h_MGMT_P_selec);
    cell_pop_data_plot_144h_MGMT_P_indx = find(CC);
    cell_pop_data_plot_144h_MGMT_P_t=144*ones(1,cell_pop_data_plot_144h_MGMT_P_numb);
    surv_mean_Jack_plot_MGMT_P=surv_mean_Jack_MGMT_P(cell_pop_data_plot_144h_MGMT_P_indx);
    surv_stddev_Jack_plot_MGMT_P=surv_stddev_Jack_MGMT_P(cell_pop_data_plot_144h_MGMT_P_indx);
    
    %plot color
    MGMT_subplot_cellpop='mmmppp';
    TMZ_subplot_cellpop=[cell_pop_data_plot_144h_MGMT_M_selec cell_pop_data_plot_144h_MGMT_P_selec];
    color_mat_cell_pop = color_paper_temDyn(6,MGMT_subplot_cellpop,TMZ_subplot_cellpop);
    
    legend_label_subplot_cellpop=legend_writer_paper_1(MGMT_subplot_cellpop,TMZ_subplot_cellpop);
    
    for n=1:length(MGMT_subplot_cellpop)
    if MGMT_subplot_cellpop(n)=='m'
        plotline(n)='-';
    elseif MGMT_subplot_cellpop(n)=='p'
        plotline(n)=':';
    end
    end
    
        figure(paper_tempDyn_fignumb)
        subplot(4,4,cell_pop_subplot_numb)
        for n=1:cell_pop_data_plot_144h_MGMT_M_numb
            errorbar(cell_pop_data_plot_144h_MGMT_M_t(n),surv_mean_Jack_plot_MGMT_M(n),surv_stddev_Jack_plot_MGMT_M(n),'o','color',color_mat_cell_pop(n,:),'MarkerFaceColor', color_mat_cell_pop(n,:),'MarkerSize',9,'LineWidth',2)
        hold on
        end
        subplot(4,4,cell_pop_subplot_numb);
        for n=1:cell_pop_data_plot_144h_MGMT_P_numb
            errorbar(cell_pop_data_plot_144h_MGMT_P_t(n),surv_mean_Jack_plot_MGMT_P(n),surv_stddev_Jack_plot_MGMT_P(n),'o','color',color_mat_cell_pop(n+3,:),'MarkerFaceColor', color_mat_cell_pop(n+3,:),'MarkerSize',9,'LineWidth',2)
            hold on
        end
        
        i=1;
        for sim_n=cell_pop_plot_sim_indx_144h_MGMT_M
            tDMSO_TMZ_pop=tcellpopm_cell{sim_n};
            norm_pop=cellpopm_cell{sim_n};
            plot(tDMSO_TMZ_pop,norm_pop,plotline(i), 'color',color_mat_cell_pop(i,:),'LineWidth',2)
            i=i+1;
        end


        ii=4;
        for sim_n=cell_pop_plot_sim_indx_144h_MGMT_P
            tDMSO_TMZ_pop=tcellpopm_cell{sim_n};
            norm_pop=cellpopm_cell{sim_n};
            plot(tDMSO_TMZ_pop,norm_pop,plotline(i), 'color',color_mat_cell_pop(ii,:),'LineWidth',2)
            ii=ii+1;
        end

            ylim([0 100])
            xlabel('Time (day)','Fontsize',14);
            XTick=[24 48 72 96 120 144];
            XTickLabels={'1','2','3','4','5','6'};
            ylabel('Percent Survival','Fontsize',14);
            set(gca,'fontweight','bold','FontSize',13,'LineWidth',3,'box','off','XTick',XTick,'XTickLabels',XTickLabels)
            legend(legend_label_subplot_cellpop,'fontweight','default','FontSize','default','Location','southwest')
            box off

end


end

