function  plot_AUCHist_treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_treat,survcurv_AUC_vec_MGMT_P_treat,survcurv_AUC_vec_allpat_treat,...
    hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb,trat_name)

%% Histogram survival curves absolute difference treatment and TMZ alone
plot_AUCHist_MGMTtogether((survcurv_AUC_vec_MGMT_M_TMZalone-survcurv_AUC_vec_MGMT_M_treat),(survcurv_AUC_vec_MGMT_P_TMZalone-survcurv_AUC_vec_MGMT_P_treat),(survcurv_AUC_vec_allpat_TMZalone-survcurv_AUC_vec_allpat_treat),'A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+9,strcat(trat_name,'absolute diff.'))

end

