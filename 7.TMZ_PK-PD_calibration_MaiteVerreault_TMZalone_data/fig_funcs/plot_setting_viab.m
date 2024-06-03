function plot_setting_viab(TMZ_surv_Verre_TMZalone_MGMT_M,surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...data
    TMZ_surv_Verre_TMZalone_MGMT_P,surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    TMZout0_surv_Verre_MGMT_M,TMZalone_surv_curvm_MGMT_M,TMZout0_surv_Verre_MGMT_P,TMZalone_surv_curvm_MGMT_P,...simulations
    Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb...figure control
    )

%% Maite Verreault Simulations Cell TMZ survival (TMZ alone)
TMZalone_surv_curvm=[TMZalone_surv_curvm_MGMT_M' TMZalone_surv_curvm_MGMT_P'];
TMZout0_surv_Verre=[TMZout0_surv_Verre_MGMT_M TMZout0_surv_Verre_MGMT_P];

TMZdata_surv_Verre_TMZalone=[TMZ_surv_Verre_TMZalone_MGMT_M TMZ_surv_Verre_TMZalone_MGMT_P];
surv_mean_Verre_TMZalone=[surv_mean_Verre_TMZalone_MGMT_M surv_mean_Verre_TMZalone_MGMT_P];
surv_stddev_Verre_TMZalone=[surv_stddev_Verre_TMZalone_MGMT_M surv_stddev_Verre_TMZalone_MGMT_P];
surv_time_Verre=[144 144];

plot_viab(Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb,...figure control
    TMZout0_surv_Verre,TMZalone_surv_curvm,surv_time_Verre,'mp',...simulations
    's')
plot_viab_data(Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb,...figure control
    TMZdata_surv_Verre_TMZalone,surv_mean_Verre_TMZalone,surv_stddev_Verre_TMZalone,surv_time_Verre,'mp'...data
    )





end

