function [Jack_surv_curvm_MGMT_M,Jack_surv_curvm_MGMT_P,...
    He_ld_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_72h,He_hd_apop_curvm_MGMT_M_96h,He_hd_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_144h,...
    He_ld_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_72h,He_hd_apop_curvm_MGMT_P_96h,He_hd_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_144h,...
    tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,k_dis,...
    TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,TMZout0_He_ld,TMZout0_He_hd,...
    numb_comptime1,...
    cell_pop_norm0_Jack_MGMT_M,cell_pop_norm0_Jack_MGMT_P,cell_pop_norm0_He)

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
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h sn_surv_3000TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h sn_surv_3000TMZ_MGMT_P_144h...
    sim_number

tcellpopm_cell=cell(1,sim_number);
cellpopm_cell=cell(1,sim_number);
apop_cell=cell(1,sim_number);

Jack_surv_curvm_MGMT_M=zeros(size(TMZout0_surv_Jack_MGMT_M))';
Jack_surv_curvm_MGMT_P=zeros(size(TMZout0_surv_Jack_MGMT_P))';

He_apop_curvm_72h_MGMT_M=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_96h_MGMT_M=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_120h_MGMT_M=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_144h_MGMT_M=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_72h_MGMT_P=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_96h_MGMT_P=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_120h_MGMT_P=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';
He_apop_curvm_144h_MGMT_P=zeros(size([TMZout0_He_ld TMZout0_He_hd ]))';

[DMSO_t_vec_Jack_MGMT_M,DMSO_p53_vec_Jack_MGMT_M]=cell_pop_p53vec(144,numb_comptime1,tm_cell{sn_surv_0TMZ_MGMT_M_144h},um_cell{sn_surv_0TMZ_MGMT_M_144h});
[DMSO_t_vec_Jack_MGMT_P,DMSO_p53_vec_Jack_MGMT_P]=cell_pop_p53vec(144,numb_comptime1,tm_cell{sn_surv_0TMZ_MGMT_P_144h},um_cell{sn_surv_0TMZ_MGMT_P_144h});

[tDMSO_pop_Jack_MGMT_M,DMSO_pop_Jack_MGMT_M]=ode23tb(@cell_pop_eq,DMSO_t_vec_Jack_MGMT_M,cell_pop0,[],DMSO_t_vec_Jack_MGMT_M,DMSO_p53_vec_Jack_MGMT_M,k_apop,n_p53int,upAsy,sness,tED50);
[tDMSO_pop_Jack_MGMT_P,DMSO_pop_Jack_MGMT_P]=ode23tb(@cell_pop_eq,DMSO_t_vec_Jack_MGMT_P,cell_pop0,[],DMSO_t_vec_Jack_MGMT_P,DMSO_p53_vec_Jack_MGMT_P,k_apop,n_p53int,upAsy,sness,tED50);

DMSO_pop_He=ones(size(tm_cell{sn_He_0TMZ_MGMT_M_144h}));

%% Jackson  MGMT-
for index=sn_surv_0TMZ_MGMT_M_144h:sn_surv_3000TMZ_MGMT_M_144h
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Jack_MGMT_M,DMSO_pop_Jack_MGMT_M,index);
    Jack_surv_curvm_MGMT_M(index-sn_surv_0TMZ_MGMT_M_144h+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end

%% Jackson MGMT+
for index=sn_surv_0TMZ_MGMT_P_144h:sn_surv_3000TMZ_MGMT_P_144h
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Jack_MGMT_P,DMSO_pop_Jack_MGMT_P,index);
    Jack_surv_curvm_MGMT_P(index-sn_surv_0TMZ_MGMT_P_144h+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end

%% He
for index=sn_He_0TMZ_MGMT_M_144h:sn_He_125TMZ_MGMT_M_144h
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_He,DMSO_pop_He,index);
    
    [t_vec_He_MGMT_M,p53_vec_He_MGMT_M]=cell_pop_p53vec(144,numb_comptime1,tm_cell{index},um_cell{index});
    [t_apop,apop_cell{index}]=ode23tb(@apopt_eq,t_vec_He_MGMT_M,0,[],t_vec_He_MGMT_M,p53_vec_He_MGMT_M,cellpopm_cell{index},k_apop,n_p53int,upAsy,sness,tED50,k_dis);
    He_apop_curvm_72h_MGMT_M(index-sn_He_0TMZ_MGMT_M_144h+1)=apop_cell{index}(72*numb_comptime1+1);
    He_apop_curvm_96h_MGMT_M(index-sn_He_0TMZ_MGMT_M_144h+1)=apop_cell{index}(96*numb_comptime1+1);
    He_apop_curvm_120h_MGMT_M(index-sn_He_0TMZ_MGMT_M_144h+1)=apop_cell{index}(120*numb_comptime1+1);
    He_apop_curvm_144h_MGMT_M(index-sn_He_0TMZ_MGMT_M_144h+1)=apop_cell{index}(144*numb_comptime1+1);
