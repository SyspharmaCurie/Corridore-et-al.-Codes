function [surv_curvm,tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(qqq,patient_indx,tm_cell,um_cell,TMZout0_surv,cell_pop0,cell_pop_norm0,k_apop,n_p53int,upAsy,sness,tED50,numb_comptime1)

global sn_surv_0TMZ_144h sn_surv_1TMZ_144h sn_surv_2TMZ_144h sn_surv_4TMZ_144h sn_surv_8TMZ_144h sn_surv_16TMZ_144h sn_surv_32TMZ_144h ...
    sn_surv_64TMZ_144h sn_surv_128TMZ_144h sn_surv_256TMZ_144h sn_surv_512TMZ_144h sn_surv_1024TMZ_144h sn_surv_3000TMZ_144h...
    sim_number

tcellpopm_cell=cell(1,sim_number);
cellpopm_cell=cell(1,sim_number);

surv_curvm=zeros(size(TMZout0_surv));

[DMSO_t_vec,DMSO_p53_vec]=cell_pop_p53vec(qqq,patient_indx,144,numb_comptime1,tm_cell{sn_surv_0TMZ_144h},um_cell{sn_surv_0TMZ_144h});

[tDMSO_pop,DMSO_pop]=ode23tb(@cell_pop_eq,DMSO_t_vec,cell_pop0,[],DMSO_t_vec,DMSO_p53_vec,k_apop,n_p53int,upAsy,sness,tED50);

for index=sn_surv_0TMZ_144h:sn_surv_3000TMZ_144h
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(qqq,patient_indx,144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0,DMSO_pop,index);
    surv_curvm(index-sn_surv_0TMZ_144h+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end


end