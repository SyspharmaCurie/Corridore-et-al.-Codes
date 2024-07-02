function plot_setting_viab(TMZdata_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,...data
    TMZdata_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
    TMZdata_He_hd,apop_mean_He_hdTMZ_MGMT_M_72h,apop_stddev_He_hdTMZ_MGMT_M_72h,...
    apop_mean_He_hdTMZ_MGMT_M_96h,apop_stddev_He_hdTMZ_MGMT_M_96h,...
    apop_mean_He_hdTMZ_MGMT_M_120h,apop_stddev_He_hdTMZ_MGMT_M_120h,...
    apop_mean_He_hdTMZ_MGMT_M_144h,apop_stddev_He_hdTMZ_MGMT_M_144h,...
    apop_mean_He_hdTMZ_MGMT_P_72h,apop_stddev_He_hdTMZ_MGMT_P_72h,...
    apop_mean_He_hdTMZ_MGMT_P_96h,apop_stddev_He_hdTMZ_MGMT_P_96h,...
    apop_mean_He_hdTMZ_MGMT_P_120h,apop_stddev_He_hdTMZ_MGMT_P_120h,...
    apop_mean_He_hdTMZ_MGMT_P_144h,apop_stddev_He_hdTMZ_MGMT_P_144h,...
    TMZdata_He_ld,apop_mean_He_ldTMZ_MGMT_M_120h,apop_stddev_He_ldTMZ_MGMT_M_120h,...
    apop_mean_He_ldTMZ_MGMT_P_120h,apop_stddev_He_ldTMZ_MGMT_P_120h,...
    TMZout0_surv_Jack_MGMT_M,Jack_surv_curvm_MGMT_M,TMZout0_surv_Jack_MGMT_P,Jack_surv_curvm_MGMT_P,...simulations
    TMZout0_He_ld,He_ld_apop_curvm_MGMT_M_120h,TMZout0_He_hd,He_hd_apop_curvm_MGMT_M_72h,He_hd_apop_curvm_MGMT_M_96h,He_hd_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_144h,...
    He_ld_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_72h,He_hd_apop_curvm_MGMT_P_96h,He_hd_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_144h,...
    Jack_survcurv_figcon,Jack_survcurv_fignumb,...figure control
    He_ld_apopcurv_figcon,He_ld_apopcurv_fignumb,...
    He_hd_MGMT_M_apopcurv_figcon,He_hd_MGMT_M_apopcurv_fignumb,...
    He_hd_MGMT_P_apopcurv_figcon,He_hd_MGMT_P_apopcurv_fignumb...
    )

%% Jackson
Jack_surv_curvm=[Jack_surv_curvm_MGMT_M Jack_surv_curvm_MGMT_P];
TMZout0_surv_Jack=[TMZout0_surv_Jack_MGMT_M' TMZout0_surv_Jack_MGMT_P'];

TMZdata_surv_Jack=[TMZdata_surv_Jack_MGMT_M TMZdata_surv_Jack_MGMT_P];
surv_mean_Jack=[surv_mean_Jack_MGMT_M surv_mean_Jack_MGMT_P];
surv_stddev_Jack=[surv_stddev_Jack_MGMT_M surv_stddev_Jack_MGMT_P];
surv_time_Jack=[144 144];

plot_viab(Jack_survcurv_figcon,Jack_survcurv_fignumb,...figure control
    TMZout0_surv_Jack,Jack_surv_curvm,surv_time_Jack,'mp',...simulations
    's')
plot_viab_data(Jack_survcurv_figcon,Jack_survcurv_fignumb,...figure control
    TMZdata_surv_Jack,surv_mean_Jack,surv_stddev_Jack,surv_time_Jack,'mp'...data
    )

%% He
%low dosed
He_ld_apop_curvm_120h=[He_ld_apop_curvm_MGMT_M_120h He_ld_apop_curvm_MGMT_P_120h];
TMZout0_He_ld2=[TMZout0_He_ld' TMZout0_He_ld'];

