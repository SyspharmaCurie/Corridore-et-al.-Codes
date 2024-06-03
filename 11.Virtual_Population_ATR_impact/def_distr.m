function [dataset_MGMT_M,dataset_MGMT_P] = def_distr(patient_num,...
    pT,pT_var,pT2,pT2_var,k_addO,k_addO_var,k_addN,k_addN_var,k_CyA,k_CyA_var,K_cdc25,K_cdc25_var,...
    MGMT0_U87_LN229,MGMT_P0,MGMT_P0_var,k_MGMT,k_MGMT_var,k_BER,k_BER_var,k_MMR,k_MMR_var,k_DSBO,k_DSBO_var,k_DSBN,k_DSBN_var,...
    k_HR,k_HR_var,kf_ATR_MGMT_M,kf_ATR_MGMT_M_var,kf_ATR_MGMT_P,kf_ATR_MGMT_P_var,...
    k_ATR,k_ATR_var,K_add,K_add_var,kd_pATR,kd_pATR_var,kf_Chk1_MGMT_M,kf_Chk1_MGMT_M_var,C_Chk1,C_Chk1_var,k_Chk1,k_Chk1_var,kd_pChk1,kd_pChk1_var,...
    Cdc250,Cdc250_var,k_cdc25,k_cdc25_var,kf_p53,kf_p53_var,k_p53,k_p53_var,K_ATR,K_ATR_var,kp_ser46,kp_ser46_var,kf_Mdm2,kf_Mdm2_var,K_p53,K_p53_var,...
    k_apop,k_apop_var,upAsy,upAsy_var,tED50,tED50_var,sness,sness_var)

kf_ATR_mean=(kf_ATR_MGMT_M+kf_ATR_MGMT_P)/2;

