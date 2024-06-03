function [dataset_MGMT_M,dataset_MGMT_P] = def_distr(patient_num,vin_cop_MGMT_M_params,vin_cop_MGMT_P_params,...
    pT,pT_var,pT2,pT2_var,MGMT0_U87_LN229,k_BER,k_BER_var,k_MMR,k_MMR_var,k_HR,k_HR_var,kf_ATR_MGMT_M,kf_ATR_MGMT_M_var,...
    kf_Chk1_MGMT_M,kf_Chk1_MGMT_M_var,Cdc250,Cdc250_var,kf_Mdm2,kf_Mdm2_var)

%% MGMT- (order of appearance TableS1 (Table of parameters))
pT_distr_MGMT_M=pat_log_norm_dist(pT,pT_var,patient_num);
pT2_distr_MGMT_M=pat_log_norm_dist(pT2,pT2_var,patient_num);
k_addO_distr_MGMT_M=vin_cop_MGMT_M_params(:,3);
k_addN_distr_MGMT_M=vin_cop_MGMT_M_params(:,4);
k_CyA_distr_MGMT_M=vin_cop_MGMT_M_params(:,7);
K_cdc25_distr_MGMT_M=vin_cop_MGMT_M_params(:,16);
MGMT0_distr_MGMT_M=MGMT0_U87_LN229*ones(patient_num,1);
k_BER_distr_MGMT_M=pat_log_norm_dist(k_BER,k_BER_var,patient_num);%The inhibition of k_BER inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
k_MMR_distr_MGMT_M=pat_log_norm_dist(k_MMR,k_MMR_var,patient_num);
k_DSBO_distr_MGMT_M=vin_cop_MGMT_M_params(:,5);
k_DSBN_distr_MGMT_M=vin_cop_MGMT_M_params(:,6);
k_HR_distr_MGMT_M=pat_log_norm_dist(k_HR,k_HR_var,patient_num);%The inhibition of k_HR inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
kf_ATR_distr_MGMT_M=pat_log_norm_dist(kf_ATR_MGMT_M,kf_ATR_MGMT_M_var,patient_num);%kf_ATR_MGMT_M*ones(patient_num,1);
k_ATR_distr_MGMT_M=vin_cop_MGMT_M_params(:,9);
K_add_distr_MGMT_M=vin_cop_MGMT_M_params(:,10);
kf_Chk1_distr_MGMT_M=pat_log_norm_dist(kf_Chk1_MGMT_M,kf_Chk1_MGMT_M_var,patient_num);
% C_Chk1_distr_MGMT_M=ones(patient_num,1);
k_Chk1_distr_MGMT_M=vin_cop_MGMT_M_params(:,12);
kd_pChk1_distr_MGMT_M=vin_cop_MGMT_M_params(:,14);
Cdc250_distr_MGMT_M=pat_log_norm_dist(Cdc250,Cdc250_var,patient_num);
k_cdc25_distr_MGMT_M=vin_cop_MGMT_M_params(:,15);
kf_p53_distr_MGMT_M=vin_cop_MGMT_M_params(:,17);
k_p53_distr_MGMT_M=vin_cop_MGMT_M_params(:,18);
kf_Mdm2_distr_MGMT_M=pat_log_norm_dist(kf_Mdm2,kf_Mdm2_var,patient_num);
K_p53_distr_MGMT_M=vin_cop_MGMT_M_params(:,21);
k_apop_distr_MGMT_M=vin_cop_MGMT_M_params(:,24);
upAsy_distr_MGMT_M=vin_cop_MGMT_M_params(:,22);
tED50_distr_MGMT_M=vin_cop_MGMT_M_params(:,25);
sness_distr_MGMT_M=vin_cop_MGMT_M_params(:,23);

dataset_MGMT_M=[pT_distr_MGMT_M,pT2_distr_MGMT_M,k_addO_distr_MGMT_M,k_addN_distr_MGMT_M,...
    k_CyA_distr_MGMT_M,K_cdc25_distr_MGMT_M,MGMT0_distr_MGMT_M,...
    k_BER_distr_MGMT_M,k_MMR_distr_MGMT_M,k_DSBO_distr_MGMT_M,k_DSBN_distr_MGMT_M,k_HR_distr_MGMT_M,...
    kf_ATR_distr_MGMT_M,k_ATR_distr_MGMT_M,K_add_distr_MGMT_M,kf_Chk1_distr_MGMT_M,k_Chk1_distr_MGMT_M,kd_pChk1_distr_MGMT_M,...
    Cdc250_distr_MGMT_M,k_cdc25_distr_MGMT_M,...
    kf_p53_distr_MGMT_M,k_p53_distr_MGMT_M,kf_Mdm2_distr_MGMT_M,K_p53_distr_MGMT_M,...
    k_apop_distr_MGMT_M,upAsy_distr_MGMT_M,tED50_distr_MGMT_M,sness_distr_MGMT_M];

