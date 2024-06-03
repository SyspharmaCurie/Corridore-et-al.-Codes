function plot_setting_cellpop(numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,...simulations
    TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,TMZout0_He_ld,TMZout0_He_hd,...TMZ
    n_p53int,upAsy,sness,tED50,...parameters
    Jack_pop_model_fig,Jack_pop_model_fignumb,...plot control
    He_pop_model_fig,He_pop_model_fignumb...
    )


global sn_Jack_MGMT_M sn_Jack_MGMT_P...
    sn_Jack_inhATR_TMZVXcon_MGMT_M sn_Jack_inhATR_VXcon_MGMT_M sn_Jack_inhATR8VX_MGMT_M sn_Jack_inhATR40VX_MGMT_M sn_Jack_inhATR200VX_MGMT_M sn_Jack_inhATR1000VX_MGMT_M ...
    sn_Jack_inhATR_TMZVXcon_MGMT_P sn_Jack_inhATR_VXcon_MGMT_P sn_Jack_inhATR8VX_MGMT_P sn_Jack_inhATR40VX_MGMT_P sn_Jack_inhATR200VX_MGMT_P sn_Jack_inhATR1000VX_MGMT_P ...
    sn_Aas ...
    sn_He_0TMZ_MGMT_M_144h sn_He_1TMZ_MGMT_M_144h sn_He_2TMZ_MGMT_M_144h sn_He_3TMZ_MGMT_M_144h sn_He_4TMZ_MGMT_M_144h sn_He_5TMZ_MGMT_M_144h sn_He_10TMZ_MGMT_M_144h sn_He_15TMZ_MGMT_M_144h sn_He_20TMZ_MGMT_M_144h ...
    sn_He_12_5TMZ_MGMT_M_144h sn_He_25TMZ_MGMT_M_144h sn_He_50TMZ_MGMT_M_144h sn_He_75TMZ_MGMT_M_144h sn_He_100TMZ_MGMT_M_144h sn_He_125TMZ_MGMT_M_144h ...
    sn_He_0TMZ_MGMT_P_144h sn_He_1TMZ_MGMT_P_144h sn_He_2TMZ_MGMT_P_144h sn_He_3TMZ_MGMT_P_144h sn_He_4TMZ_MGMT_P_144h sn_He_5TMZ_MGMT_P_144h sn_He_10TMZ_MGMT_P_144h sn_He_15TMZ_MGMT_P_144h sn_He_20TMZ_MGMT_P_144h ...
    sn_He_12_5TMZ_MGMT_P_144h sn_He_25TMZ_MGMT_P_144h sn_He_50TMZ_MGMT_P_144h sn_He_75TMZ_MGMT_P_144h sn_He_100TMZ_MGMT_P_144h sn_He_125TMZ_MGMT_P_144h ...
    sn_Ka_20TMZ_MGMT_M sn_Ka_50TMZ_MGMT_M sn_Ka_75TMZ_MGMT_M sn_Ka_XTMZ_MGMT_M...
    sn_Ka_20TMZ_MGMT_P sn_Ka_50TMZ_MGMT_P sn_Ka_100TMZ_MGMT_P sn_Ka_XTMZ_MGMT_P...
    sn_surv_0TMZ_MGMT_M_144h sn_surv_1TMZ_MGMT_M_144h sn_surv_2TMZ_MGMT_M_144h sn_surv_4TMZ_MGMT_M_144h sn_surv_8TMZ_MGMT_M_144h sn_surv_16TMZ_MGMT_M_144h sn_surv_32TMZ_MGMT_M_144h ...
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h...
    sim_number

  
%% Jackson 
if Jack_pop_model_fig==1
    figure(Jack_pop_model_fignumb)
    clf
    for index=1:sn_surv_1024TMZ_MGMT_M_144h-sn_surv_0TMZ_MGMT_M_144h+1
        plot_cell_pop(144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,sn_surv_0TMZ_MGMT_M_144h+index-1,TMZout0_surv_Jack_MGMT_M(index),'m',0,Jack_pop_model_fignumb)
    end

    for index=1:sn_surv_1024TMZ_MGMT_P_144h-sn_surv_0TMZ_MGMT_P_144h+1
        plot_cell_pop(144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,sn_surv_0TMZ_MGMT_P_144h+index-1,TMZout0_surv_Jack_MGMT_P(index),'p',0,Jack_pop_model_fignumb)
    end
end

%% He

TMZout0_He=[TMZout0_He_ld TMZout0_He_hd];

%%% MGMT-
if He_pop_model_fig==1
    figure(He_pop_model_fignumb)
    clf
    for index=1:sn_He_125TMZ_MGMT_M_144h-sn_He_0TMZ_MGMT_M_144h+1
        plot_cell_pop(144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,sn_He_0TMZ_MGMT_M_144h+index-1,TMZout0_He(index),'m',0,He_pop_model_fignumb)
    end

    for index=1:sn_He_125TMZ_MGMT_P_144h-sn_He_0TMZ_MGMT_P_144h+1
        plot_cell_pop(144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,sn_He_0TMZ_MGMT_P_144h+index-1,TMZout0_He(index),'p',0,He_pop_model_fignumb)
    end
end




end