%% MGMT- (order of appearance TableS1 (Table of parameters))
pT_distr_MGMT_M= pT*ones(patient_num,1); % pat_log_norm_dist(pT,pT_var,patient_num);
pT2_distr_MGMT_M= pT2*ones(patient_num,1); % pat_log_norm_dist(pT2,pT2_var,patient_num);
k_addO_distr_MGMT_M= k_addO*ones(patient_num,1); % pat_log_norm_dist(k_addO,k_addO_var,patient_num);
k_addN_distr_MGMT_M= k_addN*ones(patient_num,1); % pat_log_norm_dist(k_addN,k_addN_var,patient_num);
k_CyA_distr_MGMT_M= k_CyA*ones(patient_num,1); % pat_log_norm_dist(k_CyA,k_CyA_var,patient_num);
K_cdc25_distr_MGMT_M= K_cdc25*ones(patient_num,1); % pat_log_norm_dist(K_cdc25,K_cdc25_var,patient_num);
MGMT0_distr_MGMT_M= MGMT0_U87_LN229*ones(patient_num,1);
k_MGMT_distr_MGMT_M= k_MGMT*ones(patient_num,1); % pat_log_norm_dist(k_MGMT,k_MGMT_var,patient_num);
k_BER_distr_MGMT_M= k_BER*ones(patient_num,1); % pat_log_norm_dist(k_BER,k_BER_var,patient_num);%The inhibition of k_BER inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
k_MMR_distr_MGMT_M= k_MMR*ones(patient_num,1); % pat_log_norm_dist(k_MMR,k_MMR_var,patient_num);
k_DSBO_distr_MGMT_M= k_DSBO*ones(patient_num,1); % pat_log_norm_dist(k_DSBO,k_DSBO_var,patient_num);
k_DSBN_distr_MGMT_M= k_DSBN*ones(patient_num,1); % pat_log_norm_dist(k_DSBN,k_DSBN_var,patient_num);
k_HR_distr_MGMT_M= k_HR*ones(patient_num,1); % pat_log_norm_dist(k_HR,k_HR_var,patient_num);%The inhibition of k_HR inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
kf_ATR_distr_MGMT_M= linspace(0,5*kf_ATR_mean,patient_num)' ; unifrnd(0,5*kf_ATR_mean,patient_num,1); %kf_ATR_MGMT_M*ones(patient_num,1); % pat_log_norm_dist(kf_ATR_MGMT_M,kf_ATR_MGMT_M_var,patient_num);%kf_ATR_MGMT_M*ones(patient_num,1);
k_ATR_distr_MGMT_M= k_ATR*ones(patient_num,1); % pat_log_norm_dist(k_ATR,k_ATR_var,patient_num);
K_add_distr_MGMT_M=  K_add*ones(patient_num,1); %unifrnd(0,5*K_add,patient_num,1); %pat_log_norm_dist(K_add,K_add_var,patient_num); 
kd_pATR_distr_MGMT_M= kd_pATR*ones(patient_num,1); % pat_log_norm_dist(kd_pATR,kd_pATR_var,patient_num);%
kf_Chk1_distr_MGMT_M= kf_Chk1_MGMT_M*ones(patient_num,1); % pat_log_norm_dist(kf_Chk1_MGMT_M,kf_Chk1_MGMT_M_var,patient_num);
% C_Chk1_distr_MGMT_M=ones(patient_num,1);
k_Chk1_distr_MGMT_M= k_Chk1*ones(patient_num,1); % pat_log_norm_dist(k_Chk1,k_Chk1_var,patient_num);
kd_pChk1_distr_MGMT_M= kd_pChk1*ones(patient_num,1); % pat_log_norm_dist(kd_pChk1,kd_pChk1_var,patient_num);
Cdc250_distr_MGMT_M= Cdc250*ones(patient_num,1); % pat_log_norm_dist(Cdc250,Cdc250_var,patient_num);
k_cdc25_distr_MGMT_M= k_cdc25*ones(patient_num,1); % pat_log_norm_dist(k_cdc25,k_cdc25_var,patient_num);
kf_p53_distr_MGMT_M= kf_p53*ones(patient_num,1); % pat_log_norm_dist(kf_p53,kf_p53_var,patient_num);
k_p53_distr_MGMT_M= k_p53*ones(patient_num,1); % pat_log_norm_dist(k_p53,k_p53_var,patient_num);
K_ATR_distr_MGMT_M= K_ATR*ones(patient_num,1); % pat_log_norm_dist(K_ATR,K_ATR_var,patient_num);%
kp_ser46_distr_MGMT_M= kp_ser46*ones(patient_num,1); % pat_log_norm_dist(kp_ser46,kp_ser46_var,patient_num);%
kf_Mdm2_distr_MGMT_M= kf_Mdm2*ones(patient_num,1); % pat_log_norm_dist(kf_Mdm2,kf_Mdm2_var,patient_num);
K_p53_distr_MGMT_M= K_p53*ones(patient_num,1); % pat_log_norm_dist(K_p53,K_p53_var,patient_num);
k_apop_distr_MGMT_M= k_apop*ones(patient_num,1); % pat_log_norm_dist(k_apop,k_apop_var,patient_num);
upAsy_distr_MGMT_M= upAsy*ones(patient_num,1); % pat_log_norm_dist(upAsy,upAsy_var,patient_num);
tED50_distr_MGMT_M= tED50*ones(patient_num,1); % pat_log_norm_dist(tED50,tED50_var,patient_num);
sness_distr_MGMT_M= sness*ones(patient_num,1); % pat_log_norm_dist(sness,sness_var,patient_num);

