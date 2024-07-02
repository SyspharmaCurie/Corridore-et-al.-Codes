function [tm_cell,um_cell] = simulations_PKPD(...
    t_surv,...
    int_cond_mat,RNA_MGMT0,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
    k_addO,kf_MGMT,k_MGMT,kd_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_addEx,k_addN,k_BERInhib_Nip,k_DSBO,k_DSBN,k_HRInhib_RI1,k_CyA,K_cc,n_cc,k_ATR,K_add,n_add,kf_ATR,kd_ATR,kd_pATR,...
    k_Chk1,kf_Chk1,kd_Chk1,kd_pChk1,kf_cdc25,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kd_ser46,kt_Mdm2,ktd_Mdm2,kt_Mdm2p53,K_p53,n_p53,kf_Mdm2,kd_Mdm2)

global sn_surv_0TMZ_144h sn_surv_1TMZ_144h sn_surv_2TMZ_144h sn_surv_4TMZ_144h sn_surv_8TMZ_144h sn_surv_16TMZ_144h sn_surv_32TMZ_144h ...
    sn_surv_64TMZ_144h sn_surv_128TMZ_144h sn_surv_256TMZ_144h sn_surv_512TMZ_144h sn_surv_1024TMZ_144h sn_surv_3000TMZ_144h...
    sim_number

tm_cell=cell(1,sim_number);
um_cell=cell(1,sim_number);
%solver-> ode#15s ode#23tb

%% Cell TMZ-viability
for index=sn_surv_0TMZ_144h:sn_surv_3000TMZ_144h
    [tm_cell{index},um_cell{index}]=ode23tb(@TMZ_PK_PD_ODE,t_surv,int_cond_mat(:,index),[],...
        Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
        k_addO,kf_MGMT,RNA_MGMT0,kd_MGMT,k_MGMT,...
        omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
        k_GT,k_MMR,k_addEx,k_addN,k_BERInhib_Nip,k_DSBO,k_DSBN,k_HRInhib_RI1,k_CyA,K_cc,n_cc,kf_ATR,k_ATR,K_add,n_add,kd_ATR,kd_pATR,...
        kf_Chk1,k_Chk1,kd_Chk1,kd_pChk1,kf_cdc25,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
        kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kd_ser46,kt_Mdm2,kt_Mdm2p53,K_p53,n_p53,ktd_Mdm2,kf_Mdm2,kd_Mdm2);
end

end
