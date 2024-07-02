function plot_setting_PKPD(TMZdata_nosurv_Jack_data,MGMT_Jack_MGMT_M_time,MGMT_Jack_MGMT_M_norm,Chk1_Jack_MGMT_M_time,Chk1_Jack_MGMT_M_norm,pChk1_Jack_MGMT_M_time,pChk1_Jack_MGMT_M_norm,...data
    MGMT_Jack_MGMT_P_time,MGMT_Jack_MGMT_P_norm,Chk1_Jack_MGMT_P_time,Chk1_Jack_MGMT_P_norm,pChk1_Jack_MGMT_P_time,pChk1_Jack_MGMT_P_norm,...
    TMZdata_Jack_inhATR,VX_Jack2D,MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm,MGMT_Jack_inhATR_VXcon_MGMT_M_norm,MGMT_Jack_inhATR_MGMT_M_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Chk1_Jack_inhATR_MGMT_M_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,pChk1_Jack_inhATR_VXcon_MGMT_M_norm,pChk1_Jack_inhATR_MGMT_M_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm,MGMT_Jack_inhATR_VXcon_MGMT_P_norm,MGMT_Jack_inhATR_MGMT_P_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk1_Jack_inhATR_VXcon_MGMT_P_norm,Chk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,pChk1_Jack_inhATR_VXcon_MGMT_P_norm,pChk1_Jack_inhATR_MGMT_P_norm,...
    TMZdata_Aas,pChk1_Aas_time,pChk1_Aas_norm,cdc25c_Aas_time,cdc25c_Aas_norm,p53_Aas_time,p53_Aas_norm,...
    TMZdata_He_ld,DSB_He_ldTMZ_MGMT_M_72h,DSB_He_ldTMZ_MGMT_P_72h,...
    p53_He_ldTMZ_MGMT_M_24h_norm,p53_He_ldTMZ_MGMT_M_72h_norm,p53ser46_He_ldTMZ_MGMT_M_24h_norm,p53ser46_He_ldTMZ_MGMT_M_72h_norm,...
    p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    TMZout0_Ka_XTMZ,O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time,O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A,TMZdata_O6Meg_Ka_3h_MGMT_M, O6Meg_Ka_3h_MGMT_M,TMZdata_O6Meg_Ka_3h_MGMT_P,O6Meg_Ka_3h_MGMT_P,...
    TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,...
    tm_cell,um_cell,CyAm_cell,...simulation
    TMZout0_He_ld,TMZout0_He_hd,Jack_figcon,Jack_fignumb,...plot control
    Jack_MGMT_P_figcon,Jack_MGMT_P_fignumb,...
    Jack_inh_ATR_figcon,Jack_inhATR_fignumb,...
    Aas_figcon,Aas_fignumb,...
    Jack_Aas_figcon,Jack_Aas_fignumb,...
    He_figcon,He_fignumb,...
    Ka_figcon,Ka_fignumb,...
    Jack_surv_PKPD_plot_fig,Jack_surv_PKPD_plot_fignumb,...
    TMZout0_MAX ...other
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

%%%%%Simulation of ref. Jackson 2019%%%%%
%%%%%Jack MGMT-%%%%%
Jack_t_cell={tm_cell{sn_Jack_MGMT_M} tm_cell{sn_Jack_MGMT_P}};
Jack_sim_cell={um_cell{sn_Jack_MGMT_M} um_cell{sn_Jack_MGMT_P}};
Jack_CyA_cell={CyAm_cell{sn_Jack_MGMT_M} CyAm_cell{sn_Jack_MGMT_P}};

Jack_MGMT_M_add_data_mat=[MGMT_Jack_MGMT_M_time' MGMT_Jack_MGMT_M_norm'];
Jack_MGMT_P_add_data_mat=[MGMT_Jack_MGMT_P_time' MGMT_Jack_MGMT_P_norm'];

Jack_MGMT_M_atr_data_mat=[Chk1_Jack_MGMT_M_time' Chk1_Jack_MGMT_M_norm' pChk1_Jack_MGMT_M_time' pChk1_Jack_MGMT_M_norm'];
Jack_MGMT_P_atr_data_mat=[Chk1_Jack_MGMT_P_time' Chk1_Jack_MGMT_P_norm' pChk1_Jack_MGMT_P_time' pChk1_Jack_MGMT_P_norm'];

Jack_add_data_mat= [Jack_MGMT_M_add_data_mat Jack_MGMT_P_add_data_mat];
Jack_atr_data_mat=[Jack_MGMT_M_atr_data_mat Jack_MGMT_P_atr_data_mat];

plot_PK(Jack_fignumb,Jack_figcon,Jack_t_cell,Jack_sim_cell,'mp',TMZdata_nosurv_Jack_data*ones(1,2),TMZout0_MAX,zeros(1,2))
plot_PD_adducts(Jack_fignumb+1,Jack_figcon,Jack_t_cell,Jack_sim_cell,'mp',TMZdata_nosurv_Jack_data*ones(1,2),TMZout0_MAX,zeros(1,2))
plot_PD_ATRChk1Cellcycle(Jack_fignumb+2,Jack_figcon,Jack_t_cell,Jack_sim_cell,Jack_CyA_cell,'mp',TMZdata_nosurv_Jack_data*ones(1,2),TMZout0_MAX,zeros(1,2))
plot_PD_p53Mdm2(Jack_fignumb+3,Jack_figcon,Jack_t_cell,Jack_sim_cell,'mp',TMZdata_nosurv_Jack_data*ones(1,2),TMZout0_MAX,zeros(1,2))

plot_data(Jack_fignumb+1,Jack_figcon,Jack_add_data_mat,'mp',TMZdata_nosurv_Jack_data*ones(1,2),TMZout0_MAX,zeros(1,2),'add',[2 2]);
plot_data(Jack_fignumb+2,Jack_figcon,Jack_atr_data_mat,'mmpp',TMZdata_nosurv_Jack_data*ones(1,4),TMZout0_MAX,zeros(1,4),'atr',[3 4 3 4]);

%%%%%Jack MGMT+%%%%%

plot_PK(Jack_MGMT_P_fignumb,Jack_MGMT_P_figcon,tm_cell(sn_Jack_MGMT_P),um_cell(sn_Jack_MGMT_P),'p',TMZdata_nosurv_Jack_data,TMZout0_MAX,0)
plot_PD_adducts(Jack_MGMT_P_fignumb+1,Jack_MGMT_P_figcon,tm_cell(sn_Jack_MGMT_P),um_cell(sn_Jack_MGMT_P),'p',TMZdata_nosurv_Jack_data,TMZout0_MAX,0)
plot_PD_ATRChk1Cellcycle(Jack_MGMT_P_fignumb+2,Jack_MGMT_P_figcon,tm_cell(sn_Jack_MGMT_P),um_cell(sn_Jack_MGMT_P),CyAm_cell(sn_Jack_MGMT_P),'p',TMZdata_nosurv_Jack_data,TMZout0_MAX,0)
plot_PD_p53Mdm2(Jack_MGMT_P_fignumb+3,Jack_MGMT_P_figcon,tm_cell(sn_Jack_MGMT_P),um_cell(sn_Jack_MGMT_P),'p',TMZdata_nosurv_Jack_data,TMZout0_MAX,0)

plot_data(Jack_MGMT_P_fignumb+1,Jack_MGMT_P_figcon,Jack_MGMT_P_add_data_mat,'p',TMZdata_nosurv_Jack_data,TMZout0_MAX,0,'add',2);
plot_data(Jack_MGMT_P_fignumb+2,Jack_MGMT_P_figcon,Jack_MGMT_P_atr_data_mat,'pp',TMZdata_nosurv_Jack_data*ones(1,2),TMZout0_MAX,zeros(1,2),'atr',[3 4]);


%%%%% Jackson inhibited ATR%%%%%
Jack_inhATR_MGMT_M_t_cell={tm_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M} tm_cell{sn_Jack_inhATR_VXcon_MGMT_M} tm_cell{sn_Jack_inhATR8VX_MGMT_M} tm_cell{sn_Jack_inhATR40VX_MGMT_M} tm_cell{sn_Jack_inhATR200VX_MGMT_M} tm_cell{sn_Jack_inhATR1000VX_MGMT_M}};
Jack_inhATR_MGMT_M_sim_cell={um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M} um_cell{sn_Jack_inhATR_VXcon_MGMT_M} um_cell{sn_Jack_inhATR8VX_MGMT_M} um_cell{sn_Jack_inhATR40VX_MGMT_M} um_cell{sn_Jack_inhATR200VX_MGMT_M} um_cell{sn_Jack_inhATR1000VX_MGMT_M}};
Jack_inhATR_MGMT_M_CyA_cell={CyAm_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M} CyAm_cell{sn_Jack_inhATR_VXcon_MGMT_M} CyAm_cell{sn_Jack_inhATR8VX_MGMT_M} CyAm_cell{sn_Jack_inhATR40VX_MGMT_M} CyAm_cell{sn_Jack_inhATR200VX_MGMT_M} CyAm_cell{sn_Jack_inhATR1000VX_MGMT_M}};