apop_mean_He_ldTMZ_120h=[apop_mean_He_ldTMZ_MGMT_M_120h apop_mean_He_ldTMZ_MGMT_P_120h];
apop_stddev_He_ldTMZ_120h=[apop_stddev_He_ldTMZ_MGMT_M_120h apop_stddev_He_ldTMZ_MGMT_P_120h];
TMZdata_He_ld2=[TMZdata_He_ld TMZdata_He_ld];          
apop_time_He_ld=[120 120];


plot_viab(He_ld_apopcurv_figcon,He_ld_apopcurv_fignumb,...figure control
    TMZout0_He_ld2,He_ld_apop_curvm_120h,apop_time_He_ld,'mp',...simulations
    'a')
plot_viab_data(He_ld_apopcurv_figcon,He_ld_apopcurv_fignumb,...figure control
    TMZdata_He_ld2,apop_mean_He_ldTMZ_120h,apop_stddev_He_ldTMZ_120h,apop_time_He_ld,'mp'...data
    )

%high dosed
He_hd_apop_curvm_MGMT_M= [ He_hd_apop_curvm_MGMT_M_72h He_hd_apop_curvm_MGMT_M_96h He_hd_apop_curvm_MGMT_M_120h He_hd_apop_curvm_MGMT_M_144h];
He_hd_apop_curvm_MGMT_P= [ He_hd_apop_curvm_MGMT_P_72h He_hd_apop_curvm_MGMT_P_96h He_hd_apop_curvm_MGMT_P_120h He_hd_apop_curvm_MGMT_P_144h];
TMZout0_He_hd4=[TMZout0_He_hd' TMZout0_He_hd' TMZout0_He_hd' TMZout0_He_hd'];

apop_mean_He_hdTMZ_MGMT_M=[apop_mean_He_hdTMZ_MGMT_M_72h apop_mean_He_hdTMZ_MGMT_M_96h apop_mean_He_hdTMZ_MGMT_M_120h apop_mean_He_hdTMZ_MGMT_M_144h];
apop_stddev_He_hdTMZ_MGMT_M=[apop_stddev_He_hdTMZ_MGMT_M_72h apop_stddev_He_hdTMZ_MGMT_M_96h apop_stddev_He_hdTMZ_MGMT_M_120h apop_stddev_He_hdTMZ_MGMT_M_144h];
apop_mean_He_hdTMZ_MGMT_P=[apop_mean_He_hdTMZ_MGMT_P_72h apop_mean_He_hdTMZ_MGMT_P_96h apop_mean_He_hdTMZ_MGMT_P_120h apop_mean_He_hdTMZ_MGMT_P_144h];
apop_stddev_He_hdTMZ_MGMT_P=[apop_stddev_He_hdTMZ_MGMT_P_72h apop_stddev_He_hdTMZ_MGMT_P_96h apop_stddev_He_hdTMZ_MGMT_P_120h apop_stddev_He_hdTMZ_MGMT_P_144h];

TMZdata_He_h4=[TMZdata_He_hd TMZdata_He_hd TMZdata_He_hd TMZdata_He_hd];
apop_time_He_hd=[72 96 120 144];
%MGMT-
plot_viab(He_hd_MGMT_M_apopcurv_figcon,He_hd_MGMT_M_apopcurv_fignumb,...figure control
    TMZdata_He_h4,He_hd_apop_curvm_MGMT_M,apop_time_He_hd,'mmmm',...simulations
    'a')
plot_viab_data(He_hd_MGMT_M_apopcurv_figcon,He_hd_MGMT_M_apopcurv_fignumb,...figure control
    TMZdata_He_h4,apop_mean_He_hdTMZ_MGMT_M,apop_stddev_He_hdTMZ_MGMT_M,apop_time_He_hd,'mmmm'...data
    )
%MGMT+
plot_viab(He_hd_MGMT_P_apopcurv_figcon,He_hd_MGMT_P_apopcurv_fignumb,...figure control
    TMZdata_He_h4,He_hd_apop_curvm_MGMT_P,apop_time_He_hd,'pppp',...simulations
    'a')
plot_viab_data(He_hd_MGMT_P_apopcurv_figcon,He_hd_MGMT_P_apopcurv_fignumb,...figure control
    TMZdata_He_h4,apop_mean_He_hdTMZ_MGMT_P,apop_stddev_He_hdTMZ_MGMT_P,apop_time_He_hd,'pppp'...data
    )




end

