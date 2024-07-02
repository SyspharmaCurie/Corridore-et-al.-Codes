function MAIN_TMZ_PK_PD_calibrated()

%The following code has for goal to estimate the data collected in the
%folder "Data" with the PK-PD model which equations are reported in
%"TMZ_PK_PD_ODE.m".
% TO NOTE: "estimation=0" to visualize the model with the initial
% parameters. "estimation=1" to perform the model calibration and then to
% visualize the model with the initial parameters.

clear all
format long

%% Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));

% Set current directory to 'my_dir' and add path to sub-folders:
restoredefaultpath
cd(my_dir)
% addpath(genpath(my_dir))
addpath(genpath('./cellpop_module'))
addpath(genpath('./Data_funcs'))
addpath(genpath('./fig_funcs'))
addpath(genpath('./Init_cond_funcs'))
addpath(genpath('./Legend_colors'))
addpath(genpath('./Others_funcs'))
addpath(genpath('./Param_funcs'))
addpath(genpath('./PK_PD_model'))
addpath(genpath('./Simulations_funcs'))
%% Fix simulation index
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
    sim_indx()

%% plot control
[paper_tempDyn_fig,paper_TMZvsConc_fig,...
paper_tempDyn_fignumb,paper_TMZvsConc_fignumb...
] = plot_control();

%% Create legend colors folder and file
Legend_colors_dir=strcat('Legend_colors/');
if ~exist(Legend_colors_dir,'dir')
    mkdir(Legend_colors_dir);
end
fileID=fopen(strcat(Legend_colors_dir,'Legend_colors.txt'),'w');
fclose(fileID);

%% DATA
[TMZdata_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,...
          TMZdata_nosurv_Jack_data,MGMT_Jack_MGMT_M_time,MGMT_Jack_MGMT_M,Chk1_Jack_MGMT_M_time,Chk1_Jack_MGMT_M,pChk1_Jack_MGMT_M_time,pChk1_Jack_MGMT_M,...
          TMZdata_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
          MGMT_Jack_MGMT_P_time,MGMT_Jack_MGMT_P,Chk1_Jack_MGMT_P_time,Chk1_Jack_MGMT_P,pChk1_Jack_MGMT_P_time,pChk1_Jack_MGMT_P,...
          TMZdata_Jack_inhATR,VX_Jack2D,MGMT_Jack_inhATR_TMZVXcon_MGMT_M,MGMT_Jack_inhATR_VXcon_MGMT_M,MGMT_Jack_inhATR_MGMT_M,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_M,Chk1_Jack_inhATR_VXcon_MGMT_M,Chk1_Jack_inhATR_MGMT_M,...
          pChk1_Jack_inhATR_TMZVXcon_MGMT_M,pChk1_Jack_inhATR_VXcon_MGMT_M,pChk1_Jack_inhATR_MGMT_M,...
          MGMT_Jack_inhATR_TMZVXcon_MGMT_P,MGMT_Jack_inhATR_VXcon_MGMT_P,MGMT_Jack_inhATR_MGMT_P,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_P,Chk1_Jack_inhATR_VXcon_MGMT_P,Chk1_Jack_inhATR_MGMT_P,...
          pChk1_Jack_inhATR_TMZVXcon_MGMT_P,pChk1_Jack_inhATR_VXcon_MGMT_P,pChk1_Jack_inhATR_MGMT_P,...
          TMZdata_Aas,p53_Aas_time,p53_Aas,pChk1_Aas_time,pChk1_Aas,cdc25c_Aas_time,cdc25c_Aas,surv_Aas_25TMZ,...
          TMZdata_He_hd,p53_He_hdTMZ_MGMT_M_24h,p53_He_hdTMZ_MGMT_M_72h,p53ser46_He_hdTMZ_MGMT_M_24h,p53ser46_He_hdTMZ_MGMT_M_72h,...
          apop_mean_He_hdTMZ_MGMT_M_72h,apop_stddev_He_hdTMZ_MGMT_M_72h,apop_mean_He_hdTMZ_MGMT_M_96h,apop_stddev_He_hdTMZ_MGMT_M_96h,...
          apop_mean_He_hdTMZ_MGMT_M_120h,apop_stddev_He_hdTMZ_MGMT_M_120h,apop_mean_He_hdTMZ_MGMT_M_144h,apop_stddev_He_hdTMZ_MGMT_M_144h,...
          apop_mean_He_hdTMZ_MGMT_P_72h,apop_stddev_He_hdTMZ_MGMT_P_72h,apop_mean_He_hdTMZ_MGMT_P_96h,apop_stddev_He_hdTMZ_MGMT_P_96h,...
          apop_mean_He_hdTMZ_MGMT_P_120h,apop_stddev_He_hdTMZ_MGMT_P_120h,apop_mean_He_hdTMZ_MGMT_P_144h,apop_stddev_He_hdTMZ_MGMT_P_144h,...
          TMZdata_He_ld,DSB_He_ldTMZ_MGMT_M_72h,DSB_He_ldTMZ_MGMT_P_72h,p53_He_ldTMZ_MGMT_M_24h,p53_He_ldTMZ_MGMT_M_72h,p53ser46_He_ldTMZ_MGMT_M_24h,p53ser46_He_ldTMZ_MGMT_M_72h,...
          apop_mean_He_ldTMZ_MGMT_M_120h,apop_stddev_He_ldTMZ_MGMT_M_120h,apop_mean_He_ldTMZ_MGMT_P_120h,apop_stddev_He_ldTMZ_MGMT_P_120h,...
          O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time,O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A,...
          TMZdata_O6Meg_Ka_3h_MGMT_M,O6Meg_Ka_3h_MGMT_M,TMZdata_O6Meg_Ka_3h_MGMT_P,O6Meg_Ka_3h_MGMT_P] = data_reader();
      