Jack_inhATR_MGMT_P_t_cell={tm_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P} tm_cell{sn_Jack_inhATR_VXcon_MGMT_P} tm_cell{sn_Jack_inhATR8VX_MGMT_P} tm_cell{sn_Jack_inhATR40VX_MGMT_P} tm_cell{sn_Jack_inhATR200VX_MGMT_P} tm_cell{sn_Jack_inhATR1000VX_MGMT_P}};
Jack_inhATR_MGMT_P_sim_cell={um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P} um_cell{sn_Jack_inhATR_VXcon_MGMT_P} um_cell{sn_Jack_inhATR8VX_MGMT_P} um_cell{sn_Jack_inhATR40VX_MGMT_P} um_cell{sn_Jack_inhATR200VX_MGMT_P} um_cell{sn_Jack_inhATR1000VX_MGMT_P}};
Jack_inhATR_MGMT_P_CyA_cell={CyAm_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P} CyAm_cell{sn_Jack_inhATR_VXcon_MGMT_P} CyAm_cell{sn_Jack_inhATR8VX_MGMT_P} CyAm_cell{sn_Jack_inhATR40VX_MGMT_P} CyAm_cell{sn_Jack_inhATR200VX_MGMT_P} CyAm_cell{sn_Jack_inhATR1000VX_MGMT_P}};

Jack_inhATR_t_cell=[Jack_inhATR_MGMT_M_t_cell Jack_inhATR_MGMT_P_t_cell];
Jack_inhATR_sim_cell=[Jack_inhATR_MGMT_M_sim_cell Jack_inhATR_MGMT_P_sim_cell];
Jack_inhATR_CyA_cell=[Jack_inhATR_MGMT_M_CyA_cell Jack_inhATR_MGMT_P_CyA_cell];

MGMT_Jack_inhATR_MGMT_M_data=[MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm MGMT_Jack_inhATR_VXcon_MGMT_M_norm MGMT_Jack_inhATR_MGMT_M_norm];
MGMT_Jack_inhATR_MGMT_M_data_mat=ones(1,12);
MGMT_Jack_inhATR_MGMT_M_data_mat(1:2:end)= 24*ones(1,6);
MGMT_Jack_inhATR_MGMT_M_data_mat(2:2:end)= MGMT_Jack_inhATR_MGMT_M_data;

Chk1_Jack_inhATR_MGMT_M_data=[Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm Chk1_Jack_inhATR_VXcon_MGMT_M_norm Chk1_Jack_inhATR_MGMT_M_norm];
Chk1_Jack_inhATR_MGMT_M_data_mat=ones(1,12);
Chk1_Jack_inhATR_MGMT_M_data_mat(1:2:end)= 24*ones(1,6);
Chk1_Jack_inhATR_MGMT_M_data_mat(2:2:end)= Chk1_Jack_inhATR_MGMT_M_data;
pChk1_Jack_inhATR_MGMT_M_data=[pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm pChk1_Jack_inhATR_VXcon_MGMT_M_norm pChk1_Jack_inhATR_MGMT_M_norm];
pChk1_Jack_inhATR_MGMT_M_data_mat=ones(1,12);
pChk1_Jack_inhATR_MGMT_M_data_mat(1:2:end)= 24*ones(1,6);
pChk1_Jack_inhATR_MGMT_M_data_mat(2:2:end)= pChk1_Jack_inhATR_MGMT_M_data;

