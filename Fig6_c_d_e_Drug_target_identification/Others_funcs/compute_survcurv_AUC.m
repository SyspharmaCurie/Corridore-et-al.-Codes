function [tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,surv_curvm_MGMT_M,surv_curvm_MGMT_P,AUC_surv_curvm_MGMT_M,AUC_surv_curvm_MGMT_P,IC50_MGMT_M,IC50_MGMT_P] = compute_survcurv_AUC(TMZout0_surv,inhib_factor,DMSO_pop_MGMT_M,DMSO_pop_MGMT_P)

[tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,surv_curvm_MGMT_M,surv_curvm_MGMT_P]=Calib_TMZ_PK_PD_V28_2ndstep_p53_IC50_0(TMZout0_surv,inhib_factor,DMSO_pop_MGMT_M,DMSO_pop_MGMT_P);

%% AUC survival curves
AUC_surv_curvm_MGMT_M=trapz(TMZout0_surv,surv_curvm_MGMT_M);
AUC_surv_curvm_MGMT_P=trapz(TMZout0_surv,surv_curvm_MGMT_P);

%% IC50
[IC50_MGMT_M,IC50_MGMT_P] = compute_IC50(TMZout0_surv,surv_curvm_MGMT_M,surv_curvm_MGMT_P);

end

