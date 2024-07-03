function plot_setting_viab(TMZout0_surv,surv_curvm,...simulations
    MGMT,survcurv_figcon,survcurv_fignumb,orig...figure control
    )

%% Cell TMZ-survival curves

surv_time_Jack=144;

plot_viab(survcurv_figcon,survcurv_fignumb,...figure control
    TMZout0_surv,surv_curvm,surv_time_Jack,MGMT,orig,...simulations
    's')



end