%% volume in L
Vcell=7*1e-12;
%intracellular volume in L
Vin=1e6*Vcell;
%extracellular medium in L
Vout=2e-3;

%% Time in hours
[numb_comptime1,t_Jack,t_Jack_inhATR,t_Aas,t_He,t_Ka,t_Jack_surv] = simulations_time();

%% Initial conditions, in microM
[TMZout0_Jack,TMZout0_Jack_inhATR,TMZout0_Aas,TMZout0_He_ld,TMZout0_He_hd,TMZout0_Ka_MGMT_M,TMZout0_Ka_MGMT_P,TMZout0_MAX,TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,mO60,RNA_MGMT0,MGMT0_U87_LN229,GT0,SSB0,Cdc250,RNA_Mdm20,Mdm20,cell_pop0,cell_pop_norm0_Jack_MGMT_M,cell_pop_norm0_He...
    ] =def_int_cond(...
    TMZdata_nosurv_Jack_data,TMZdata_Jack_inhATR,TMZdata_Aas,TMZdata_He_ld,TMZdata_He_hd,TMZdata_O6Meg_Ka_3h_MGMT_M,TMZdata_O6Meg_Ka_3h_MGMT_P,TMZdata_surv_Jack_MGMT_M,TMZdata_surv_Jack_MGMT_P);   

%% PARAMETERS 
[pT,pA,pT2,pA2,kT0,lambdaT,kM0,lambdaM,pH0,kcat,dna,kd_MGMT,omega_cc,t0_cc,M_cc,A_cc,phi_cc,n_cc,...
    k_GT,k_MMR,k_BER,k_HR,kf_ATR_MGMT_M,kd_ATR,n_add,kf_Chk1_MGMT_M,kd_Chk1,kd_cdc25,n_cdc25,...
    n_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kt_Mdm2,kt_Mdm2p53,n_p53,kf_Mdm2,n_p53int] = def_params();

%% PARAMETERS to estimate
[TMZout0_Ka_XTMZ,MGMT_P0,k_MGMT,k_addO,k_addN,DSB_72h_fac,k_DSBO,k_DSBN,k_CyA,fVX,kf_ATR_MGMT_P,k_ATR,K_add,kd_pATR,k_Chk1,C_Chk1,pChk1_ref12_5_24h,pChk1_ref100_24h,pChk1_ref100_48h,kd_pChk1,k_cdc25,K_cdc25,...
kf_p53,k_p53,K_ATR,p53ser46_ref50_72h,kp_ser46,K_p53,upAsy,sness,k_apop,tED50,cell_pop_norm0_Jack_MGMT_P,k_dis...
] = def_params_toEstimate();