Jack_inhATR_MGMT_M_atr_data_mat=[Chk1_Jack_inhATR_MGMT_M_data_mat pChk1_Jack_inhATR_MGMT_M_data_mat];

MGMT_Jack_inhATR_MGMT_P_data=[MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm MGMT_Jack_inhATR_VXcon_MGMT_P_norm MGMT_Jack_inhATR_MGMT_P_norm];
MGMT_Jack_inhATR_MGMT_P_data_mat=ones(1,12);
MGMT_Jack_inhATR_MGMT_P_data_mat(1:2:end)= 24*ones(1,6);
MGMT_Jack_inhATR_MGMT_P_data_mat(2:2:end)= MGMT_Jack_inhATR_MGMT_P_data;

Chk1_Jack_inhATR_MGMT_P_data=[Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm Chk1_Jack_inhATR_VXcon_MGMT_P_norm Chk1_Jack_inhATR_MGMT_P_norm];
Chk1_Jack_inhATR_MGMT_P_data_mat=ones(1,12);
Chk1_Jack_inhATR_MGMT_P_data_mat(1:2:end)= 24*ones(1,6);
Chk1_Jack_inhATR_MGMT_P_data_mat(2:2:end)= Chk1_Jack_inhATR_MGMT_P_data;
pChk1_Jack_inhATR_MGMT_P_data=[pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm pChk1_Jack_inhATR_VXcon_MGMT_P_norm pChk1_Jack_inhATR_MGMT_P_norm];
pChk1_Jack_inhATR_MGMT_P_data_mat=ones(1,12);
pChk1_Jack_inhATR_MGMT_P_data_mat(1:2:end)= 24*ones(1,6);
pChk1_Jack_inhATR_MGMT_P_data_mat(2:2:end)= pChk1_Jack_inhATR_MGMT_P_data;

Jack_inhATR_MGMT_P_atr_data_mat=[Chk1_Jack_inhATR_MGMT_P_data_mat pChk1_Jack_inhATR_MGMT_P_data_mat];

Jack_inhATR_add_data_mat=[MGMT_Jack_inhATR_MGMT_M_data_mat MGMT_Jack_inhATR_MGMT_P_data_mat];
Jack_inhATR_atr_data_mat=[Jack_inhATR_MGMT_M_atr_data_mat Jack_inhATR_MGMT_P_atr_data_mat];

Jack_inhATR_MGMT_M=['m' 'm' 'm' 'm' 'm' 'm'];
Jack_inhATR_MGMT_P=['p' 'p' 'p' 'p' 'p' 'p'];
Jack_inhATR_MGMT_sim_data=[Jack_inhATR_MGMT_M Jack_inhATR_MGMT_P];
Jack_inhATR_MGMT_add_data=[Jack_inhATR_MGMT_M Jack_inhATR_MGMT_P];
Jack_inhATR_MGMT_atr_data=[Jack_inhATR_MGMT_M Jack_inhATR_MGMT_M Jack_inhATR_MGMT_P Jack_inhATR_MGMT_P];

TMZout0_Jack_inhATR_sim=[TMZdata_Jack_inhATR' TMZdata_Jack_inhATR'];
TMZdata_Jack_inhATR_add_data=[TMZdata_Jack_inhATR' TMZdata_Jack_inhATR'];
TMZdata_Jack_inhATR_atr_data=[TMZdata_Jack_inhATR' TMZdata_Jack_inhATR' TMZdata_Jack_inhATR' TMZdata_Jack_inhATR'];

VX_Jack_sim=[VX_Jack2D VX_Jack2D];
VX_Jack_add_data=[VX_Jack2D VX_Jack2D];
VX_Jack_atr_data=[VX_Jack2D VX_Jack2D VX_Jack2D VX_Jack2D];

Jack_inhATR_gen_subplot_vec=[3*ones(1,6) 4*ones(1,6) 3*ones(1,6) 4*ones(1,6)];

plot_PK(Jack_inhATR_fignumb,Jack_inh_ATR_figcon,Jack_inhATR_t_cell,Jack_inhATR_sim_cell,Jack_inhATR_MGMT_sim_data,TMZout0_Jack_inhATR_sim,TMZout0_MAX,VX_Jack_sim)
plot_PD_adducts(Jack_inhATR_fignumb+1,Jack_inh_ATR_figcon,Jack_inhATR_t_cell,Jack_inhATR_sim_cell,Jack_inhATR_MGMT_sim_data,TMZout0_Jack_inhATR_sim,TMZout0_MAX,VX_Jack_sim)
plot_PD_ATRChk1Cellcycle(Jack_inhATR_fignumb+2,Jack_inh_ATR_figcon,Jack_inhATR_t_cell,Jack_inhATR_sim_cell,Jack_inhATR_CyA_cell,Jack_inhATR_MGMT_sim_data,TMZout0_Jack_inhATR_sim,TMZout0_MAX,VX_Jack_sim)
plot_PD_p53Mdm2(Jack_inhATR_fignumb+3,Jack_inh_ATR_figcon,Jack_inhATR_t_cell,Jack_inhATR_sim_cell,Jack_inhATR_MGMT_sim_data,TMZout0_Jack_inhATR_sim,TMZout0_MAX,VX_Jack_sim)

plot_data(Jack_inhATR_fignumb+1,Jack_inh_ATR_figcon,Jack_inhATR_add_data_mat,Jack_inhATR_MGMT_add_data,TMZdata_Jack_inhATR_add_data,TMZout0_MAX,VX_Jack_add_data,'add',2*ones(1,12));
plot_data(Jack_inhATR_fignumb+2,Jack_inh_ATR_figcon,Jack_inhATR_atr_data_mat,Jack_inhATR_MGMT_atr_data,TMZdata_Jack_inhATR_atr_data,TMZout0_MAX,VX_Jack_atr_data,'atr',Jack_inhATR_gen_subplot_vec);


