function plot_setting_paper_tempDyn_TMZVX(tm_cell,um_cell,CyAm_cell,...simulations
    VX_Jack2D,TMZout0_Jack_inhATR,MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm,MGMT_Jack_inhATR_VXcon_MGMT_M_norm,MGMT_Jack_inhATR_MGMT_M_norm,...data
    Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Chk1_Jack_inhATR_MGMT_M_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,pChk1_Jack_inhATR_VXcon_MGMT_M_norm,pChk1_Jack_inhATR_MGMT_M_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm,MGMT_Jack_inhATR_VXcon_MGMT_P_norm,MGMT_Jack_inhATR_MGMT_P_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk1_Jack_inhATR_VXcon_MGMT_P_norm,Chk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,pChk1_Jack_inhATR_VXcon_MGMT_P_norm,pChk1_Jack_inhATR_MGMT_P_norm,...
    paper_tempDyn_TMZVX,...plot control
    paper_tempDyn_TMZVX_fignumb,...%plot figure number
    TMZout0_MAX ...other
    )

global sn_Jack_MGMT_M sn_Jack_MGMT_P...
    sn_Jack_inhATR_TMZVXcon_MGMT_M sn_Jack_inhATR_VXcon_MGMT_M sn_Jack_inhATR8VX_MGMT_M sn_Jack_inhATR40VX_MGMT_M sn_Jack_inhATR200VX_MGMT_M sn_Jack_inhATR1000VX_MGMT_M ...
    sn_Jack_inhATR_TMZVXcon_MGMT_P sn_Jack_inhATR_VXcon_MGMT_P sn_Jack_inhATR8VX_MGMT_P sn_Jack_inhATR40VX_MGMT_P sn_Jack_inhATR200VX_MGMT_P sn_Jack_inhATR1000VX_MGMT_P ...
    sn_Aas ...
    sn_He_0TMZ_MGMT_M_72h sn_He_1TMZ_MGMT_M_72h sn_He_2TMZ_MGMT_M_72h sn_He_3TMZ_MGMT_M_72h sn_He_4TMZ_MGMT_M_72h sn_He_5TMZ_MGMT_M_72h sn_He_10TMZ_MGMT_M_72h sn_He_15TMZ_MGMT_M_72h sn_He_20TMZ_MGMT_M_72h ...
    sn_He_12_5TMZ_MGMT_M_72h sn_He_25TMZ_MGMT_M_72h sn_He_50TMZ_MGMT_M_72h sn_He_75TMZ_MGMT_M_72h sn_He_100TMZ_MGMT_M_72h sn_He_125TMZ_MGMT_M_72h ...
    sn_He_0TMZ_MGMT_P_72h sn_He_1TMZ_MGMT_P_72h sn_He_2TMZ_MGMT_P_72h sn_He_3TMZ_MGMT_P_72h sn_He_4TMZ_MGMT_P_72h sn_He_5TMZ_MGMT_P_72h sn_He_10TMZ_MGMT_P_72h sn_He_15TMZ_MGMT_P_72h sn_He_20TMZ_MGMT_P_72h ...
    sn_Ka_24TMZ_MGMT_M sn_Ka_50TMZ_MGMT_M sn_Ka_75TMZ_MGMT_M sn_Ka_100TMZ_MGMT_M sn_Ka_XTMZ_MGMT_M...
    sn_Ka_24TMZ_MGMT_P sn_Ka_50TMZ_MGMT_P sn_Ka_75TMZ_MGMT_P sn_Ka_100TMZ_MGMT_P sn_Ka_XTMZ_MGMT_P...
    sn_Jack_0TMZ_MGMT_M_144h sn_Jack_1TMZ_MGMT_M_144h sn_Jack_2TMZ_MGMT_M_144h sn_Jack_4TMZ_MGMT_M_144h sn_Jack_8TMZ_MGMT_M_144h sn_Jack_16TMZ_MGMT_M_144h sn_Jack_32TMZ_MGMT_M_144h ...
    sn_Jack_64TMZ_MGMT_M_144h sn_Jack_128TMZ_MGMT_M_144h sn_Jack_256TMZ_MGMT_M_144h sn_Jack_512TMZ_MGMT_M_144h sn_Jack_1024TMZ_MGMT_M_144h...
    sn_Jack_0TMZ_MGMT_P_144h sn_Jack_1TMZ_MGMT_P_144h sn_Jack_2TMZ_MGMT_P_144h sn_Jack_4TMZ_MGMT_P_144h sn_Jack_8TMZ_MGMT_P_144h sn_Jack_16TMZ_MGMT_P_144h sn_Jack_32TMZ_MGMT_P_144h...
    sn_Jack_64TMZ_MGMT_P_144h sn_Jack_128TMZ_MGMT_P_144h sn_Jack_256TMZ_MGMT_P_144h sn_Jack_512TMZ_MGMT_P_144h sn_Jack_1024TMZ_MGMT_P_144h...
    sim_mumber



