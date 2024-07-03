function [TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P,...
    TMZNip_surv_curvm_MGMT_M,TMZNip_surv_curvm_MGMT_P,...
    TMZRI1_surv_curvm_MGMT_M,TMZRI1_surv_curvm_MGMT_P,...
    TMZRI1Nip_surv_curvm_MGMT_M,TMZRI1Nip_surv_curvm_MGMT_P,...
    tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,...
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    numb_comptime1,...
    cell_pop_norm0_Verre_MGMT_M,cell_pop_norm0_Verre_MGMT_P)

global sn_Verre_TMZalone_0TMZ_MGMT_M sn_Verre_TMZalone_5TMZ_MGMT_M sn_Verre_TMZalone_25TMZ_MGMT_M sn_Verre_TMZalone_50TMZ_MGMT_M sn_Verre_TMZalone_100TMZ_MGMT_M sn_Verre_TMZalone_200TMZ_MGMT_M sn_Verre_TMZalone_400TMZ_MGMT_M sn_Verre_TMZalone_800TMZ_MGMT_M sn_Verre_TMZalone_1000TMZ_MGMT_M...
    sn_Verre_TMZalone_0TMZ_MGMT_P sn_Verre_TMZalone_5TMZ_MGMT_P sn_Verre_TMZalone_25TMZ_MGMT_P sn_Verre_TMZalone_50TMZ_MGMT_P sn_Verre_TMZalone_100TMZ_MGMT_P sn_Verre_TMZalone_200TMZ_MGMT_P sn_Verre_TMZalone_400TMZ_MGMT_P sn_Verre_TMZalone_800TMZ_MGMT_P sn_Verre_TMZalone_1000TMZ_MGMT_P...
    sn_Verre_TMZNip_0TMZ_MGMT_M sn_Verre_TMZNip_5TMZ_MGMT_M sn_Verre_TMZNip_25TMZ_MGMT_M sn_Verre_TMZNip_50TMZ_MGMT_M sn_Verre_TMZNip_100TMZ_MGMT_M sn_Verre_TMZNip_200TMZ_MGMT_M sn_Verre_TMZNip_400TMZ_MGMT_M sn_Verre_TMZNip_800TMZ_MGMT_M sn_Verre_TMZNip_1000TMZ_MGMT_M...
    sn_Verre_TMZNip_0TMZ_MGMT_P sn_Verre_TMZNip_5TMZ_MGMT_P sn_Verre_TMZNip_25TMZ_MGMT_P sn_Verre_TMZNip_50TMZ_MGMT_P sn_Verre_TMZNip_100TMZ_MGMT_P sn_Verre_TMZNip_200TMZ_MGMT_P sn_Verre_TMZNip_400TMZ_MGMT_P sn_Verre_TMZNip_800TMZ_MGMT_P sn_Verre_TMZNip_1000TMZ_MGMT_P...
    sn_Verre_TMZRI1_0TMZ_MGMT_M sn_Verre_TMZRI1_5TMZ_MGMT_M sn_Verre_TMZRI1_25TMZ_MGMT_M sn_Verre_TMZRI1_50TMZ_MGMT_M sn_Verre_TMZRI1_100TMZ_MGMT_M sn_Verre_TMZRI1_200TMZ_MGMT_M sn_Verre_TMZRI1_400TMZ_MGMT_M sn_Verre_TMZRI1_800TMZ_MGMT_M sn_Verre_TMZRI1_1000TMZ_MGMT_M...
    sn_Verre_TMZRI1_0TMZ_MGMT_P sn_Verre_TMZRI1_5TMZ_MGMT_P sn_Verre_TMZRI1_25TMZ_MGMT_P sn_Verre_TMZRI1_50TMZ_MGMT_P sn_Verre_TMZRI1_100TMZ_MGMT_P sn_Verre_TMZRI1_200TMZ_MGMT_P sn_Verre_TMZRI1_400TMZ_MGMT_P sn_Verre_TMZRI1_800TMZ_MGMT_P sn_Verre_TMZRI1_1000TMZ_MGMT_P...
    sn_Verre_TMZRI1Nip_0TMZ_MGMT_M sn_Verre_TMZRI1Nip_5TMZ_MGMT_M sn_Verre_TMZRI1Nip_25TMZ_MGMT_M sn_Verre_TMZRI1Nip_50TMZ_MGMT_M sn_Verre_TMZRI1Nip_100TMZ_MGMT_M sn_Verre_TMZRI1Nip_200TMZ_MGMT_M sn_Verre_TMZRI1Nip_400TMZ_MGMT_M sn_Verre_TMZRI1Nip_800TMZ_MGMT_M sn_Verre_TMZRI1Nip_1000TMZ_MGMT_M...
    sn_Verre_TMZRI1Nip_0TMZ_MGMT_P sn_Verre_TMZRI1Nip_5TMZ_MGMT_P sn_Verre_TMZRI1Nip_25TMZ_MGMT_P sn_Verre_TMZRI1Nip_50TMZ_MGMT_P sn_Verre_TMZRI1Nip_100TMZ_MGMT_P sn_Verre_TMZRI1Nip_200TMZ_MGMT_P sn_Verre_TMZRI1Nip_400TMZ_MGMT_P sn_Verre_TMZRI1Nip_800TMZ_MGMT_P sn_Verre_TMZRI1Nip_1000TMZ_MGMT_P...
    sim_number

tcellpopm_cell=cell(1,sim_number);
cellpopm_cell=cell(1,sim_number);