%%%%%Simulation of ref. Aasland 2020%%%%%
Aas_t_cell=tm_cell(sn_Aas);
Aas_sim_cell=um_cell(sn_Aas);
Aas_CyA_cell=CyAm_cell(sn_Aas);

Aas_atr_data_mat=zeros(4,4);
Aas_atr_data_mat(:,:)=nan;
Aas_atr_data_mat(:,1:2)=[pChk1_Aas_time',pChk1_Aas_norm'];
Aas_atr_data_mat(1:length(cdc25c_Aas_time),3:4)=[cdc25c_Aas_time',cdc25c_Aas_norm'];
Aas_p53_data_mat(1:size(p53_Aas_time,2),1:2)=[p53_Aas_time',p53_Aas_norm'];

plot_PK(Aas_fignumb,Aas_figcon,Aas_t_cell,Aas_sim_cell,'m',TMZdata_Aas,TMZout0_MAX,0)
plot_PD_adducts(Aas_fignumb+1,Aas_figcon,Aas_t_cell,Aas_sim_cell,'m',TMZdata_Aas,TMZout0_MAX,0)
plot_PD_ATRChk1Cellcycle(Aas_fignumb+2,Aas_figcon,Aas_t_cell,Aas_sim_cell,Aas_CyA_cell,'m',TMZdata_Aas,TMZout0_MAX,0)
plot_PD_p53Mdm2(Aas_fignumb+3,Aas_figcon,Aas_t_cell,Aas_sim_cell,'m',TMZdata_Aas,TMZout0_MAX,0)

plot_data(Aas_fignumb+2,Aas_figcon,Aas_atr_data_mat,'mm',TMZdata_Aas*ones(1,2),TMZout0_MAX,zeros(1,2),'atr',[4 5]);
plot_data(Aas_fignumb+3,Aas_figcon,Aas_p53_data_mat,'m',TMZdata_Aas,TMZout0_MAX,0,'p53',1);

%%%Jackson and Aasland%%%
Jack_Aas_t_cell= [Jack_t_cell Aas_t_cell tm_cell(sn_Jack_inhATR_VXcon_MGMT_P)];
Jack_Aas_sim_cell= [Jack_sim_cell Aas_sim_cell um_cell(sn_Jack_inhATR_VXcon_MGMT_P)];
Jack_Aas_CyA_cell= [Jack_CyA_cell Aas_CyA_cell CyAm_cell(sn_Jack_inhATR_VXcon_MGMT_P)];


Jack_Aas_atr_data_mat=zeros(5,14);
Jack_Aas_atr_data_mat(:,:)=nan;
Jack_Aas_atr_data_mat(:,1:8)=[Jack_MGMT_M_atr_data_mat Jack_MGMT_P_atr_data_mat];
Jack_Aas_atr_data_mat(1,9:10)=[24 pChk1_Jack_inhATR_VXcon_MGMT_M_norm];
Jack_Aas_atr_data_mat(1:4,11:14)=Aas_atr_data_mat;

TMZsim_Jack_Aas=[TMZdata_nosurv_Jack_data*ones(1,2) TMZdata_Aas TMZout0_Jack_inhATR_sim(2)];

plot_PK(Jack_Aas_fignumb,Jack_Aas_figcon,Jack_Aas_t_cell,Jack_Aas_sim_cell,'mpmp',TMZsim_Jack_Aas,TMZout0_MAX,zeros(1,4))
plot_PD_adducts(Jack_Aas_fignumb+1,Jack_Aas_figcon,Jack_Aas_t_cell,Jack_Aas_sim_cell,'mpmp',TMZsim_Jack_Aas,TMZout0_MAX,zeros(1,4))
plot_PD_ATRChk1Cellcycle(Jack_Aas_fignumb+2,Jack_Aas_figcon,Jack_Aas_t_cell,Jack_Aas_sim_cell,Jack_Aas_CyA_cell,'mpmp',TMZsim_Jack_Aas,TMZout0_MAX,zeros(1,4))
plot_PD_p53Mdm2(Jack_Aas_fignumb+3,Jack_Aas_figcon,Jack_Aas_t_cell,Jack_Aas_sim_cell,'mpmp',TMZsim_Jack_Aas,TMZout0_MAX,zeros(1,4))

plot_data(Jack_Aas_fignumb+2,Jack_Aas_figcon,Jack_Aas_atr_data_mat,'mmppmmm',[TMZdata_nosurv_Jack_data*ones(1,4) TMZdata_Jack_inhATR(2) TMZdata_Aas*ones(1,2)],TMZout0_MAX,zeros(1,7),'atr',[3 4 3 4 4 4 5]);


%%%%%Simulation of ref. He 2019%%%%%
He_all_MGMT_M_t_cell={tm_cell{sn_He_0TMZ_MGMT_M_144h} tm_cell{sn_He_1TMZ_MGMT_M_144h} tm_cell{sn_He_2TMZ_MGMT_M_144h} tm_cell{sn_He_3TMZ_MGMT_M_144h} tm_cell{sn_He_4TMZ_MGMT_M_144h} tm_cell{sn_He_5TMZ_MGMT_M_144h} tm_cell{sn_He_10TMZ_MGMT_M_144h} tm_cell{sn_He_15TMZ_MGMT_M_144h} tm_cell{sn_He_20TMZ_MGMT_M_144h},...
                      tm_cell{sn_He_12_5TMZ_MGMT_M_144h} tm_cell{sn_He_25TMZ_MGMT_M_144h} tm_cell{sn_He_50TMZ_MGMT_M_144h} tm_cell{sn_He_75TMZ_MGMT_M_144h} tm_cell{sn_He_100TMZ_MGMT_M_144h} tm_cell{sn_He_125TMZ_MGMT_M_144h}};
