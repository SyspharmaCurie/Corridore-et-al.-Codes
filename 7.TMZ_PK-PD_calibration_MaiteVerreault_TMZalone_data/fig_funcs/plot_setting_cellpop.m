function plot_setting_cellpop(numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,...simulations
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...TMZ
    n_p53int,upAsy,sness,tED50,...parameters
    pop_model_TMZalone_survcurv_fig,pop_model_TMZalone_survcurv_fignumb...plot control
    )


global sn_Verre_TMZalone_0TMZ_MGMT_M sn_Verre_TMZalone_5TMZ_MGMT_M sn_Verre_TMZalone_25TMZ_MGMT_M sn_Verre_TMZalone_50TMZ_MGMT_M sn_Verre_TMZalone_100TMZ_MGMT_M sn_Verre_TMZalone_200TMZ_MGMT_M sn_Verre_TMZalone_400TMZ_MGMT_M sn_Verre_TMZalone_800TMZ_MGMT_M sn_Verre_TMZalone_1000TMZ_MGMT_M...
    sn_Verre_TMZalone_0TMZ_MGMT_P sn_Verre_TMZalone_5TMZ_MGMT_P sn_Verre_TMZalone_25TMZ_MGMT_P sn_Verre_TMZalone_50TMZ_MGMT_P sn_Verre_TMZalone_100TMZ_MGMT_P sn_Verre_TMZalone_200TMZ_MGMT_P sn_Verre_TMZalone_400TMZ_MGMT_P sn_Verre_TMZalone_800TMZ_MGMT_P sn_Verre_TMZalone_1000TMZ_MGMT_P...
    sim_number

  
%% Maite Verreault Simulations Cell TMZ survival (TMZ alone) 
if pop_model_TMZalone_survcurv_fig==1
    figure(pop_model_TMZalone_survcurv_fignumb)
    clf
    for index=1:sn_Verre_TMZalone_1000TMZ_MGMT_M-sn_Verre_TMZalone_0TMZ_MGMT_M+1
        plot_cell_pop(144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,sn_Verre_TMZalone_0TMZ_MGMT_M+index-1,TMZout0_surv_Verre_MGMT_M(index),'m',0,pop_model_TMZalone_survcurv_fignumb)
    end

    for index=1:sn_Verre_TMZalone_1000TMZ_MGMT_P-sn_Verre_TMZalone_0TMZ_MGMT_P+1
        plot_cell_pop(144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,sn_Verre_TMZalone_0TMZ_MGMT_P+index-1,TMZout0_surv_Verre_MGMT_P(index),'p',0,pop_model_TMZalone_survcurv_fignumb)
    end
end





end

