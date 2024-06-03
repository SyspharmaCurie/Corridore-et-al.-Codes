function [TMZout0_surv,surv_curvm] = TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0(patX_param,inhib_factor_BER_Nip,inhib_factor_HR_RI1)

%% heterogeneity population parameters
i=1;
pT=patX_param(i);i=i+1;
pT2=patX_param(i);i=i+1;
k_addO=patX_param(i);i=i+1;
k_addN=patX_param(i);i=i+1;
k_CyA=patX_param(i);i=i+1;
K_cdc25=patX_param(i);i=i+1;
MGMT0=patX_param(i);i=i+1;
k_MGMT=patX_param(i);i=i+1;%
k_BER=patX_param(i);i=i+1;
k_MMR=patX_param(i);i=i+1;
k_DSBO=patX_param(i);i=i+1;
k_DSBN=patX_param(i);i=i+1;
k_HR=patX_param(i);i=i+1;
kf_ATR=patX_param(i);i=i+1;
k_ATR=patX_param(i);i=i+1;
K_add=patX_param(i);i=i+1;
kd_pATR=patX_param(i);i=i+1;%
kf_Chk1=patX_param(i);i=i+1;
k_Chk1=patX_param(i);i=i+1;
kd_pChk1=patX_param(i);i=i+1;
Cdc250=patX_param(i);i=i+1;
k_cdc25=patX_param(i);i=i+1;
kf_p53=patX_param(i);i=i+1;
k_p53=patX_param(i);i=i+1;
K_ATR=patX_param(i);i=i+1;%
kp_ser46=patX_param(i);i=i+1;%
kf_Mdm2=patX_param(i);i=i+1;
K_p53=patX_param(i);i=i+1;
k_apop=patX_param(i);i=i+1;
upAsy=patX_param(i);i=i+1;
tED50=patX_param(i);i=i+1;
sness=patX_param(i);

%% Fix simulation index
global sn_surv_0TMZ_144h sn_surv_1TMZ_144h sn_surv_2TMZ_144h sn_surv_4TMZ_144h sn_surv_8TMZ_144h sn_surv_16TMZ_144h sn_surv_32TMZ_144h ...
    sn_surv_64TMZ_144h sn_surv_128TMZ_144h sn_surv_256TMZ_144h sn_surv_512TMZ_144h sn_surv_1024TMZ_144h sn_surv_3000TMZ_144h...
    sim_number
    sim_indx()

%% volume in L
Vcell=7*1e-12;
%intracellular volume in L
Vin=1e6*Vcell;
%extracellular medium in L
Vout=2e-3;

%% Time in hours
[numb_comptime1,t_surv] = simulations_time();

%% Initial conditions, in microM
[TMZout0_surv,TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,mO60,RNA_MGMT0,GT0,SSB0,RNA_Mdm20,Mdm20,cell_pop0,cell_pop_norm0] = def_int_cond();
%% PARAMETERS 
[pA,pA2,kT0,lambdaT,kM0,lambdaM,pH0,kcat,dna,kd_MGMT,omega_cc,t0_cc,M_cc,A_cc,phi_cc,n_cc,...
    k_GT,kd_ATR,n_add,kd_Chk1,kd_cdc25,n_cdc25,...
    n_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kt_Mdm2,kt_Mdm2p53,n_p53,n_p53int] = def_params();

%% PARAMETERS to estimate
[DSB_72h_fac] = def_params_toEstimate();

%% Elements depending on PARAMETERS
[kf_MGMT,K_cc,k_addEx,mN370,DSB0,...
    ATR0,pATR0,Chk10,pChk10,...
    kf_cdc25,p530,p53_ser460,kd_ser46,ktd_Mdm2,kd_Mdm2...
    ] = param_dep_elem(...
    RNA_MGMT0,MGMT0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,k_HR,k_DSBN,k_CyA,n_cc,k_BER,...
    kf_ATR,k_ATR,n_add,K_add,kd_ATR,kd_pATR,...
    kf_Chk1,k_Chk1,kd_Chk1,kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,kp_ser46,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2);

%% Inhibition
[k_BERInhib_Nip,k_HRInhib_RI1,mN370,DSB0,ATR0,pATR0,...
    Chk10,pChk10,Cdc250,p530,p53_ser460...
    ] = inhibition_func(inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR,k_ATR,kd_ATR,kd_pATR,kf_Chk1,kd_Chk1,k_Chk1,kd_pChk1,...
    Cdc250,kf_cdc25,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

%% Simulation Initial conditions
[int_cond_mat]= initial_cond_func(TMZout0_surv,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    MGMT0,mO60,GT0,SSB0,mN370,DSB0,ATR0,pATR0,Chk10,pChk10,Cdc250,p530,p53_ser460,RNA_Mdm20,Mdm20);

%% PK-PD Model
[tm_cell,um_cell] = simulations_PKPD(...
    t_surv,...
    int_cond_mat,RNA_MGMT0,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
    k_addO,kf_MGMT,k_MGMT,kd_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_addEx,k_addN,k_BERInhib_Nip,k_DSBO,k_DSBN,k_HRInhib_RI1,k_CyA,K_cc,n_cc,k_ATR,K_add,n_add,kf_ATR,kd_ATR,kd_pATR,...
    k_Chk1,kf_Chk1,kd_Chk1,kd_pChk1,kf_cdc25,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kd_ser46,kt_Mdm2,ktd_Mdm2,kt_Mdm2p53,K_p53,n_p53,kf_Mdm2,kd_Mdm2);

%% Cell population 
[surv_curvm,tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,TMZout0_surv,cell_pop0,cell_pop_norm0,k_apop,n_p53int,upAsy,sness,tED50,numb_comptime1);



end