He_all_MGMT_M_sim_cell={um_cell{sn_He_0TMZ_MGMT_M_144h} um_cell{sn_He_1TMZ_MGMT_M_144h} um_cell{sn_He_2TMZ_MGMT_M_144h} um_cell{sn_He_3TMZ_MGMT_M_144h} um_cell{sn_He_4TMZ_MGMT_M_144h} um_cell{sn_He_5TMZ_MGMT_M_144h} um_cell{sn_He_10TMZ_MGMT_M_144h} um_cell{sn_He_15TMZ_MGMT_M_144h} um_cell{sn_He_20TMZ_MGMT_M_144h},...
                        um_cell{sn_He_12_5TMZ_MGMT_M_144h} um_cell{sn_He_25TMZ_MGMT_M_144h} um_cell{sn_He_50TMZ_MGMT_M_144h} um_cell{sn_He_75TMZ_MGMT_M_144h} um_cell{sn_He_100TMZ_MGMT_M_144h} um_cell{sn_He_125TMZ_MGMT_M_144h}};
He_all_MGMT_M_CyA_cell={CyAm_cell{sn_He_0TMZ_MGMT_M_144h} CyAm_cell{sn_He_1TMZ_MGMT_M_144h} CyAm_cell{sn_He_2TMZ_MGMT_M_144h} CyAm_cell{sn_He_3TMZ_MGMT_M_144h} CyAm_cell{sn_He_4TMZ_MGMT_M_144h} CyAm_cell{sn_He_5TMZ_MGMT_M_144h} CyAm_cell{sn_He_10TMZ_MGMT_M_144h} CyAm_cell{sn_He_15TMZ_MGMT_M_144h} CyAm_cell{sn_He_20TMZ_MGMT_M_144h},...
                        CyAm_cell{sn_He_12_5TMZ_MGMT_M_144h} CyAm_cell{sn_He_25TMZ_MGMT_M_144h} CyAm_cell{sn_He_50TMZ_MGMT_M_144h} CyAm_cell{sn_He_75TMZ_MGMT_M_144h} CyAm_cell{sn_He_100TMZ_MGMT_M_144h} CyAm_cell{sn_He_125TMZ_MGMT_M_144h}};
He_all_MGMT_P_t_cell={tm_cell{sn_He_0TMZ_MGMT_P_144h} tm_cell{sn_He_1TMZ_MGMT_P_144h} tm_cell{sn_He_2TMZ_MGMT_P_144h} tm_cell{sn_He_3TMZ_MGMT_P_144h} tm_cell{sn_He_4TMZ_MGMT_P_144h} tm_cell{sn_He_5TMZ_MGMT_P_144h} tm_cell{sn_He_10TMZ_MGMT_P_144h} tm_cell{sn_He_15TMZ_MGMT_P_144h} tm_cell{sn_He_20TMZ_MGMT_P_144h},...
                      tm_cell{sn_He_12_5TMZ_MGMT_P_144h} tm_cell{sn_He_25TMZ_MGMT_P_144h} tm_cell{sn_He_50TMZ_MGMT_P_144h} tm_cell{sn_He_75TMZ_MGMT_P_144h} tm_cell{sn_He_100TMZ_MGMT_P_144h} tm_cell{sn_He_125TMZ_MGMT_P_144h}};
He_all_MGMT_P_sim_cell={um_cell{sn_He_0TMZ_MGMT_P_144h} um_cell{sn_He_1TMZ_MGMT_P_144h} um_cell{sn_He_2TMZ_MGMT_P_144h} um_cell{sn_He_3TMZ_MGMT_P_144h} um_cell{sn_He_4TMZ_MGMT_P_144h} um_cell{sn_He_5TMZ_MGMT_P_144h} um_cell{sn_He_10TMZ_MGMT_P_144h} um_cell{sn_He_15TMZ_MGMT_P_144h} um_cell{sn_He_20TMZ_MGMT_P_144h},...
                        um_cell{sn_He_12_5TMZ_MGMT_P_144h} um_cell{sn_He_25TMZ_MGMT_P_144h} um_cell{sn_He_50TMZ_MGMT_P_144h} um_cell{sn_He_75TMZ_MGMT_P_144h} um_cell{sn_He_100TMZ_MGMT_P_144h} um_cell{sn_He_125TMZ_MGMT_P_144h}};
He_all_MGMT_P_CyA_cell={CyAm_cell{sn_He_0TMZ_MGMT_P_144h} CyAm_cell{sn_He_1TMZ_MGMT_P_144h} CyAm_cell{sn_He_2TMZ_MGMT_P_144h} CyAm_cell{sn_He_3TMZ_MGMT_P_144h} CyAm_cell{sn_He_4TMZ_MGMT_P_144h} CyAm_cell{sn_He_5TMZ_MGMT_P_144h} CyAm_cell{sn_He_10TMZ_MGMT_P_144h} CyAm_cell{sn_He_15TMZ_MGMT_P_144h} CyAm_cell{sn_He_20TMZ_MGMT_P_144h},...
                        CyAm_cell{sn_He_12_5TMZ_MGMT_P_144h} CyAm_cell{sn_He_25TMZ_MGMT_P_144h} CyAm_cell{sn_He_50TMZ_MGMT_P_144h} CyAm_cell{sn_He_75TMZ_MGMT_P_144h} CyAm_cell{sn_He_100TMZ_MGMT_P_144h} CyAm_cell{sn_He_125TMZ_MGMT_P_144h}};

He_all_t_cell=[ He_all_MGMT_M_t_cell He_all_MGMT_P_t_cell ];
He_all_sim_cell=[ He_all_MGMT_M_sim_cell He_all_MGMT_P_sim_cell ];
He_all_CyA_cell=[ He_all_MGMT_M_CyA_cell He_all_MGMT_P_CyA_cell ];

DSB_He_MGMT_M_data_mat=zeros(2,18);
DSB_He_MGMT_M_data_mat(:,:)=nan;
DSB_He_MGMT_M_data_mat(2,1:2:18)=72*ones(1,9);
DSB_He_MGMT_M_data_mat(2,2:2:18)=DSB_He_ldTMZ_MGMT_M_72h(1:end);

