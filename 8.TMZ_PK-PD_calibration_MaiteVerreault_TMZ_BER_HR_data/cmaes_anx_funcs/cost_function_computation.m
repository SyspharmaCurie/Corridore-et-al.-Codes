function cost=cost_function_computation(param_scale,LO,UP,t_Verre_surv,numb_comptime1,...
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...%simulations initial conditions
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,RNA_MGMT0,GT0,SSB0,Cdc250,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,...
    cell_pop0,cell_pop_norm0_Verre_MGMT_M,cell_pop_norm0_Verre_MGMT_P,...
    surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...data
    surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    surv_mean_Verre_TMZNip_MGMT_M,surv_stddev_Verre_TMZNip_MGMT_M,...
    surv_mean_Verre_TMZNip_MGMT_P,surv_stddev_Verre_TMZNip_MGMT_P,...
    surv_mean_Verre_TMZRI1_MGMT_M,surv_stddev_Verre_TMZRI1_MGMT_M,...
    surv_mean_Verre_TMZRI1_MGMT_P,surv_stddev_Verre_TMZRI1_MGMT_P,...
    surv_mean_Verre_TMZRI1Nip_MGMT_M,surv_stddev_Verre_TMZRI1Nip_MGMT_M,...
    surv_mean_Verre_TMZRI1Nip_MGMT_P,surv_stddev_Verre_TMZRI1Nip_MGMT_P,...
    DSB_He_ldTMZ_MGMT_M_72h,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...%simulation parameters
    kd_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_BER,k_HR,kd_ATR,kf_Chk1_MGMT_M,kd_Chk1,n_cdc25,kd_cdc25,n_cc,n_add,...
    n_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kt_Mdm2,kt_Mdm2p53,n_p53,kf_Mdm2,n_p53int,...
    MGMT_P0,k_MGMT,k_addO,k_addN,DSB_72h_fac,k_DSBO,k_DSBN,k_CyA,kd_pATR,k_Chk1,C_Chk1,...
    kd_pChk1,k_cdc25,K_cdc25,k_p53,K_p53,sness,k_apop,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,K_add,kf_p53,tED50,upAsy)

global sn_Verre_TMZalone_0TMZ_MGMT_M sn_Verre_TMZalone_5TMZ_MGMT_M sn_Verre_TMZalone_25TMZ_MGMT_M sn_Verre_TMZalone_50TMZ_MGMT_M sn_Verre_TMZalone_100TMZ_MGMT_M sn_Verre_TMZalone_200TMZ_MGMT_M sn_Verre_TMZalone_400TMZ_MGMT_M sn_Verre_TMZalone_800TMZ_MGMT_M sn_Verre_TMZalone_1000TMZ_MGMT_M...
    sn_Verre_TMZalone_0TMZ_MGMT_P sn_Verre_TMZalone_5TMZ_MGMT_P sn_Verre_TMZalone_25TMZ_MGMT_P sn_Verre_TMZalone_50TMZ_MGMT_P sn_Verre_TMZalone_100TMZ_MGMT_P sn_Verre_TMZalone_200TMZ_MGMT_P sn_Verre_TMZalone_400TMZ_MGMT_P sn_Verre_TMZalone_800TMZ_MGMT_P sn_Verre_TMZalone_1000TMZ_MGMT_P...
    sim_number

sim_indx();


%% Parameter Scaling to [LO,UP]
param=LO.*(UP./LO).^param_scale;

%% Under estimation parameters
i=1;
inhib_factor_BER_Nip=param(i);i=i+1;
inhib_factor_HR_RI1=param(i);

%% Elements depending on PARAMETERS
[K_ATR,kp_ser46,kf_MGMT_M,kf_MGMT_P,K_cc,k_addEx,mN370,DSB0,...
    ATR0_MGMT_M,pATR0_MGMT_M,...
    ATR0_MGMT_P,pATR0_MGMT_P,...
    Chk10_MGMT_M,kf_Chk1_MGMT_P,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kd_ser46_MGMT_M,kd_ser46_MGMT_P,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kd_Mdm2...
    ] = param_dep_elem(...
    RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,DSB_He_ldTMZ_MGMT_M_72h,k_HR,k_DSBN,k_CyA,n_cc,...
    k_BER,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,n_add,K_add,kd_ATR,...
    kd_pATR,...
    kf_Chk1_MGMT_M,k_Chk1,kd_Chk1,C_Chk1,...
    kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2);