%% Elements depending on PARAMETERS
[kf_MGMT_M,kf_MGMT_P,K_cc,DSB_72h,k_addEx,mN370,DSB0,...
    ATR0_MGMT_M,ATR0_8VX_MGMT_M,ATR0_40VX_MGMT_M,ATR0_200VX_MGMT_M,ATR0_1000VX_MGMT_M,pATR0_MGMT_M,...
    ATR0_MGMT_P,ATR0_8VX_MGMT_P,ATR0_40VX_MGMT_P,ATR0_200VX_MGMT_P,ATR0_1000VX_MGMT_P,pATR0_MGMT_P,...
    Chk10_MGMT_M,kf_Chk1_MGMT_P,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kd_ser46_MGMT_M,kd_ser46_MGMT_P,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kd_Mdm2] = param_dep_elem(...
    RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,DSB_He_ldTMZ_MGMT_M_72h,k_HR,k_DSBN,k_CyA,n_cc,...
    k_BER,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,n_add,K_add,kd_ATR,...
    fVX,VX_Jack2D,...
    kd_pATR,...
    kf_Chk1_MGMT_M,k_Chk1,kd_Chk1,C_Chk1,...
    kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,kp_ser46,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2);

%% Data Normalization
[Chk1_Jack_MGMT_M_norm,Chk1_Jack_MGMT_P_norm,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Chk1_Jack_inhATR_MGMT_M_norm,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk1_Jack_inhATR_VXcon_MGMT_P_norm,Chk1_Jack_inhATR_MGMT_P_norm,...
          cdc25c_Aas_norm] = data_norm(Chk10_MGMT_M,Chk10_MGMT_P,Chk1_Jack_MGMT_M,Chk1_Jack_MGMT_P,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_M,Chk1_Jack_inhATR_VXcon_MGMT_M,Chk1_Jack_inhATR_MGMT_M,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_P,Chk1_Jack_inhATR_VXcon_MGMT_P,Chk1_Jack_inhATR_MGMT_P,...
          Cdc250,cdc25c_Aas);

%% Simulation Initial conditions
[int_cond_mat]= initial_cond_func(TMZout0_Jack,TMZout0_Jack_inhATR,TMZout0_Aas,TMZout0_He_ld,TMZout0_He_hd,TMZout0_Ka_MGMT_M,TMZout0_Ka_MGMT_P,TMZout0_Ka_XTMZ,...
    TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,GT0,SSB0,mN370,DSB0,Cdc250,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,MGMT_P0,...
    ATR0_MGMT_M,ATR0_8VX_MGMT_M,ATR0_40VX_MGMT_M,ATR0_200VX_MGMT_M,ATR0_1000VX_MGMT_M,...
    ATR0_MGMT_P,ATR0_8VX_MGMT_P,ATR0_40VX_MGMT_P,ATR0_200VX_MGMT_P,ATR0_1000VX_MGMT_P,...
    pATR0_MGMT_M,pATR0_MGMT_P,...
    Chk10_MGMT_M,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,...
    p53_ser460_MGMT_M,p53_ser460_MGMT_P);


%% PK-PD Model
[tm_cell,um_cell] = simulations_PKPD(...
    t_Jack,t_Jack_inhATR,t_Aas,t_He,t_Ka,t_Jack_surv,...
    int_cond_mat,RNA_MGMT0,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
    k_addO,kd_MGMT,k_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_addEx,k_addN,k_BER,k_DSBO,k_DSBN,k_HR,k_CyA,K_cc,n_cc,k_ATR,K_add,n_add,kd_ATR,kd_pATR,...
    k_Chk1,kd_Chk1,kd_pChk1,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kt_Mdm2,kt_Mdm2p53,K_p53,n_p53,kf_Mdm2,kd_Mdm2,...
    kf_MGMT_M,kf_MGMT_P,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,...
    kf_Chk1_MGMT_M,kf_Chk1_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    kd_ser46_MGMT_M,kd_ser46_MGMT_P,...
    ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P...
    );