DSB_He_MGMT_P_data_mat=zeros(2,18);
DSB_He_MGMT_P_data_mat(:,:)=nan;
DSB_He_MGMT_P_data_mat(2,1:2:18)=72*ones(1,9);
DSB_He_MGMT_P_data_mat(2,2:2:18)=DSB_He_ldTMZ_MGMT_P_72h(1:end);

He_add_data_mat=[DSB_He_MGMT_M_data_mat DSB_He_MGMT_P_data_mat];

p53_He_data_mat=zeros(2,30);
p53_He_data_mat(1,1:2:30)=24*ones(1,15);
p53_He_data_mat(2,1:2:30)=72*ones(1,15);
p53_He_data_mat(1,2:2:18)=p53_He_ldTMZ_MGMT_M_24h_norm(1:end);
p53_He_data_mat(2,2:2:18)=p53_He_ldTMZ_MGMT_M_72h_norm(1:end);
p53_He_data_mat(1,20:2:end)=p53_He_hdTMZ_MGMT_M_24h_norm(2:end);
p53_He_data_mat(2,20:2:end)=p53_He_hdTMZ_MGMT_M_72h_norm(2:end);

p53ser46_He_data_mat=zeros(2,30);
p53ser46_He_data_mat(1,1:2:30)=24*ones(1,15);
p53ser46_He_data_mat(2,1:2:30)=72*ones(1,15);
p53ser46_He_data_mat(1,2:2:18)=p53ser46_He_ldTMZ_MGMT_M_24h_norm(1:end);
p53ser46_He_data_mat(2,2:2:18)=p53ser46_He_ldTMZ_MGMT_M_72h_norm(1:end);
p53ser46_He_data_mat(1,20:2:end)=p53ser46_He_hdTMZ_MGMT_M_24h_norm(2:end);
p53ser46_He_data_mat(2,20:2:end)=p53ser46_He_hdTMZ_MGMT_M_72h_norm(2:end);

He_p53_data_mat=[p53_He_data_mat p53ser46_He_data_mat];

MGMT_He_ld_MGMT_M='mmmmmmmmm';
MGMT_He_ld_MGMT_P='ppppppppp';
MGMT_He_ld=[MGMT_He_ld_MGMT_M MGMT_He_ld_MGMT_P];
MGMT_He_MGMT_M='mmmmmmmmmmmmmmm';
MGMT_He_MGMT_P='ppppppppppppppp';
MGMT_He_all=[MGMT_He_MGMT_M MGMT_He_MGMT_P];

TMZout0_He=[TMZout0_He_ld TMZout0_He_hd];
TMZout0_He2=[TMZout0_He TMZout0_He];
plot_PK(He_fignumb,He_figcon,He_all_MGMT_M_t_cell,He_all_MGMT_M_sim_cell,MGMT_He_MGMT_M,TMZout0_He,TMZout0_MAX,zeros(1,15))
plot_PD_adducts(He_fignumb+1,He_figcon,He_all_MGMT_M_t_cell,He_all_MGMT_M_sim_cell,MGMT_He_MGMT_M,TMZout0_He,TMZout0_MAX,zeros(1,15))
plot_PD_ATRChk1Cellcycle(He_fignumb+2,He_figcon,He_all_MGMT_M_t_cell,He_all_MGMT_M_sim_cell,He_all_MGMT_M_CyA_cell,MGMT_He_MGMT_M,TMZout0_He,TMZout0_MAX,zeros(1,15))
plot_PD_p53Mdm2(He_fignumb+3,He_figcon,He_all_MGMT_M_t_cell,He_all_MGMT_M_sim_cell,MGMT_He_MGMT_M,TMZout0_He,TMZout0_MAX,zeros(1,15))

plot_PK(He_fignumb+4,He_figcon,He_all_t_cell,He_all_sim_cell,MGMT_He_all,TMZout0_He2,TMZout0_MAX,zeros(1,30))
plot_PD_adducts(He_fignumb+5,He_figcon,He_all_t_cell,He_all_sim_cell,MGMT_He_all,TMZout0_He2,TMZout0_MAX,zeros(1,30))
plot_PD_ATRChk1Cellcycle(He_fignumb+6,He_figcon,He_all_t_cell,He_all_sim_cell,He_all_CyA_cell,MGMT_He_all,TMZout0_He2,TMZout0_MAX,zeros(1,30))
plot_PD_p53Mdm2(He_fignumb+7,He_figcon,He_all_t_cell,He_all_sim_cell,MGMT_He_all,TMZout0_He2,TMZout0_MAX,zeros(1,30))


plot_data(He_fignumb+1,He_figcon,He_add_data_mat,MGMT_He_ld,[TMZdata_He_ld' TMZdata_He_ld'],TMZout0_MAX,zeros(1,18),'add',7*ones(1,18));
plot_data(He_fignumb+3,He_figcon,He_p53_data_mat,[MGMT_He_MGMT_M MGMT_He_MGMT_M],[TMZout0_He TMZout0_He],TMZout0_MAX,zeros(1,30),'p53',[1*ones(1,15) 2*ones(1,15)]);


%%%Kaina%%%
Ka_MGMT_M_t_cell= {tm_cell{sn_Ka_20TMZ_MGMT_M} tm_cell{sn_Ka_50TMZ_MGMT_M} tm_cell{sn_Ka_75TMZ_MGMT_M} tm_cell{sn_Ka_XTMZ_MGMT_M}};
Ka_MGMT_M_sim_cell= {um_cell{sn_Ka_20TMZ_MGMT_M} um_cell{sn_Ka_50TMZ_MGMT_M} um_cell{sn_Ka_75TMZ_MGMT_M} um_cell{sn_Ka_XTMZ_MGMT_M}};
Ka_MGMT_M_CyA_cell= {CyAm_cell{sn_Ka_20TMZ_MGMT_M} CyAm_cell{sn_Ka_50TMZ_MGMT_M} CyAm_cell{sn_Ka_75TMZ_MGMT_M} CyAm_cell{sn_Ka_XTMZ_MGMT_M}};

