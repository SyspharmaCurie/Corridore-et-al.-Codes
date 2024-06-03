function CyAm_cell = simulations_CyA(tm_cell,um_cell,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25)


global sn_Verre_TMZalone_0TMZ_MGMT_M sn_Verre_TMZalone_5TMZ_MGMT_M sn_Verre_TMZalone_25TMZ_MGMT_M sn_Verre_TMZalone_50TMZ_MGMT_M sn_Verre_TMZalone_100TMZ_MGMT_M sn_Verre_TMZalone_200TMZ_MGMT_M sn_Verre_TMZalone_400TMZ_MGMT_M sn_Verre_TMZalone_800TMZ_MGMT_M sn_Verre_TMZalone_1000TMZ_MGMT_M...
    sn_Verre_TMZalone_0TMZ_MGMT_P sn_Verre_TMZalone_5TMZ_MGMT_P sn_Verre_TMZalone_25TMZ_MGMT_P sn_Verre_TMZalone_50TMZ_MGMT_P sn_Verre_TMZalone_100TMZ_MGMT_P sn_Verre_TMZalone_200TMZ_MGMT_P sn_Verre_TMZalone_400TMZ_MGMT_P sn_Verre_TMZalone_800TMZ_MGMT_P sn_Verre_TMZalone_1000TMZ_MGMT_P...
    sim_number

CyAm_cell=cell(1,sim_number);
for indx=sn_Verre_TMZalone_0TMZ_MGMT_M:sn_Verre_TMZalone_1000TMZ_MGMT_P
    CyAm_cell{indx}= CyclinA_fun(tm_cell{indx},um_cell{indx}(:,18),t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
end

end