dataset_MGMT_M=[pT_distr_MGMT_M,pT2_distr_MGMT_M,k_addO_distr_MGMT_M,k_addN_distr_MGMT_M,...
    k_CyA_distr_MGMT_M,K_cdc25_distr_MGMT_M,MGMT0_distr_MGMT_M,k_MGMT_distr_MGMT_M,...
    k_BER_distr_MGMT_M,k_MMR_distr_MGMT_M,k_DSBO_distr_MGMT_M,k_DSBN_distr_MGMT_M,k_HR_distr_MGMT_M,...
    kf_ATR_distr_MGMT_M,k_ATR_distr_MGMT_M,K_add_distr_MGMT_M,kd_pATR_distr_MGMT_M,kf_Chk1_distr_MGMT_M,k_Chk1_distr_MGMT_M,kd_pChk1_distr_MGMT_M,...
    Cdc250_distr_MGMT_M,k_cdc25_distr_MGMT_M,...
    kf_p53_distr_MGMT_M,k_p53_distr_MGMT_M,K_ATR_distr_MGMT_M,kp_ser46_distr_MGMT_M,kf_Mdm2_distr_MGMT_M,K_p53_distr_MGMT_M,...
    k_apop_distr_MGMT_M,upAsy_distr_MGMT_M,tED50_distr_MGMT_M,sness_distr_MGMT_M];

%% MGMT+
pT_distr_MGMT_P= pT*ones(patient_num,1); % pat_log_norm_dist(pT,pT_var,patient_num);
pT2_distr_MGMT_P= pT2*ones(patient_num,1); % pat_log_norm_dist(pT2,pT2_var,patient_num);
k_addO_distr_MGMT_P= k_addO*ones(patient_num,1); % pat_log_norm_dist(k_addO,k_addO_var,patient_num);
k_addN_distr_MGMT_P= k_addN*ones(patient_num,1); % pat_log_norm_dist(k_addN,k_addN_var,patient_num);
k_CyA_distr_MGMT_P= k_CyA*ones(patient_num,1); % pat_log_norm_dist(k_CyA,k_CyA_var,patient_num);
K_cdc25_distr_MGMT_P= K_cdc25*ones(patient_num,1); % pat_log_norm_dist(K_cdc25,K_cdc25_var,patient_num);
MGMT0_distr_MGMT_P= MGMT_P0*ones(patient_num,1); %unifrnd(0,5*MGMT_P0,patient_num,1); %MGMT_P0*ones(patient_num,1); % pat_log_norm_dist(MGMT_P0,MGMT_P0_var,patient_num);
k_MGMT_distr_MGMT_P= k_MGMT*ones(patient_num,1); % pat_log_norm_dist(k_MGMT,k_MGMT_var,patient_num);
k_BER_distr_MGMT_P= k_BER*ones(patient_num,1); % pat_log_norm_dist(k_BER,k_BER_var,patient_num);%The inhibition of k_BER inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
k_MMR_distr_MGMT_P= k_MMR*ones(patient_num,1); % pat_log_norm_dist(k_MMR,k_MMR_var,patient_num);
k_DSBO_distr_MGMT_P= k_DSBO*ones(patient_num,1); % pat_log_norm_dist(k_DSBO,k_DSBO_var,patient_num);
k_DSBN_distr_MGMT_P= k_DSBN*ones(patient_num,1); % pat_log_norm_dist(k_DSBN,k_DSBN_var,patient_num);
k_HR_distr_MGMT_P= k_HR*ones(patient_num,1); % pat_log_norm_dist(k_HR,k_HR_var,patient_num);%The inhibition of k_BER inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
kf_ATR_distr_MGMT_P=  kf_ATR_distr_MGMT_M;%unifrnd(0,5*kf_ATR_MGMT_P,patient_num,1); %kf_ATR_MGMT_P*ones(patient_num,1); % pat_log_norm_dist(kf_ATR_MGMT_P,kf_ATR_MGMT_P_var,patient_num);
k_ATR_distr_MGMT_P= k_ATR*ones(patient_num,1); % pat_log_norm_dist(k_ATR,k_ATR_var,patient_num);
K_add_distr_MGMT_P= K_add*ones(patient_num,1); %unifrnd(0,5*K_add,patient_num,1); %pat_log_norm_dist(K_add,K_add_var,patient_num); 
kd_pATR_distr_MGMT_P= kd_pATR*ones(patient_num,1); % pat_log_norm_dist(kd_pATR,kd_pATR_var,patient_num);%
C_Chk1_distr_MGMT_P= C_Chk1*ones(patient_num,1); % pat_log_norm_dist(C_Chk1,C_Chk1_var,patient_num);
kf_Chk1_distr_MGMT_P=kf_Chk1_MGMT_M*C_Chk1_distr_MGMT_P;
k_Chk1_distr_MGMT_P= k_Chk1*ones(patient_num,1); % pat_log_norm_dist(k_Chk1,k_Chk1_var,patient_num);
kd_pChk1_distr_MGMT_P= kd_pChk1*ones(patient_num,1); % pat_log_norm_dist(kd_pChk1,kd_pChk1_var,patient_num);
Cdc250_distr_MGMT_P= Cdc250*ones(patient_num,1); % pat_log_norm_dist(Cdc250,Cdc250_var,patient_num);
k_cdc25_distr_MGMT_P= k_cdc25*ones(patient_num,1); % pat_log_norm_dist(k_cdc25,k_cdc25_var,patient_num);
kf_p53_distr_MGMT_P= kf_p53*ones(patient_num,1); % pat_log_norm_dist(kf_p53,kf_p53_var,patient_num);
k_p53_distr_MGMT_P= k_p53*ones(patient_num,1); % pat_log_norm_dist(k_p53,k_p53_var,patient_num);
K_ATR_distr_MGMT_P= K_ATR*ones(patient_num,1); % pat_log_norm_dist(K_ATR,K_ATR_var,patient_num);%
kp_ser46_distr_MGMT_P= kp_ser46*ones(patient_num,1); % pat_log_norm_dist(kp_ser46,kp_ser46_var,patient_num);%
kf_Mdm2_distr_MGMT_P= kf_Mdm2*ones(patient_num,1); % pat_log_norm_dist(kf_Mdm2,kf_Mdm2_var,patient_num);
K_p53_distr_MGMT_P= K_p53*ones(patient_num,1); % pat_log_norm_dist(K_p53,K_p53_var,patient_num);
k_apop_distr_MGMT_P= k_apop*ones(patient_num,1); % pat_log_norm_dist(k_apop,k_apop_var,patient_num);
upAsy_distr_MGMT_P= upAsy*ones(patient_num,1); % pat_log_norm_dist(upAsy,upAsy_var,patient_num);
tED50_distr_MGMT_P= tED50*ones(patient_num,1); % pat_log_norm_dist(tED50,tED50_var,patient_num);
sness_distr_MGMT_P= sness*ones(patient_num,1); % pat_log_norm_dist(sness,sness_var,patient_num);