Ka_MGMT_P_t_cell= {tm_cell{sn_Ka_20TMZ_MGMT_P} tm_cell{sn_Ka_50TMZ_MGMT_P} tm_cell{sn_Ka_100TMZ_MGMT_P} tm_cell{sn_Ka_XTMZ_MGMT_P}};
Ka_MGMT_P_sim_cell= {um_cell{sn_Ka_20TMZ_MGMT_P} um_cell{sn_Ka_50TMZ_MGMT_P} um_cell{sn_Ka_100TMZ_MGMT_P} um_cell{sn_Ka_XTMZ_MGMT_P}};
Ka_MGMT_P_CyA_cell= {CyAm_cell{sn_Ka_20TMZ_MGMT_P} CyAm_cell{sn_Ka_50TMZ_MGMT_P} CyAm_cell{sn_Ka_100TMZ_MGMT_P} CyAm_cell{sn_Ka_XTMZ_MGMT_P}};

Ka_t_cell=[Ka_MGMT_M_t_cell Ka_MGMT_P_t_cell];
Ka_sim_cell=[Ka_MGMT_M_sim_cell Ka_MGMT_P_sim_cell];
Ka_CyA_cell=[Ka_MGMT_M_CyA_cell Ka_MGMT_P_CyA_cell];


O6Meg_Ka_MGMT_M_50TMZ_temp_data(:,1:2)=[O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A];

O6Meg_Ka_LN229_3h_MGMT_M_data=zeros(1,8);
O6Meg_Ka_LN229_3h_MGMT_M_data(1:2:8)=3;
O6Meg_Ka_LN229_3h_MGMT_M_data(2:2:8)=O6Meg_Ka_3h_MGMT_M;

O6Meg_Ka_LN229_3h_MGMT_P_data=zeros(1,6);
O6Meg_Ka_LN229_3h_MGMT_P_data(1:2:6)=3;
O6Meg_Ka_LN229_3h_MGMT_P_data(2:2:6)=O6Meg_Ka_3h_MGMT_P;


O6Meg_Ka_LN229_all_data=zeros(4,16);
O6Meg_Ka_LN229_all_data(:,:)=nan;
O6Meg_Ka_LN229_all_data(:,1:2)=O6Meg_Ka_MGMT_M_50TMZ_temp_data;
O6Meg_Ka_LN229_all_data(1,3:10)=O6Meg_Ka_LN229_3h_MGMT_M_data ;
O6Meg_Ka_LN229_all_data(1,11:16)=O6Meg_Ka_LN229_3h_MGMT_P_data;

MGMT_Ka_sim='mmmmpppp';
TMZout0_Ka_sim=[TMZdata_O6Meg_Ka_3h_MGMT_M(2:end)' TMZout0_Ka_XTMZ TMZdata_O6Meg_Ka_3h_MGMT_P' TMZout0_Ka_XTMZ];

TMZout0_Ka_data=[TMZout0_Ka_XTMZ TMZdata_O6Meg_Ka_3h_MGMT_M' TMZdata_O6Meg_Ka_3h_MGMT_P'];

plot_PK(Ka_fignumb,Ka_figcon,Ka_t_cell,Ka_sim_cell,MGMT_Ka_sim,TMZout0_Ka_sim,TMZout0_MAX,zeros(1,8))
plot_PD_adducts(Ka_fignumb+1,Ka_figcon,Ka_t_cell,Ka_sim_cell,MGMT_Ka_sim,TMZout0_Ka_sim,TMZout0_MAX,zeros(1,8))
plot_PD_ATRChk1Cellcycle(Ka_fignumb+2,Ka_figcon,Ka_t_cell,Ka_sim_cell,Ka_CyA_cell,MGMT_Ka_sim,TMZout0_Ka_sim,TMZout0_MAX,zeros(1,8))
plot_PD_p53Mdm2(Ka_fignumb+3,Ka_figcon,Ka_t_cell,Ka_sim_cell,MGMT_Ka_sim,TMZout0_Ka_sim,TMZout0_MAX,zeros(1,8))

plot_data(Ka_fignumb+1,Ka_figcon,O6Meg_Ka_LN229_all_data,'mmmmmppp',TMZout0_Ka_data,TMZout0_MAX,zeros(1,9),'add',6*ones(1,8))   

%%% Simulations cell TMZ survival
Jack_surv_MGMT_M_t_cell={tm_cell{sn_surv_0TMZ_MGMT_M_144h} tm_cell{sn_surv_1TMZ_MGMT_M_144h} tm_cell{sn_surv_2TMZ_MGMT_M_144h} tm_cell{sn_surv_4TMZ_MGMT_M_144h} tm_cell{sn_surv_8TMZ_MGMT_M_144h} tm_cell{sn_surv_16TMZ_MGMT_M_144h} tm_cell{sn_surv_32TMZ_MGMT_M_144h} tm_cell{sn_surv_64TMZ_MGMT_M_144h} tm_cell{sn_surv_128TMZ_MGMT_M_144h} tm_cell{sn_surv_256TMZ_MGMT_M_144h} tm_cell{sn_surv_512TMZ_MGMT_M_144h} tm_cell{sn_surv_1024TMZ_MGMT_M_144h} tm_cell{sn_surv_3000TMZ_MGMT_M_144h}};
Jack_surv_MGMT_M_sim_cell={um_cell{sn_surv_0TMZ_MGMT_M_144h} um_cell{sn_surv_1TMZ_MGMT_M_144h} um_cell{sn_surv_2TMZ_MGMT_M_144h} um_cell{sn_surv_4TMZ_MGMT_M_144h} um_cell{sn_surv_8TMZ_MGMT_M_144h} um_cell{sn_surv_16TMZ_MGMT_M_144h} um_cell{sn_surv_32TMZ_MGMT_M_144h} um_cell{sn_surv_64TMZ_MGMT_M_144h} um_cell{sn_surv_128TMZ_MGMT_M_144h} um_cell{sn_surv_256TMZ_MGMT_M_144h} um_cell{sn_surv_512TMZ_MGMT_M_144h} um_cell{sn_surv_1024TMZ_MGMT_M_144h} um_cell{sn_surv_3000TMZ_MGMT_M_144h}};
Jack_surv_MGMT_M_CyA_cell={CyAm_cell{sn_surv_0TMZ_MGMT_M_144h} CyAm_cell{sn_surv_1TMZ_MGMT_M_144h} CyAm_cell{sn_surv_2TMZ_MGMT_M_144h} CyAm_cell{sn_surv_4TMZ_MGMT_M_144h} CyAm_cell{sn_surv_8TMZ_MGMT_M_144h} CyAm_cell{sn_surv_16TMZ_MGMT_M_144h} CyAm_cell{sn_surv_32TMZ_MGMT_M_144h} CyAm_cell{sn_surv_64TMZ_MGMT_M_144h} CyAm_cell{sn_surv_128TMZ_MGMT_M_144h} CyAm_cell{sn_surv_256TMZ_MGMT_M_144h} CyAm_cell{sn_surv_512TMZ_MGMT_M_144h} CyAm_cell{sn_surv_1024TMZ_MGMT_M_144h}  CyAm_cell{sn_surv_3000TMZ_MGMT_M_144h}};

