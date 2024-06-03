function simualtions_PKPD_original(param,inhib_factor_BER_Nip,inhib_factor_HR_RI1,MGMT,plot_surv_fignumb,plot_surv_figcon,Results_dir)

%% PK-PD Model
[TMZout0_surv,surv_curvm] = TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0(0,param,inhib_factor_BER_Nip,inhib_factor_HR_RI1);

%% AUC and IC50
survcurv_AUC = compute_survcurv_AUC(TMZout0_surv,surv_curvm);

if MGMT=='m'
    fMGMT='M';
elseif MGMT=='p'
    fMGMT='P';
end

disp(strcat('AUC MGMT',fMGMT,': ',string(survcurv_AUC)))

%% Figure
if plot_surv_figcon==1
    plot_setting_viab(TMZout0_surv,surv_curvm,...simulations
                MGMT,1,plot_surv_fignumb,1 ...figure control
                )
end

%% Save results
survcurv_AUC_tab=array2table(survcurv_AUC,'VariableNames',{'surv curv AUC orig'});
writetable(survcurv_AUC_tab,strcat(Results_dir,'/survcurv_AUC_orig_MGMT_',fMGMT,'.csv'));

surv_curvm_tab=array2table(surv_curvm);
writetable(surv_curvm_tab,strcat(Results_dir,'/surv_curvm_orig_MGMT_',fMGMT,'.csv'));
end

