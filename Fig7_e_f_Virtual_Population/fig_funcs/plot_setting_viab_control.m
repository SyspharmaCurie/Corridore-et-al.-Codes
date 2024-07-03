function plot_setting_viab_control(TMZout0_surv,surv_curvm_orig_MGMT_M,surv_curvm_orig_MGMT_P,...
    patient_num,surv_curvm_mat_MGMT_M,surv_curvm_mat_MGMT_P,...
    plot_surv_figcon,plot_surv_fignumb)

    if plot_surv_figcon==1
        figure(plot_surv_fignumb)
        clf
    end
    plot_setting_viab(TMZout0_surv,surv_curvm_orig_MGMT_M,...simulations
        'm',plot_surv_figcon,plot_surv_fignumb,1 ...figure control
        )

    plot_setting_viab(TMZout0_surv,surv_curvm_orig_MGMT_P,...simulations
        'p',plot_surv_figcon,plot_surv_fignumb,1 ...figure control
        )

    for patient_indx=1:patient_num
        plot_setting_viab(TMZout0_surv,surv_curvm_mat_MGMT_M(:,patient_indx),...simulations
            'm',plot_surv_figcon,plot_surv_fignumb,0 ...figure control
            )
        plot_setting_viab(TMZout0_surv,surv_curvm_mat_MGMT_P(:,patient_indx),...simulations
            'p',plot_surv_figcon,plot_surv_fignumb,0 ...figure control
            )
    end
end