TMZalone_surv_curvm_MGMT_M=zeros(size(TMZout0_surv_Verre_MGMT_M))';
TMZalone_surv_curvm_MGMT_P=zeros(size(TMZout0_surv_Verre_MGMT_P))';
TMZNip_surv_curvm_MGMT_M=zeros(size(TMZout0_surv_Verre_MGMT_M))';
TMZNip_surv_curvm_MGMT_P=zeros(size(TMZout0_surv_Verre_MGMT_P))';
TMZRI1_surv_curvm_MGMT_M=zeros(size(TMZout0_surv_Verre_MGMT_M))';
TMZRI1_surv_curvm_MGMT_P=zeros(size(TMZout0_surv_Verre_MGMT_P))';
TMZRI1Nip_surv_curvm_MGMT_M=zeros(size(TMZout0_surv_Verre_MGMT_M))';
TMZRI1Nip_surv_curvm_MGMT_P=zeros(size(TMZout0_surv_Verre_MGMT_P))';

[DMSO_t_vec_Verre_MGMT_M,DMSO_p53_vec_Verre_MGMT_M]=cell_pop_p53vec(144,numb_comptime1,tm_cell{sn_Verre_TMZalone_0TMZ_MGMT_M},um_cell{sn_Verre_TMZalone_0TMZ_MGMT_M});
[DMSO_t_vec_Verre_MGMT_P,DMSO_p53_vec_Verre_MGMT_P]=cell_pop_p53vec(144,numb_comptime1,tm_cell{sn_Verre_TMZalone_0TMZ_MGMT_P},um_cell{sn_Verre_TMZalone_0TMZ_MGMT_P});

[tDMSO_pop_Verre_MGMT_M,DMSO_pop_Verre_MGMT_M]=ode23tb(@cell_pop_eq,DMSO_t_vec_Verre_MGMT_M,cell_pop0,[],DMSO_t_vec_Verre_MGMT_M,DMSO_p53_vec_Verre_MGMT_M,k_apop,n_p53int,upAsy,sness,tED50);
[tDMSO_pop_Verre_MGMT_P,DMSO_pop_Verre_MGMT_P]=ode23tb(@cell_pop_eq,DMSO_t_vec_Verre_MGMT_P,cell_pop0,[],DMSO_t_vec_Verre_MGMT_P,DMSO_p53_vec_Verre_MGMT_P,k_apop,n_p53int,upAsy,sness,tED50);



%% Maite Verreault Simulations Cell TMZ survival (TMZ alone)
% MGMT-
for index=sn_Verre_TMZalone_0TMZ_MGMT_M:sn_Verre_TMZalone_1000TMZ_MGMT_M
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_M,DMSO_pop_Verre_MGMT_M,index);
    TMZalone_surv_curvm_MGMT_M(index-sn_Verre_TMZalone_0TMZ_MGMT_M+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end

% MGMT+
for index=sn_Verre_TMZalone_0TMZ_MGMT_P:sn_Verre_TMZalone_1000TMZ_MGMT_P
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_P,DMSO_pop_Verre_MGMT_P,index);
    TMZalone_surv_curvm_MGMT_P(index-sn_Verre_TMZalone_0TMZ_MGMT_P+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end
%% Maite Verreault Simulations Cell TMZ survival (TMZ + Niparib)
% MGMT-
for index=sn_Verre_TMZNip_0TMZ_MGMT_M:sn_Verre_TMZNip_1000TMZ_MGMT_M
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_M,DMSO_pop_Verre_MGMT_M,index);
    TMZNip_surv_curvm_MGMT_M(index-sn_Verre_TMZNip_0TMZ_MGMT_M+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end

% MGMT+
for index=sn_Verre_TMZNip_0TMZ_MGMT_P:sn_Verre_TMZNip_1000TMZ_MGMT_P
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_P,DMSO_pop_Verre_MGMT_P,index);
    TMZNip_surv_curvm_MGMT_P(index-sn_Verre_TMZNip_0TMZ_MGMT_P+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end
%% Maite Verreault Simulations Cell TMZ survival (TMZ + RI1 )
% MGMT-
for index=sn_Verre_TMZRI1_0TMZ_MGMT_M:sn_Verre_TMZRI1_1000TMZ_MGMT_M
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_M,DMSO_pop_Verre_MGMT_M,index);
    TMZRI1_surv_curvm_MGMT_M(index-sn_Verre_TMZRI1_0TMZ_MGMT_M+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end

% MGMT+
for index=sn_Verre_TMZRI1_0TMZ_MGMT_P:sn_Verre_TMZRI1_1000TMZ_MGMT_P
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_P,DMSO_pop_Verre_MGMT_P,index);
    TMZRI1_surv_curvm_MGMT_P(index-sn_Verre_TMZRI1_0TMZ_MGMT_P+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end
%% Maite Verreault Simulations Cell TMZ survival (TMZ + RI1 + Niparib)
% MGMT-
for index=sn_Verre_TMZRI1Nip_0TMZ_MGMT_M:sn_Verre_TMZRI1Nip_1000TMZ_MGMT_M
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_M,DMSO_pop_Verre_MGMT_M,index);
    TMZRI1Nip_surv_curvm_MGMT_M(index-sn_Verre_TMZRI1Nip_0TMZ_MGMT_M+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end

% MGMT+
for index=sn_Verre_TMZRI1Nip_0TMZ_MGMT_P:sn_Verre_TMZRI1Nip_1000TMZ_MGMT_P
    [tcellpopm_cell{index},cellpopm_cell{index}]=cell_pop_simulations(144,numb_comptime1,tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,cell_pop_norm0_Verre_MGMT_P,DMSO_pop_Verre_MGMT_P,index);
    TMZRI1Nip_surv_curvm_MGMT_P(index-sn_Verre_TMZRI1Nip_0TMZ_MGMT_P+1)=cellpopm_cell{index}(144*numb_comptime1+1);
end


end