end
for index=sn_He_0TMZ_MGMT_P_144h:sn_He_125TMZ_MGMT_P_144h
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_He,DMSO_pop_He,index);
    
    [t_vec_He_MGMT_P,p53_vec_He_MGMT_P]=cell_pop_p53vec(144,numb_comptime1,tm_cell{index},um_cell{index});
    [t_apop,apop_cell{index}]=ode23tb(@apopt_eq,t_vec_He_MGMT_P,0,[],t_vec_He_MGMT_P,p53_vec_He_MGMT_P,cellpopm_cell{index},k_apop,n_p53int,upAsy,sness,tED50,k_dis);
    He_apop_curvm_72h_MGMT_P(index-sn_He_0TMZ_MGMT_P_144h+1)=apop_cell{index}(72*numb_comptime1+1);
    He_apop_curvm_96h_MGMT_P(index-sn_He_0TMZ_MGMT_P_144h+1)=apop_cell{index}(96*numb_comptime1+1);
    He_apop_curvm_120h_MGMT_P(index-sn_He_0TMZ_MGMT_P_144h+1)=apop_cell{index}(120*numb_comptime1+1);
    He_apop_curvm_144h_MGMT_P(index-sn_He_0TMZ_MGMT_P_144h+1)=apop_cell{index}(144*numb_comptime1+1);
end
He_ld_apop_curvm_MGMT_M_120h=He_apop_curvm_120h_MGMT_M(1:9);
He_hd_apop_curvm_MGMT_M_72h=[He_apop_curvm_72h_MGMT_M(1) He_apop_curvm_72h_MGMT_M(10:15)']';
He_hd_apop_curvm_MGMT_M_96h=[He_apop_curvm_96h_MGMT_M(1) He_apop_curvm_96h_MGMT_M(10:15)']';
He_hd_apop_curvm_MGMT_M_120h=[He_apop_curvm_120h_MGMT_M(1) He_apop_curvm_120h_MGMT_M(10:15)']';
He_hd_apop_curvm_MGMT_M_144h=[He_apop_curvm_144h_MGMT_M(1) He_apop_curvm_144h_MGMT_M(10:15)']';

He_ld_apop_curvm_MGMT_P_120h=He_apop_curvm_120h_MGMT_P(1:9);
He_hd_apop_curvm_MGMT_P_72h=[He_apop_curvm_72h_MGMT_P(1) He_apop_curvm_72h_MGMT_P(10:15)']';
He_hd_apop_curvm_MGMT_P_96h=[He_apop_curvm_96h_MGMT_P(1) He_apop_curvm_96h_MGMT_P(10:15)']';
He_hd_apop_curvm_MGMT_P_120h=[He_apop_curvm_120h_MGMT_P(1) He_apop_curvm_120h_MGMT_P(10:15)']';
He_hd_apop_curvm_MGMT_P_144h=[He_apop_curvm_144h_MGMT_P(1) He_apop_curvm_144h_MGMT_P(10:15)']';

end