dataset_MGMT_P=[pT_distr_MGMT_P,pT2_distr_MGMT_P,k_addO_distr_MGMT_P,k_addN_distr_MGMT_P,...
    k_CyA_distr_MGMT_P,K_cdc25_distr_MGMT_P,MGMT0_distr_MGMT_P,k_MGMT_distr_MGMT_P,...
    k_BER_distr_MGMT_P,k_MMR_distr_MGMT_P,k_DSBO_distr_MGMT_P,k_DSBN_distr_MGMT_P,k_HR_distr_MGMT_P,...
    kf_ATR_distr_MGMT_P,k_ATR_distr_MGMT_P,K_add_distr_MGMT_P,kd_pATR_distr_MGMT_P,kf_Chk1_distr_MGMT_P,k_Chk1_distr_MGMT_P,kd_pChk1_distr_MGMT_P,...
    Cdc250_distr_MGMT_P,k_cdc25_distr_MGMT_P,...
    kf_p53_distr_MGMT_P,k_p53_distr_MGMT_P,K_ATR_distr_MGMT_P,kp_ser46_distr_MGMT_P,kf_Mdm2_distr_MGMT_P,K_p53_distr_MGMT_P,...
    k_apop_distr_MGMT_P,upAsy_distr_MGMT_P,tED50_distr_MGMT_P,sness_distr_MGMT_P];

end

