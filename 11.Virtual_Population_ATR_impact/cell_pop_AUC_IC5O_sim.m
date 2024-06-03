function cell_pop_AUC_IC5O_sim(patient_num,dataset,MGMT,Results_dir,...
    inhib_factor_BER_Nip,inhib_factor_HR_RI1)

survcurv_AUC_vec=zeros(patient_num,1);

surv_curvm_mat=zeros(13,patient_num);
parfor patient_indx=1:patient_num
    if ~mod(patient_indx,1000)
        disp(strcat('patient_indx: ',string(patient_indx)))
    end
    patX_param=dataset(patient_indx,:);

    %% population simulation
    [TMZout0_surv,surv_curvm] = TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0(patX_param,inhib_factor_BER_Nip,inhib_factor_HR_RI1);
    surv_curvm_mat(:,patient_indx)=surv_curvm;
    %% AUC and IC50
    survcurv_AUC_vec(patient_indx) = compute_survcurv_AUC(TMZout0_surv,surv_curvm);
end

if MGMT=='m'
    fMGMT='M';
elseif MGMT=='p'
    fMGMT='P';
end


VariableNames_dataset={'pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_MGMT','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','K_ATR','kp_ser46','kf_Mdm2','K_p53','k_apop','upAsy','tED50','sness'};
dataset_tab=array2table(dataset,'VariableNames',VariableNames_dataset);
writetable(dataset_tab,strcat(Results_dir,'/dataset_MGMT_',fMGMT,'.csv'));

surv_curvm_tab=array2table(surv_curvm_mat);
writetable(surv_curvm_tab,strcat(Results_dir,'/surv_curvm_mat_MGMT_',fMGMT,'.csv'));

survcurv_AUC_tab=array2table(survcurv_AUC_vec,'VariableNames',{'surv curv AUC'});
writetable(survcurv_AUC_tab,strcat(Results_dir,'/survcurv_AUC_vec_MGMT_',fMGMT,'.csv'));

end

