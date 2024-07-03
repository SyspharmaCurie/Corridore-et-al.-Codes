function [surv_curvm_MGMT_M,surv_curvm_MGMT_P,...
    tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,...
    TMZout0_surv,...
    numb_comptime1,...
    cell_pop_norm0_Jack_MGMT_M,cell_pop_norm0_Jack_MGMT_P,...
    DMSO_pop_MGMT_M,DMSO_pop_MGMT_P)

global sn_MGMT_M_vec sn_MGMT_P_vec...
       sim_num

tcellpopm_cell=cell(1,sim_num);
cellpopm_cell=cell(1,sim_num);

surv_curvm_MGMT_M=zeros(size(TMZout0_surv))';
surv_curvm_MGMT_P=zeros(size(TMZout0_surv))';

if TMZout0_surv(1)~=0
    disp_warning_TMZ0()
end

[DMSO_t_vec_MGMT_M,DMSO_p53_vec_MGMT_M]=cell_pop_p53vec(144,numb_comptime1,tm_cell{sn_MGMT_M_vec(1)},um_cell{sn_MGMT_M_vec(1)});
[DMSO_t_vec_MGMT_P,DMSO_p53_vec_MGMT_P]=cell_pop_p53vec(144,numb_comptime1,tm_cell{sn_MGMT_P_vec(1)},um_cell{sn_MGMT_P_vec(1)});

%% MGMT-
for index=1:length(sn_MGMT_M_vec)
    [tcellpopm_cell{sn_MGMT_M_vec(index)},cellpopm_cell{sn_MGMT_M_vec(index)}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Jack_MGMT_M,DMSO_pop_MGMT_M,sn_MGMT_M_vec(index));
    surv_curvm_MGMT_M(index)=cellpopm_cell{sn_MGMT_M_vec(index)}(end);
end

%% MGMT+
for index=1:length(sn_MGMT_P_vec)
    [tcellpopm_cell{sn_MGMT_P_vec(index)},cellpopm_cell{sn_MGMT_P_vec(index)}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Jack_MGMT_P,DMSO_pop_MGMT_P,sn_MGMT_P_vec(index));
    surv_curvm_MGMT_P(index)=cellpopm_cell{sn_MGMT_P_vec(index)}(end);
end

end