Jack_surv_MGMT_P_t_cell={tm_cell{sn_surv_0TMZ_MGMT_P_144h} tm_cell{sn_surv_1TMZ_MGMT_P_144h} tm_cell{sn_surv_2TMZ_MGMT_P_144h} tm_cell{sn_surv_4TMZ_MGMT_P_144h} tm_cell{sn_surv_8TMZ_MGMT_P_144h} tm_cell{sn_surv_16TMZ_MGMT_P_144h} tm_cell{sn_surv_32TMZ_MGMT_P_144h} tm_cell{sn_surv_64TMZ_MGMT_P_144h} tm_cell{sn_surv_128TMZ_MGMT_P_144h} tm_cell{sn_surv_256TMZ_MGMT_P_144h} tm_cell{sn_surv_512TMZ_MGMT_P_144h} tm_cell{sn_surv_1024TMZ_MGMT_P_144h} tm_cell{sn_surv_3000TMZ_MGMT_P_144h}};
Jack_surv_MGMT_P_sim_cell={um_cell{sn_surv_0TMZ_MGMT_P_144h} um_cell{sn_surv_1TMZ_MGMT_P_144h} um_cell{sn_surv_2TMZ_MGMT_P_144h} um_cell{sn_surv_4TMZ_MGMT_P_144h} um_cell{sn_surv_8TMZ_MGMT_P_144h} um_cell{sn_surv_16TMZ_MGMT_P_144h} um_cell{sn_surv_32TMZ_MGMT_P_144h} um_cell{sn_surv_64TMZ_MGMT_P_144h} um_cell{sn_surv_128TMZ_MGMT_P_144h} um_cell{sn_surv_256TMZ_MGMT_P_144h} um_cell{sn_surv_512TMZ_MGMT_P_144h} um_cell{sn_surv_1024TMZ_MGMT_P_144h} um_cell{sn_surv_3000TMZ_MGMT_P_144h}};
Jack_surv_MGMT_P_CyA_cell={CyAm_cell{sn_surv_0TMZ_MGMT_P_144h} CyAm_cell{sn_surv_1TMZ_MGMT_P_144h} CyAm_cell{sn_surv_2TMZ_MGMT_P_144h} CyAm_cell{sn_surv_4TMZ_MGMT_P_144h} CyAm_cell{sn_surv_8TMZ_MGMT_P_144h} CyAm_cell{sn_surv_16TMZ_MGMT_P_144h} CyAm_cell{sn_surv_32TMZ_MGMT_P_144h} CyAm_cell{sn_surv_64TMZ_MGMT_P_144h} CyAm_cell{sn_surv_128TMZ_MGMT_P_144h} CyAm_cell{sn_surv_256TMZ_MGMT_P_144h} CyAm_cell{sn_surv_512TMZ_MGMT_P_144h} CyAm_cell{sn_surv_1024TMZ_MGMT_P_144h} CyAm_cell{sn_surv_3000TMZ_MGMT_P_144h}};


Jack_surv_t_cell=[Jack_surv_MGMT_M_t_cell Jack_surv_MGMT_P_t_cell];
Jack_surv_sim_cell=[Jack_surv_MGMT_M_sim_cell Jack_surv_MGMT_P_sim_cell];
Jack_surv_CyA_cell=[Jack_surv_MGMT_M_CyA_cell Jack_surv_MGMT_P_CyA_cell];

Jack_surv_MGMT_M='mmmmmmmmmmmmm';
Jack_surv_MGMT_P='ppppppppppppp';
Jack_surv_MGMT=[Jack_surv_MGMT_M Jack_surv_MGMT_P];

TMZout0_surv_Jack=[TMZout0_surv_Jack_MGMT_M TMZout0_surv_Jack_MGMT_P];

plot_PK(Jack_surv_PKPD_plot_fignumb,Jack_surv_PKPD_plot_fig,Jack_surv_t_cell,Jack_surv_sim_cell,Jack_surv_MGMT,TMZout0_surv_Jack,TMZout0_MAX,zeros(1,26))
plot_PD_adducts(Jack_surv_PKPD_plot_fignumb+1,Jack_surv_PKPD_plot_fig,Jack_surv_t_cell,Jack_surv_sim_cell,Jack_surv_MGMT,TMZout0_surv_Jack,TMZout0_MAX,zeros(1,26))
plot_PD_ATRChk1Cellcycle(Jack_surv_PKPD_plot_fignumb+2,Jack_surv_PKPD_plot_fig,Jack_surv_t_cell,Jack_surv_sim_cell,Jack_surv_CyA_cell,Jack_surv_MGMT,TMZout0_surv_Jack,TMZout0_MAX,zeros(1,26))
plot_PD_p53Mdm2(Jack_surv_PKPD_plot_fignumb+3,Jack_surv_PKPD_plot_fig,Jack_surv_t_cell,Jack_surv_sim_cell,Jack_surv_MGMT,TMZout0_surv_Jack,TMZout0_MAX,zeros(1,26))



end