%% Cell Cycle Model
CyAm_cell = simulations_CyA(tm_cell,um_cell,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

%% Cell population 
[Jack_surv_curvm_MGMT_M,Jack_surv_curvm_MGMT_P,...
    He_ld_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_72h,He_hd_apop_curvm_MGMT_M_96h,He_hd_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_144h,...
    He_ld_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_72h,He_hd_apop_curvm_MGMT_P_96h,He_hd_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_144h,...
    tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,k_dis,...
    TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,TMZout0_He_ld,TMZout0_He_hd,...
    numb_comptime1,...
    cell_pop_norm0_Jack_MGMT_M,cell_pop_norm0_Jack_MGMT_P,cell_pop_norm0_He);

%% Data Normalization with model
[MGMT_Jack_MGMT_M_norm,MGMT_Jack_MGMT_P_norm,...Normalized Data
    pChk1_Jack_MGMT_M_norm,pChk1_Jack_MGMT_P_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm,MGMT_Jack_inhATR_VXcon_MGMT_M_norm,MGMT_Jack_inhATR_MGMT_M_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm,MGMT_Jack_inhATR_VXcon_MGMT_P_norm,MGMT_Jack_inhATR_MGMT_P_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,pChk1_Jack_inhATR_VXcon_MGMT_M_norm,pChk1_Jack_inhATR_MGMT_M_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,pChk1_Jack_inhATR_VXcon_MGMT_P_norm,pChk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Aas_norm,p53_Aas_norm,...
    p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,...
    p53_He_ldTMZ_MGMT_M_24h_norm,p53_He_ldTMZ_MGMT_M_72h_norm,...
    p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    p53ser46_He_ldTMZ_MGMT_M_24h_norm,p53ser46_He_ldTMZ_MGMT_M_72h_norm]=data_norm_withmod(...Parameters
    MGMT_Jack_MGMT_M,MGMT_Jack_MGMT_P,...Data
    pChk1_Jack_MGMT_M,pChk1_Jack_MGMT_P,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_M,MGMT_Jack_inhATR_VXcon_MGMT_M,MGMT_Jack_inhATR_MGMT_M,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P,MGMT_Jack_inhATR_VXcon_MGMT_P,MGMT_Jack_inhATR_MGMT_P,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M,pChk1_Jack_inhATR_VXcon_MGMT_M,pChk1_Jack_inhATR_MGMT_M,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P,pChk1_Jack_inhATR_VXcon_MGMT_P,pChk1_Jack_inhATR_MGMT_P,...
    pChk1_Aas,p53_Aas,...
    p53_He_ldTMZ_MGMT_M_24h,p53_He_ldTMZ_MGMT_M_72h,...
    p53_He_hdTMZ_MGMT_M_24h,p53_He_hdTMZ_MGMT_M_72h,...
    p53ser46_He_hdTMZ_MGMT_M_24h,p53ser46_He_hdTMZ_MGMT_M_72h,...
    p53ser46_He_ldTMZ_MGMT_M_24h,p53ser46_He_ldTMZ_MGMT_M_72h,...
    MGMT_P0,p530_MGMT_M,...normalization value reference
    pChk1_ref12_5_24h,pChk1_ref100_24h,pChk1_ref100_48h,p53ser46_ref50_72h...
        );

%% Figures
plot_setting_paper_TMZvsConc(um_cell,Jack_surv_curvm_MGMT_M,Jack_surv_curvm_MGMT_P,...simulations
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
    );

plot_setting_paper_temDyn(tm_cell,um_cell,CyAm_cell,tcellpopm_cell,cellpopm_cell,...simulations
    TMZout0_Jack,MGMT_Jack_MGMT_M_time,MGMT_Jack_MGMT_M_norm,Chk1_Jack_MGMT_M_time,Chk1_Jack_MGMT_M_norm,pChk1_Jack_MGMT_M_time,pChk1_Jack_MGMT_M_norm,...data
    MGMT_Jack_MGMT_P_time,MGMT_Jack_MGMT_P_norm,Chk1_Jack_MGMT_P_time,Chk1_Jack_MGMT_P_norm,pChk1_Jack_MGMT_P_time,pChk1_Jack_MGMT_P_norm,...
    TMZout0_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
    TMZout0_Aas,pChk1_Aas_time,pChk1_Aas_norm,cdc25c_Aas_time,cdc25c_Aas_norm,p53_Aas_time,p53_Aas_norm,...
    p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    paper_tempDyn_fig,...plot control
    paper_tempDyn_fignumb,...%plot figure number
    numb_comptime1,upAsy,sness,tED50...
    );

%%%%%Computational Time End
wholeTime = toc(now1)
disp('sec')







end
