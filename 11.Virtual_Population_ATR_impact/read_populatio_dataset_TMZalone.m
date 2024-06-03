function [dataset_MGMT_M,dataset_MGMT_P,...
    surv_curvm_orig_MGMT_M,surv_curvm_orig_MGMT_P,surv_curvm_mat_MGMT_M,surv_curvm_mat_MGMT_P,...
    survcurv_AUC_orig_MGMT_M,survcurv_AUC_orig_MGMT_P,survcurv_AUC_vec_MGMT_M,survcurv_AUC_vec_MGMT_P,...
    survcurv_AUC_vec_allpat] = read_populatio_dataset_TMZalone(Results_data_dir)

    Results_dir=strcat('../TMZ_PK-PD_est_V29_virtpop_V6_TMZalone_V1/Results/',Results_data_dir);
    strcat(Results_dir,'/dataset_MGMT_M.csv')
    dataset_MGMT_M = csvread(strcat(Results_dir,'/dataset_MGMT_M.csv'),1,0);
    dataset_MGMT_P = csvread(strcat(Results_dir,'/dataset_MGMT_P.csv'),1,0);

    surv_curvm_orig_MGMT_M=csvread(strcat(Results_dir,'/surv_curvm_orig_MGMT_M.csv'),1,0);
    surv_curvm_orig_MGMT_P=csvread(strcat(Results_dir,'/surv_curvm_orig_MGMT_P.csv'),1,0);
    surv_curvm_mat_MGMT_M=csvread(strcat(Results_dir,'/surv_curvm_mat_MGMT_M.csv'),1,0);
    surv_curvm_mat_MGMT_P=csvread(strcat(Results_dir,'/surv_curvm_mat_MGMT_P.csv'),1,0);


    survcurv_AUC_orig_MGMT_M=csvread(strcat(Results_dir,'/survcurv_AUC_orig_MGMT_M.csv'),1,0);
    survcurv_AUC_orig_MGMT_P=csvread(strcat(Results_dir,'/survcurv_AUC_orig_MGMT_P.csv'),1,0);
    survcurv_AUC_vec_MGMT_M=csvread(strcat(Results_dir,'/survcurv_AUC_vec_MGMT_M.csv'),1,0);
    survcurv_AUC_vec_MGMT_P=csvread(strcat(Results_dir,'/survcurv_AUC_vec_MGMT_P.csv'),1,0);

    survcurv_AUC_vec_allpat=[survcurv_AUC_vec_MGMT_M;survcurv_AUC_vec_MGMT_P];

end

