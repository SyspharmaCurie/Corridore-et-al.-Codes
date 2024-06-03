function [surv_curvm_AUC] = compute_survcurv_AUC(TMZout0_surv,surv_curvm)

%% AUC survival curves
surv_curvm_AUC=trapz(TMZout0_surv,surv_curvm);

end

