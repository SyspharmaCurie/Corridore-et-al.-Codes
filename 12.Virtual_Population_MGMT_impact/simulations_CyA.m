function CyAm_cell = simulations_CyA(tm_cell,um_cell,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25)

global sn_surv_0TMZ_MGMT_M_144h sn_surv_1TMZ_MGMT_M_144h sn_surv_2TMZ_MGMT_M_144h sn_surv_4TMZ_MGMT_M_144h sn_surv_8TMZ_MGMT_M_144h sn_surv_16TMZ_MGMT_M_144h sn_surv_32TMZ_MGMT_M_144h ...
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h sn_surv_3000TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h sn_surv_3000TMZ_MGMT_P_144h...
    sim_number

CyAm_cell=cell(1,sim_number);
for indx=sn_surv_0TMZ_MGMT_M_144h:sn_surv_3000TMZ_MGMT_P_144h
    CyAm_cell{indx}= CyclinA_fun(tm_cell{indx},um_cell{indx}(:,18),t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
end

end

