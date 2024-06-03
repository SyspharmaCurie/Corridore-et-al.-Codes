function  plot_AUCHist_treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_treat,survcurv_AUC_vec_MGMT_P_treat,survcurv_AUC_vec_allpat_treat,...
    hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb,trat_name)

%% Histogram survival curves
plot_AUCHist(survcurv_AUC_vec_MGMT_M_treat,survcurv_AUC_orig_MGMT_M_TMZalone,'m','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb,trat_name)
plot_AUCHist(survcurv_AUC_vec_MGMT_P_treat,survcurv_AUC_orig_MGMT_P_TMZalone,'p','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+1,trat_name)
plot_AUCHist(survcurv_AUC_vec_allpat_treat,survcurv_AUC_orig_MGMT_M_TMZalone,'a','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+2,trat_name)

%% Histogram survival curves relative difference treatment and TMZ alone
plot_AUCHist((survcurv_AUC_vec_MGMT_M_TMZalone-survcurv_AUC_vec_MGMT_M_treat)./survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_M_TMZalone,'m','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+3,strcat(trat_name,'relative diff.'))
plot_AUCHist((survcurv_AUC_vec_MGMT_P_TMZalone-survcurv_AUC_vec_MGMT_P_treat)./survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,'p','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+4,strcat(trat_name,'relative diff.'))
plot_AUCHist((survcurv_AUC_vec_allpat_TMZalone-survcurv_AUC_vec_allpat_treat)./survcurv_AUC_vec_allpat_TMZalone,survcurv_AUC_orig_MGMT_M_TMZalone,'a','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+5,strcat(trat_name,'relative diff.'))

%% Histogram survival curves absolute difference treatment and TMZ alone
plot_AUCHist((survcurv_AUC_vec_MGMT_M_TMZalone-survcurv_AUC_vec_MGMT_M_treat),survcurv_AUC_orig_MGMT_M_TMZalone,'m','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+6,strcat(trat_name,'relative diff.'))
plot_AUCHist((survcurv_AUC_vec_MGMT_P_TMZalone-survcurv_AUC_vec_MGMT_P_treat),survcurv_AUC_orig_MGMT_P_TMZalone,'p','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+7,strcat(trat_name,'relative diff.'))
plot_AUCHist((survcurv_AUC_vec_allpat_TMZalone-survcurv_AUC_vec_allpat_treat),survcurv_AUC_orig_MGMT_M_TMZalone,'a','A',hist_survcurv_AUC_treat_figcon,hist_survcurv_AUC_treat_fignumb+8,strcat(trat_name,'relative diff.'))


end