%%  Jackson inhibited ATR

if paper_tempDyn_TMZVX==1
    
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

Jack_inhATR_MGMT_M_data_mat=[MGMT_Jack_inhATR_MGMT_M_data_mat Chk1_Jack_inhATR_MGMT_M_data_mat pChk1_Jack_inhATR_MGMT_M_data_mat];

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

Jack_inhATR_MGMT_P_data_mat=[MGMT_Jack_inhATR_MGMT_P_data_mat Chk1_Jack_inhATR_MGMT_P_data_mat pChk1_Jack_inhATR_MGMT_P_data_mat];

Jack_inhATR_data_mat=[Jack_inhATR_MGMT_M_data_mat Jack_inhATR_MGMT_P_data_mat];

Jack_inhATR_MGMT_M=['m' 'm' 'm' 'm' 'm' 'm'];
Jack_inhATR_MGMT_P=['p' 'p' 'p' 'p' 'p' 'p'];
Jack_inhATR_MGMT=[Jack_inhATR_MGMT_M Jack_inhATR_MGMT_P];
Jack_inhATR_MGMT_data=[Jack_inhATR_MGMT_M Jack_inhATR_MGMT_M Jack_inhATR_MGMT_M Jack_inhATR_MGMT_P Jack_inhATR_MGMT_P Jack_inhATR_MGMT_P];

TMZout0_Jack_inhATR_sim=[TMZout0_Jack_inhATR TMZout0_Jack_inhATR];
TMZout0_Jack_inhATR_data=[TMZout0_Jack_inhATR TMZout0_Jack_inhATR TMZout0_Jack_inhATR TMZout0_Jack_inhATR TMZout0_Jack_inhATR TMZout0_Jack_inhATR];

VX_Jack_sim=[VX_Jack2D VX_Jack2D];
VX_Jack_data=[VX_Jack2D VX_Jack2D VX_Jack2D VX_Jack2D VX_Jack2D VX_Jack2D];

Jack_inhATR_gen_subplot_vec=[ones(1,6) 5*ones(1,6) 6*ones(1,6) ones(1,6) 5*ones(1,6) 6*ones(1,6)];

plot_paper_tempDyn_TMZVX(paper_tempDyn_TMZVX_fignumb,Jack_inhATR_t_cell,Jack_inhATR_sim_cell,Jack_inhATR_CyA_cell,Jack_inhATR_MGMT,TMZout0_Jack_inhATR_sim,TMZout0_MAX,VX_Jack_sim);
plot_paper_tempDyn_TMZVX_data(paper_tempDyn_TMZVX_fignumb,Jack_inhATR_data_mat,Jack_inhATR_MGMT_data,TMZout0_Jack_inhATR_data,TMZout0_MAX,VX_Jack_data,Jack_inhATR_gen_subplot_vec);

end
end