%% Inhibition
[k_BER_TMZalone,k_HR_TMZalone,...
    mN370_TMZalone,DSB0_TMZalone,ATR0_MGMT_M_TMZalone,ATR0_MGMT_P_TMZalone,pATR0_MGMT_M_TMZalone,pATR0_MGMT_P_TMZalone,...
    Chk10_MGMT_M_TMZalone,Chk10_MGMT_P_TMZalone,pChk10_MGMT_M_TMZalone,pChk10_MGMT_P_TMZalone,...
    Cdc250_MGMT_M_TMZalone,Cdc250_MGMT_P_TMZalone,p530_MGMT_M_TMZalone,p530_MGMT_P_TMZalone,p53_ser460_MGMT_M_TMZalone,p53_ser460_MGMT_P_TMZalone,...
    ] = inhibition_func(1,1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,C_Chk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);


[k_BER_Nip,k_HR_Nip,...
    mN370_Nip,DSB0_Nip,ATR0_MGMT_M_Nip,ATR0_MGMT_P_Nip,pATR0_MGMT_M_Nip,pATR0_MGMT_P_Nip,...
    Chk10_MGMT_M_Nip,Chk10_MGMT_P_Nip,pChk10_MGMT_M_Nip,pChk10_MGMT_P_Nip,...
    Cdc250_MGMT_M_Nip,Cdc250_MGMT_P_Nip,p530_MGMT_M_Nip,p530_MGMT_P_Nip,p53_ser460_MGMT_M_Nip,p53_ser460_MGMT_P_Nip,...
    ] = inhibition_func(inhib_factor_BER_Nip,1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,C_Chk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

[k_BER_RI1,k_HR_RI1,...
    mN370_RI1,DSB0_RI1,ATR0_MGMT_M_RI1,ATR0_MGMT_P_RI1,pATR0_MGMT_M_RI1,pATR0_MGMT_P_RI1,...
    Chk10_MGMT_M_RI1,Chk10_MGMT_P_RI1,pChk10_MGMT_M_RI1,pChk10_MGMT_P_RI1,...
    Cdc250_MGMT_M_RI1,Cdc250_MGMT_P_RI1,p530_MGMT_M_RI1,p530_MGMT_P_RI1,p53_ser460_MGMT_M_RI1,p53_ser460_MGMT_P_RI1,...
    ] = inhibition_func(1,inhib_factor_HR_RI1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,C_Chk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

[k_BER_RI1Nip,k_HR_RI1Nip,...
    mN370_RI1Nip,DSB0_RI1Nip,ATR0_MGMT_M_RI1Nip,ATR0_MGMT_P_RI1Nip,pATR0_MGMT_M_RI1Nip,pATR0_MGMT_P_RI1Nip,...
    Chk10_MGMT_M_RI1Nip,Chk10_MGMT_P_RI1Nip,pChk10_MGMT_M_RI1Nip,pChk10_MGMT_P_RI1Nip,...
    Cdc250_MGMT_M_RI1Nip,Cdc250_MGMT_P_RI1Nip,p530_MGMT_M_RI1Nip,p530_MGMT_P_RI1Nip,p53_ser460_MGMT_M_RI1Nip,p53_ser460_MGMT_P_RI1Nip,...
    ] = inhibition_func(inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,C_Chk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

%% New Simulation Initial conditions
[int_cond_mat]= initial_cond_func(TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,GT0,SSB0,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,MGMT_P0,...
    mN370_TMZalone,mN370_Nip,mN370_RI1,mN370_RI1Nip,...
    DSB0_TMZalone,DSB0_Nip,DSB0_RI1,DSB0_RI1Nip,...
    ATR0_MGMT_M_TMZalone,ATR0_MGMT_M_Nip,ATR0_MGMT_M_RI1,ATR0_MGMT_M_RI1Nip,...
    ATR0_MGMT_P_TMZalone,ATR0_MGMT_P_Nip,ATR0_MGMT_P_RI1,ATR0_MGMT_P_RI1Nip,...
    pATR0_MGMT_M_TMZalone,pATR0_MGMT_M_Nip,pATR0_MGMT_M_RI1,pATR0_MGMT_M_RI1Nip,...
    pATR0_MGMT_P_TMZalone,pATR0_MGMT_P_Nip,pATR0_MGMT_P_RI1,pATR0_MGMT_P_RI1Nip,...
    Chk10_MGMT_M_TMZalone,Chk10_MGMT_M_Nip,Chk10_MGMT_M_RI1,Chk10_MGMT_M_RI1Nip,...
    Chk10_MGMT_P_TMZalone,Chk10_MGMT_P_Nip,Chk10_MGMT_P_RI1,Chk10_MGMT_P_RI1Nip,...
    pChk10_MGMT_M_TMZalone,pChk10_MGMT_M_Nip,pChk10_MGMT_M_RI1,pChk10_MGMT_M_RI1Nip,...
    pChk10_MGMT_P_TMZalone,pChk10_MGMT_P_Nip,pChk10_MGMT_P_RI1,pChk10_MGMT_P_RI1Nip,...
    Cdc250_MGMT_M_TMZalone,Cdc250_MGMT_M_Nip,Cdc250_MGMT_M_RI1,Cdc250_MGMT_M_RI1Nip,...
    Cdc250_MGMT_P_TMZalone,Cdc250_MGMT_P_Nip,Cdc250_MGMT_P_RI1,Cdc250_MGMT_P_RI1Nip,...
    p530_MGMT_M_TMZalone,p530_MGMT_M_Nip,p530_MGMT_M_RI1,p530_MGMT_M_RI1Nip,...
    p530_MGMT_P_TMZalone,p530_MGMT_P_Nip,p530_MGMT_P_RI1,p530_MGMT_P_RI1Nip,...
    p53_ser460_MGMT_M_TMZalone,p53_ser460_MGMT_M_Nip,p53_ser460_MGMT_M_RI1,p53_ser460_MGMT_M_RI1Nip,...
    p53_ser460_MGMT_P_TMZalone,p53_ser460_MGMT_P_Nip,p53_ser460_MGMT_P_RI1,p53_ser460_MGMT_P_RI1Nip);

%% PK-PD Model
[tm_cell,um_cell] = simulations_PKPD(...
    t_Verre_surv,...
    int_cond_mat,RNA_MGMT0,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
    k_addO,kd_MGMT,k_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_addEx,k_addN,k_DSBO,k_DSBN,k_CyA,K_cc,n_cc,k_ATR,K_add,n_add,kd_ATR,kd_pATR,...
    k_Chk1,kd_Chk1,kd_pChk1,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kt_Mdm2,kt_Mdm2p53,K_p53,n_p53,kf_Mdm2,kd_Mdm2,...
    kf_MGMT_M,kf_MGMT_P,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,...
    kf_Chk1_MGMT_M,kf_Chk1_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    kd_ser46_MGMT_M,kd_ser46_MGMT_P,...
    ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,...
    k_BER_TMZalone,k_HR_TMZalone,...
    k_BER_Nip,k_HR_Nip,...
    k_BER_RI1,k_HR_RI1,...
    k_BER_RI1Nip,k_HR_RI1Nip);

%% Cell population 
[TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P,...
    TMZNip_surv_curvm_MGMT_M,TMZNip_surv_curvm_MGMT_P,...
    TMZRI1_surv_curvm_MGMT_M,TMZRI1_surv_curvm_MGMT_P,...
    TMZRI1Nip_surv_curvm_MGMT_M,TMZRI1Nip_surv_curvm_MGMT_P,...
    tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,...
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    numb_comptime1,...
    cell_pop_norm0_Verre_MGMT_M,cell_pop_norm0_Verre_MGMT_P);

%% Cost Function
[cost_surv_Verre_TMZalone_MGMT_M,cost_surv_Verre_TMZalone_MGMT_P,...
    cost_surv_Verre_TMZNip_MGMT_M,cost_surv_Verre_TMZNip_MGMT_P,...
    cost_surv_Verre_TMZRI1_MGMT_M,cost_surv_Verre_TMZRI1_MGMT_P,...
    cost_surv_Verre_TMZRI1Nip_MGMT_M,cost_surv_Verre_TMZRI1Nip_MGMT_P,...
    cost]=cost_function(...
    surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...%data
    surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    surv_mean_Verre_TMZNip_MGMT_M,surv_stddev_Verre_TMZNip_MGMT_M,...
    surv_mean_Verre_TMZNip_MGMT_P,surv_stddev_Verre_TMZNip_MGMT_P,...
    surv_mean_Verre_TMZRI1_MGMT_M,surv_stddev_Verre_TMZRI1_MGMT_M,...
    surv_mean_Verre_TMZRI1_MGMT_P,surv_stddev_Verre_TMZRI1_MGMT_P,...
    surv_mean_Verre_TMZRI1Nip_MGMT_M,surv_stddev_Verre_TMZRI1Nip_MGMT_M,...
    surv_mean_Verre_TMZRI1Nip_MGMT_P,surv_stddev_Verre_TMZRI1Nip_MGMT_P,...
    TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P,...%simulations
    TMZNip_surv_curvm_MGMT_M,TMZNip_surv_curvm_MGMT_P,...
    TMZRI1_surv_curvm_MGMT_M,TMZRI1_surv_curvm_MGMT_P,...
    TMZRI1Nip_surv_curvm_MGMT_M,TMZRI1Nip_surv_curvm_MGMT_P...
    );
end
 