%% MGMT+
pT_distr_MGMT_P=pat_log_norm_dist(pT,pT_var,patient_num);
pT2_distr_MGMT_P=pat_log_norm_dist(pT2,pT2_var,patient_num);
k_addO_distr_MGMT_P=vin_cop_MGMT_P_params(:,3);
k_addN_distr_MGMT_P=vin_cop_MGMT_P_params(:,4);
k_CyA_distr_MGMT_P=vin_cop_MGMT_P_params(:,7);
K_cdc25_distr_MGMT_P=vin_cop_MGMT_P_params(:,16);
MGMT0_distr_MGMT_P=vin_cop_MGMT_P_params(:,1);
k_BER_distr_MGMT_P=pat_log_norm_dist(k_BER,k_BER_var,patient_num);%The inhibition of k_BER inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
k_MMR_distr_MGMT_P=pat_log_norm_dist(k_MMR,k_MMR_var,patient_num);
k_DSBO_distr_MGMT_P=vin_cop_MGMT_P_params(:,5);
k_DSBN_distr_MGMT_P=vin_cop_MGMT_P_params(:,6);
k_HR_distr_MGMT_P=pat_log_norm_dist(k_HR,k_HR_var,patient_num);%The inhibition of k_BER inside the function TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0
kf_ATR_distr_MGMT_P=vin_cop_MGMT_P_params(:,8);
k_ATR_distr_MGMT_P=vin_cop_MGMT_P_params(:,9);
K_add_distr_MGMT_P=vin_cop_MGMT_P_params(:,10);
C_Chk1_distr_MGMT_P=vin_cop_MGMT_P_params(:,13);
kf_Chk1_distr_MGMT_P=kf_Chk1_MGMT_M*C_Chk1_distr_MGMT_P;
k_Chk1_distr_MGMT_P=vin_cop_MGMT_P_params(:,12);
kd_pChk1_distr_MGMT_P=vin_cop_MGMT_P_params(:,14);
Cdc250_distr_MGMT_P=pat_log_norm_dist(Cdc250,Cdc250_var,patient_num);
k_cdc25_distr_MGMT_P=vin_cop_MGMT_P_params(:,15);
kf_p53_distr_MGMT_P=vin_cop_MGMT_P_params(:,17);
k_p53_distr_MGMT_P=vin_cop_MGMT_P_params(:,18);
kf_Mdm2_distr_MGMT_P=pat_log_norm_dist(kf_Mdm2,kf_Mdm2_var,patient_num);
K_p53_distr_MGMT_P=vin_cop_MGMT_P_params(:,21);
k_apop_distr_MGMT_P=vin_cop_MGMT_P_params(:,24);
upAsy_distr_MGMT_P=vin_cop_MGMT_P_params(:,22);
tED50_distr_MGMT_P=vin_cop_MGMT_P_params(:,25);
sness_distr_MGMT_P=vin_cop_MGMT_P_params(:,23);

% k_MGMT_vec= comp_lin_regr_MGMT_P0_k_MGMT(MGMT0_distr_MGMT_P);
% kd_pATR = comp_lin_regr_K_add_kd_pATR(K_add_distr_MGMT_P);
% kp_ser46 = comp_lin_regr_k_ATR_kp_ser46(k_ATR_distr_MGMT_P);
% min(k_MGMT_vec)
% min(kd_pATR)
% min(kp_ser46)

dataset_MGMT_P=[pT_distr_MGMT_P,pT2_distr_MGMT_P,k_addO_distr_MGMT_P,k_addN_distr_MGMT_P,...
    k_CyA_distr_MGMT_P,K_cdc25_distr_MGMT_P,MGMT0_distr_MGMT_P,...
    k_BER_distr_MGMT_P,k_MMR_distr_MGMT_P,k_DSBO_distr_MGMT_P,k_DSBN_distr_MGMT_P,k_HR_distr_MGMT_P,...
    kf_ATR_distr_MGMT_P,k_ATR_distr_MGMT_P,K_add_distr_MGMT_P,kf_Chk1_distr_MGMT_P,k_Chk1_distr_MGMT_P,kd_pChk1_distr_MGMT_P,...
    Cdc250_distr_MGMT_P,k_cdc25_distr_MGMT_P,...
    kf_p53_distr_MGMT_P,k_p53_distr_MGMT_P,kf_Mdm2_distr_MGMT_P,K_p53_distr_MGMT_P,...
    k_apop_distr_MGMT_P,upAsy_distr_MGMT_P,tED50_distr_MGMT_P,sness_distr_MGMT_P];

end

