function [cost_Chk1_Jack_MGMT_M,cost_pChk1_Jack_MGMT_M,...
    cost_MGMT_Jack_MGMT_P,cost_Chk1_Jack_MGMT_P,cost_pChk1_Jack_MGMT_P,...
    cost_Chk1_Jack_inhATR_MGMT_M,cost_pChk1_Jack_inhATR_MGMT_M,...
    cost_Chk1_Jack_inhATR_MGMT_P,cost_pChk1_Jack_inhATR_MGMT_P,...
    cost_pChk1_Aas,cost_cdc25c_Aas,cost_p53_Aas,...
    cost_DSB_He_ldTMZ_MGMT_M_72h,cost_DSB_He_ldTMZ_MGMT_P_72h,...
    cost_p53_He_ldTMZ_MGMT_M_24h,cost_p53_He_ldTMZ_MGMT_M_72h,cost_p53ser46_He_ldTMZ_MGMT_M_24h,cost_p53ser46_He_ldTMZ_MGMT_M_72h,...
    cost_p53_He_hdTMZ_MGMT_M_24h,cost_p53_He_hdTMZ_MGMT_M_72h,cost_p53ser46_He_hdTMZ_MGMT_M_24h,cost_p53ser46_He_hdTMZ_MGMT_M_72h,...
    cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A,cost_O6MeG_Ka_3h_MGMT_M,...
    cost_O6MeG_Ka_3h_MGMT_P,...
    cost_surv_Jack_MGMT_M,cost_surv_Jack_MGMT_P,...
    cost_apop_He_ld_MGMT_M_120h,cost_apop_He_hd_MGMT_M_72h,cost_apop_He_hd_MGMT_M_96h,cost_apop_He_hd_MGMT_M_120h,cost_apop_He_hd_MGMT_M_144h,...
    cost_apop_He_ld_MGMT_P_120h,cost_apop_He_hd_MGMT_P_72h,cost_apop_He_hd_MGMT_P_96h,cost_apop_He_hd_MGMT_P_120h,cost_apop_He_hd_MGMT_P_144h,...
    cost]=cost_function(...
    numb_comptime1,k_addEx,k_addN,dna,K_add,K_ATR,upAsy,sness,tED50,...%parameters
    pChk1_ref12_5_24h,pChk1_ref100_24h,pChk1_ref100_48h,...normalization value reference
    surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,Chk1_Jack_MGMT_M_time,Chk1_Jack_MGMT_M_norm,pChk1_Jack_MGMT_M_time,pChk1_Jack_MGMT_M_norm,...%data
    surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,MGMT_Jack_MGMT_P_time,MGMT_Jack_MGMT_P_norm,Chk1_Jack_MGMT_P_time,Chk1_Jack_MGMT_P_norm,pChk1_Jack_MGMT_P_time,pChk1_Jack_MGMT_P_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Chk1_Jack_inhATR_MGMT_M_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,pChk1_Jack_inhATR_VXcon_MGMT_M_norm,pChk1_Jack_inhATR_MGMT_M_norm,...
    Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk1_Jack_inhATR_VXcon_MGMT_P_norm,Chk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,pChk1_Jack_inhATR_VXcon_MGMT_P_norm,pChk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Aas_time,pChk1_Aas_norm,cdc25c_Aas_time,cdc25c_Aas_norm,p53_Aas_time,p53_Aas_norm,...
    DSB_72h,DSB_He_ldTMZ_MGMT_M_72h,p53_He_ldTMZ_MGMT_M_24h_norm,p53_He_ldTMZ_MGMT_M_72h_norm,p53ser46_He_ldTMZ_MGMT_M_24h_norm,p53ser46_He_ldTMZ_MGMT_M_72h_norm,...
    apop_mean_He_ldTMZ_MGMT_M_120h,apop_stddev_He_ldTMZ_MGMT_M_120h,...
    p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    apop_mean_He_hdTMZ_MGMT_M_72h,apop_stddev_He_hdTMZ_MGMT_M_72h,apop_mean_He_hdTMZ_MGMT_M_96h,apop_stddev_He_hdTMZ_MGMT_M_96h,...
    apop_mean_He_hdTMZ_MGMT_M_120h,apop_stddev_He_hdTMZ_MGMT_M_120h,apop_mean_He_hdTMZ_MGMT_M_144h,apop_stddev_He_hdTMZ_MGMT_M_144h,...
    DSB_He_ldTMZ_MGMT_P_72h,apop_mean_He_ldTMZ_MGMT_P_120h,apop_stddev_He_ldTMZ_MGMT_P_120h,...
    apop_mean_He_hdTMZ_MGMT_P_72h,apop_stddev_He_hdTMZ_MGMT_P_72h,apop_mean_He_hdTMZ_MGMT_P_96h,apop_stddev_He_hdTMZ_MGMT_P_96h,...
    apop_mean_He_hdTMZ_MGMT_P_120h,apop_stddev_He_hdTMZ_MGMT_P_120h,apop_mean_He_hdTMZ_MGMT_P_144h,apop_stddev_He_hdTMZ_MGMT_P_144h,...
    O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time,O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A,...
    O6Meg_Ka_3h_MGMT_M,O6Meg_Ka_3h_MGMT_P,...
    tm_cell,um_cell,CyAm_cell,...%simulations
    Jack_surv_curvm_MGMT_M,Jack_surv_curvm_MGMT_P,...
    He_ld_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_72h,He_hd_apop_curvm_MGMT_M_96h,He_hd_apop_curvm_MGMT_M_120h,He_hd_apop_curvm_MGMT_M_144h,...
    He_ld_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_72h,He_hd_apop_curvm_MGMT_P_96h,He_hd_apop_curvm_MGMT_P_120h,He_hd_apop_curvm_MGMT_P_144h...
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
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h sn_surv_3000TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h sn_surv_3000TMZ_MGMT_P_144h...
    sim_number

cost_Chk1_Jack_MGMT_M=zeros(size(Chk1_Jack_MGMT_M_time));
cost_pChk1_Jack_MGMT_M=zeros(size(pChk1_Jack_MGMT_M_time));

cost_MGMT_Jack_MGMT_P=zeros(size(MGMT_Jack_MGMT_P_time));
cost_Chk1_Jack_MGMT_P=zeros(size(Chk1_Jack_MGMT_P_time));
cost_pChk1_Jack_MGMT_P=zeros(size(pChk1_Jack_MGMT_P_time));

cost_Chk1_Jack_inhATR_MGMT_M=zeros(1,6);
cost_pChk1_Jack_inhATR_MGMT_M=zeros(1,7);

cost_Chk1_Jack_inhATR_MGMT_P=zeros(1,6);
cost_pChk1_Jack_inhATR_MGMT_P=zeros(1,7);

cost_pChk1_Aas=zeros(size(pChk1_Aas_time));
cost_cdc25c_Aas=zeros(size(cdc25c_Aas_time));
cost_p53_Aas=zeros(size(p53_Aas_time));

cost_DSB_He_ldTMZ_MGMT_M_72h=zeros(size(DSB_He_ldTMZ_MGMT_M_72h))';

cost_p53_He_ldTMZ_MGMT_M_24h=zeros(size(p53_He_ldTMZ_MGMT_M_24h_norm))';
cost_p53_He_ldTMZ_MGMT_M_72h=zeros(size(p53_He_ldTMZ_MGMT_M_72h_norm))';
cost_p53ser46_He_ldTMZ_MGMT_M_24h=zeros(size(p53ser46_He_ldTMZ_MGMT_M_24h_norm))';
cost_p53ser46_He_ldTMZ_MGMT_M_72h=zeros(size(p53ser46_He_ldTMZ_MGMT_M_72h_norm))';

cost_p53_He_hdTMZ_MGMT_M_24h=zeros(1,size(p53_He_hdTMZ_MGMT_M_24h_norm,1)-1);
cost_p53_He_hdTMZ_MGMT_M_72h=zeros(1,size(p53_He_hdTMZ_MGMT_M_72h_norm,1)-1);
cost_p53ser46_He_hdTMZ_MGMT_M_24h=zeros(1,size(p53ser46_He_hdTMZ_MGMT_M_24h_norm,1)-1);
cost_p53ser46_He_hdTMZ_MGMT_M_72h=zeros(1,size(p53ser46_He_hdTMZ_MGMT_M_72h_norm,1)-1);

cost_DSB_He_ldTMZ_MGMT_P_72h=zeros(size(DSB_He_ldTMZ_MGMT_P_72h))';

cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A=zeros(size(O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A))';
cost_O6MeG_Ka_3h_MGMT_M=zeros(size(O6Meg_Ka_3h_MGMT_M))';
cost_O6MeG_Ka_3h_MGMT_P=zeros(size(O6Meg_Ka_3h_MGMT_P))';

cost_surv_Jack_MGMT_M=zeros(1,size(surv_mean_Jack_MGMT_M,1)-1);
cost_surv_Jack_MGMT_P=zeros(1,size(surv_mean_Jack_MGMT_P,1)-1);

cost_apop_He_ld_MGMT_M_120h=zeros(size(apop_mean_He_ldTMZ_MGMT_M_120h))';
cost_apop_He_hd_MGMT_M_72h=zeros(size(apop_mean_He_hdTMZ_MGMT_M_72h))';
cost_apop_He_hd_MGMT_M_96h=zeros(size(apop_mean_He_hdTMZ_MGMT_M_96h))';
cost_apop_He_hd_MGMT_M_120h=zeros(size(apop_mean_He_hdTMZ_MGMT_M_120h))';
cost_apop_He_hd_MGMT_M_144h=zeros(size(apop_mean_He_hdTMZ_MGMT_M_144h))';

cost_apop_He_ld_MGMT_P_120h=zeros(size(apop_mean_He_ldTMZ_MGMT_P_120h))';
cost_apop_He_hd_MGMT_P_72h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_72h))';
cost_apop_He_hd_MGMT_P_96h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_96h))';
cost_apop_He_hd_MGMT_P_120h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_120h))';
cost_apop_He_hd_MGMT_P_144h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_144h))';


wght_Chk1_Jack_MGMT_M=2;%<-----------------
wght_pChk1_Jack_MGMT_M=3;%<-----------------

wght_MGMT_Jack_MGMT_P=1;
wght_Chk1_Jack_MGMT_P=2;%<-----------------
wght_pChk1_Jack_MGMT_P=3;%<-----------------

wght_Chk1_Jack_inhATR_MGMT_M=5;%<-----------------
wght_pChk1_Jack_inhATR_MGMT_M=5;%<-----------------

wght_Chk1_Jack_inhATR_MGMT_P=5;%<-----------------
wght_pChk1_Jack_inhATR_MGMT_P=5;%<-----------------

wght_pChk1_Aas=9;%<-----------------
wght_cdc25c_Aas=7;%<-----------------
wght_p53_Aas=1;

wght_DSB_He_ldTMZ_MGMT_M_72h=5;%<-----------------
wght_DSB_He_ldTMZ_MGMT_P_72h=5;%<-----------------

wght_p53_He_ldTMZ_MGMT_M_24h=8;%<-----------------
wght_p53_He_ldTMZ_MGMT_M_72h=8;%<-----------------
wght_p53ser46_He_ldTMZ_MGMT_M_24h=8;%<-----------------
wght_p53ser46_He_ldTMZ_MGMT_M_72h=8;%<-----------------

wght_p53_He_hdTMZ_MGMT_M_24h=15;%<-----------------
wght_p53_He_hdTMZ_MGMT_M_72h=15;%<-----------------
wght_p53ser46_He_hdTMZ_MGMT_M_24h=25;%<-----------------
wght_p53ser46_He_hdTMZ_MGMT_M_72h=25;%<-----------------

wght_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A=10;%<-----------------
wght_O6MeG_Ka_3h_MGMT_M=15;%<-----------------
wght_O6MeG_Ka_3h_MGMT_P=15;%<-----------------

wght_surv_Jack_MGMT_M=0.6;%<-----------------
wght_surv_Jack_MGMT_P=0.6;%<-----------------
wght_surv_Jack_MGMT_P_256TMZ=0.6;%<-----------------
wght_surv_Jack_MGMT_P_512TMZ=0.6;%<-----------------
wght_surv_Jack_MGMT_P_1024TMZ=0.6;%<-----------------
surv_stddev_Jack_MGMT_P_zerofactor=6;
surv_stddev_Jack_MGMT_M_zerofactor=6;

wght_apop_He_ld_MGMT_M_120h=0.3;
wght_apop_He_hd_MGMT_M_72h=0.3;
wght_apop_He_hd_MGMT_M_96h=0.3;
wght_apop_He_hd_MGMT_M_120h=0.3;
wght_apop_He_hd_MGMT_M_144h=0.3;
apop_stddev_He_ld_MGMT_M_zerofactor=4;
apop_stddev_He_hd_MGMT_M_zerofactor=4;

wght_apop_He_ld_MGMT_P_120h=0.3;
wght_apop_He_hd_MGMT_P_72h=0.3;
wght_apop_He_hd_MGMT_P_96h=0.3;
wght_apop_He_hd_MGMT_P_120h=0.3;
wght_apop_He_hd_MGMT_P_144h=0.3;
apop_stddev_He_ld_MGMT_P_zerofactor=4;
apop_stddev_He_hd_MGMT_P_zerofactor=4;

cost=0;

add_N37_n_sim=sn_He_25TMZ_MGMT_M_144h;
% max_Cin_6h=max(um_cell{add_N37_n_sim}(0*numb_comptime1+1:6*numb_comptime1+1,7))
ave_Cin_6h=mean(um_cell{add_N37_n_sim}(0*numb_comptime1+1:6*numb_comptime1+1,7));
N37_TMZ_He_6h=k_addN.*dna.*ave_Cin_6h;
N37add_ration=N37_TMZ_He_6h/k_addEx;

add_chsn_sim=sn_Ka_20TMZ_MGMT_M;
O6MeG_Ka_20TMZ_2h_MGMT_M=um_cell{add_chsn_sim}(0*numb_comptime1+1:2*numb_comptime1+1,8);
GT_Ka_20TMZ_2h_MGMT_M=um_cell{add_chsn_sim}(0*numb_comptime1+1:2*numb_comptime1+1,10);
SSB_Ka_20TMZ_2h_MGMT_M=um_cell{add_chsn_sim}(0*numb_comptime1+1:2*numb_comptime1+1,11);
O6MeG_tot_Ka_20TMZ_2h_MGMT_M=mean(sum([O6MeG_Ka_20TMZ_2h_MGMT_M GT_Ka_20TMZ_2h_MGMT_M SSB_Ka_20TMZ_2h_MGMT_M],2));

N37MeAG_Ka_20TMZ_2h_MGMT_M=mean(um_cell{add_chsn_sim}(0*numb_comptime1+1:2*numb_comptime1+1,12));
LO_O6MeG_tot_Ka_20TMZ_2h_MGMT_M=(2/98)*N37MeAG_Ka_20TMZ_2h_MGMT_M;
UP_O6MeG_tot_Ka_20TMZ_2h_MGMT_M=(20/80)*N37MeAG_Ka_20TMZ_2h_MGMT_M;

DSB_MGMT_M_n_sim=sn_He_20TMZ_MGMT_M_144h;
He_DSB_MGMT_M_max=max(um_cell{DSB_MGMT_M_n_sim}(1:72*numb_comptime1+1,13));
DSB_MGMT_P_n_sim=sn_He_20TMZ_MGMT_P_144h;
He_DSB_MGMT_P_max=max(um_cell{DSB_MGMT_P_n_sim}(1:72*numb_comptime1+1,13));

DSB_MGMT_P_72h_256TMZ=um_cell{sn_surv_256TMZ_MGMT_P_144h}(72*numb_comptime1+1,13);

LO_K_ATR=um_cell{sn_surv_1TMZ_MGMT_M_144h}(72*numb_comptime1+1,15);
UP_K_ATR=1.5*um_cell{sn_surv_256TMZ_MGMT_M_144h}(72*numb_comptime1+1,15);

p53_n_sim=sn_surv_1024TMZ_MGMT_M_144h;
[p53_tot_t_Jack_MGMT_M_144h,p53_tot_vec_Jack_M_144h]=cell_pop_p53vec(144,numb_comptime1,tm_cell{p53_n_sim},um_cell{p53_n_sim});
p53_integr_Jack_MGMT_M_144h=trapz(p53_tot_t_Jack_MGMT_M_144h,p53_tot_vec_Jack_M_144h); 
logistic_f_vec=cell_pop_logistic_f(p53_tot_t_Jack_MGMT_M_144h,upAsy,sness,tED50);
logistic_f_vec_end=logistic_f_vec(144*numb_comptime1+1);

Sphase_1stday_MGMT_M=CyAm_cell{sn_surv_0TMZ_MGMT_M_144h}(0*numb_comptime1+1:24*numb_comptime1+1);
Sphase_6stday_MGMT_M=CyAm_cell{sn_surv_0TMZ_MGMT_M_144h}(120*numb_comptime1+1:144*numb_comptime1+1);
Sphase_1stday_MGMT_M_peak=max(Sphase_1stday_MGMT_M);
Sphase_6stday_MGMT_M_peak=max(Sphase_6stday_MGMT_M);
% (0*numb_comptime1+1,24*numb_comptime1+1)
if  N37add_ration<2
    cost=1e5;
elseif N37add_ration>50
    cost=1e6;
elseif  O6MeG_tot_Ka_20TMZ_2h_MGMT_M<LO_O6MeG_tot_Ka_20TMZ_2h_MGMT_M
    cost=1e7;
elseif O6MeG_tot_Ka_20TMZ_2h_MGMT_M>UP_O6MeG_tot_Ka_20TMZ_2h_MGMT_M
    cost=1e8;
% elseif He_DSB_MGMT_P_max>(1/2)*He_DSB_MGMT_M_max
%      cost=1e9;
% elseif DSB_MGMT_P_72h_256TMZ>K_add
%     cost=1e10;
elseif pChk1_ref12_5_24h>pChk1_ref100_24h
     cost=1e11;
elseif pChk1_Aas_norm(1)>pChk1_ref100_24h
     cost=1e12;
elseif pChk1_ref100_24h>pChk1_ref100_48h
     cost=1e13;
elseif K_ATR<LO_K_ATR
    cost=1e14;
elseif K_ATR>UP_K_ATR
    cost=1e15;
elseif logistic_f_vec_end>p53_integr_Jack_MGMT_M_144h
    cost=1e16;
elseif Sphase_6stday_MGMT_M_peak<0.95*Sphase_1stday_MGMT_M_peak
    cost=1e17;
elseif Jack_surv_curvm_MGMT_P(end)>15
    cost=1e18;
else

    for i=1:size(Chk1_Jack_MGMT_M_time,2)
        ind=Chk1_Jack_MGMT_M_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
        cost_Chk1_Jack_MGMT_M(i)=wght_Chk1_Jack_MGMT_M*(Chk1_Jack_MGMT_M_norm(i)-um_cell{sn_Jack_MGMT_M}(ind,16))^2/Chk1_Jack_MGMT_M_norm(i)^2;
    end
    cost=cost+sum(cost_Chk1_Jack_MGMT_M);

    for i=1:size(pChk1_Jack_MGMT_M_time,2)
       ind=pChk1_Jack_MGMT_M_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
       if ind==1%<---------------------%to exclude the initial condition
           cost_pChk1_Jack_MGMT_M(i)=0;
       else
           cost_pChk1_Jack_MGMT_M(i)=wght_pChk1_Jack_MGMT_M*(pChk1_Jack_MGMT_M_norm(i)-um_cell{sn_Jack_MGMT_M}(ind,17))^2/pChk1_Jack_MGMT_M_norm(i)^2;
       end
    end
    cost=cost+sum(cost_pChk1_Jack_MGMT_M);
    
    for i=1:size(MGMT_Jack_MGMT_P_time,2)
       ind=MGMT_Jack_MGMT_P_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
        cost_MGMT_Jack_MGMT_P(i)=wght_MGMT_Jack_MGMT_P*(MGMT_Jack_MGMT_P_norm(i)-um_cell{sn_Jack_MGMT_P}(ind,9))^2/MGMT_Jack_MGMT_P_norm(i)^2;
    end
    cost=cost+sum(cost_MGMT_Jack_MGMT_P);

    for i=1:size(Chk1_Jack_MGMT_P_time,2)-1% The data of Chk1 at t=48 are not take into account
       ind=Chk1_Jack_MGMT_P_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
        cost_Chk1_Jack_MGMT_P(i)=wght_Chk1_Jack_MGMT_P*(Chk1_Jack_MGMT_P_norm(i)-um_cell{sn_Jack_MGMT_P}(ind,16))^2/Chk1_Jack_MGMT_P_norm(i)^2;
    end
    cost=cost+sum(cost_Chk1_Jack_MGMT_P);

    for i=1:size(pChk1_Jack_MGMT_P_time,2)
       ind=pChk1_Jack_MGMT_P_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
       if ind==1%<---------------------%to exclude the initial condition
           cost_pChk1_Jack_MGMT_P(i)=0;
       else
           cost_pChk1_Jack_MGMT_P(i)=wght_pChk1_Jack_MGMT_P*(pChk1_Jack_MGMT_P_norm(i)-um_cell{sn_Jack_MGMT_P}(ind,17))^2/max(pChk1_Jack_MGMT_P_norm)^2;
       end
    end
    cost=cost+sum(cost_pChk1_Jack_MGMT_P);
   
    
    ind=24*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
    
%     for i=1:sn_Jack_inhATR1000VX_MGMT_M-sn_Jack_inhATR8VX_MGMT_M+1
%         cost_Chk1_Jack_inhATR_MGMT_M(i)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_MGMT_M_norm(i)-um_cell{sn_Jack_inhATR8VX_MGMT_M+i-1}(ind,16))^2/Chk1_Jack_inhATR_MGMT_M_norm(i)^2;
%     end
    cost_Chk1_Jack_inhATR_MGMT_M(1)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_MGMT_M_norm(1)-um_cell{sn_Jack_inhATR8VX_MGMT_M}(ind,16))^2/Chk1_Jack_inhATR_MGMT_M_norm(1)^2;
    cost_Chk1_Jack_inhATR_MGMT_M(2)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_MGMT_M_norm(2)-um_cell{sn_Jack_inhATR40VX_MGMT_M}(ind,16))^2/Chk1_Jack_inhATR_MGMT_M_norm(2)^2;
    cost_Chk1_Jack_inhATR_MGMT_M(3)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_MGMT_M_norm(3)-um_cell{sn_Jack_inhATR200VX_MGMT_M}(ind,16))^2/Chk1_Jack_inhATR_MGMT_M_norm(3)^2;
    cost_Chk1_Jack_inhATR_MGMT_M(4)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_MGMT_M_norm(4)-um_cell{sn_Jack_inhATR1000VX_MGMT_M}(ind,16))^2/Chk1_Jack_inhATR_MGMT_M_norm(4)^2;
    cost_Chk1_Jack_inhATR_MGMT_M(5)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm-um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M}(ind,16))^2/Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm^2;
    cost_Chk1_Jack_inhATR_MGMT_M(6)=wght_Chk1_Jack_inhATR_MGMT_M*(Chk1_Jack_inhATR_VXcon_MGMT_M_norm-um_cell{sn_Jack_inhATR_VXcon_MGMT_M}(ind,16))^2/Chk1_Jack_inhATR_VXcon_MGMT_M_norm^2;
    cost=cost+sum(cost_Chk1_Jack_inhATR_MGMT_M);
    
%     cost_pChk1_Jack_inhATR_MGMT_M(1)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_TMZVXcon_MGMT_M_Norm-pChk10_Jack_inhATR_MGMT_M)^2/pChk1_Jack_inhATR_TMZVXcon_MGMT_M_Norm^2;
    cost_pChk1_Jack_inhATR_MGMT_M(1)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm-um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M}(1,17))^2/pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm^2;
    
    cost_pChk1_Jack_inhATR_MGMT_M(2)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_MGMT_M_norm(1)-um_cell{sn_Jack_inhATR8VX_MGMT_M}(ind,17))^2/pChk1_Jack_inhATR_MGMT_M_norm(1)^2;
    cost_pChk1_Jack_inhATR_MGMT_M(3)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_MGMT_M_norm(2)-um_cell{sn_Jack_inhATR40VX_MGMT_M}(ind,17))^2/pChk1_Jack_inhATR_MGMT_M_norm(2)^2;
    cost_pChk1_Jack_inhATR_MGMT_M(4)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_MGMT_M_norm(3)-um_cell{sn_Jack_inhATR200VX_MGMT_M}(ind,17))^2/pChk1_Jack_inhATR_MGMT_M_norm(3)^2;
    cost_pChk1_Jack_inhATR_MGMT_M(5)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_MGMT_M_norm(4)-um_cell{sn_Jack_inhATR1000VX_MGMT_M}(ind,17))^2/pChk1_Jack_inhATR_MGMT_M_norm(4)^2;
    cost_pChk1_Jack_inhATR_MGMT_M(6)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm-um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_M}(ind,17))^2/pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm^2;
    cost_pChk1_Jack_inhATR_MGMT_M(7)=wght_pChk1_Jack_inhATR_MGMT_M*(pChk1_Jack_inhATR_VXcon_MGMT_M_norm-um_cell{sn_Jack_inhATR_VXcon_MGMT_M}(ind,17))^2/pChk1_Jack_inhATR_VXcon_MGMT_M_norm^2;
    cost=cost+sum(cost_pChk1_Jack_inhATR_MGMT_M);
       
    cost_Chk1_Jack_inhATR_MGMT_P(1)=wght_Chk1_Jack_inhATR_MGMT_P*(Chk1_Jack_inhATR_MGMT_P_norm(1)-um_cell{sn_Jack_inhATR8VX_MGMT_P}(ind,16))^2/Chk1_Jack_inhATR_MGMT_P_norm(1)^2;
    cost_Chk1_Jack_inhATR_MGMT_P(2)=wght_Chk1_Jack_inhATR_MGMT_P*(Chk1_Jack_inhATR_MGMT_P_norm(2)-um_cell{sn_Jack_inhATR40VX_MGMT_P}(ind,16))^2/Chk1_Jack_inhATR_MGMT_P_norm(2)^2;
    cost_Chk1_Jack_inhATR_MGMT_P(3)=wght_Chk1_Jack_inhATR_MGMT_P*(Chk1_Jack_inhATR_MGMT_P_norm(3)-um_cell{sn_Jack_inhATR200VX_MGMT_P}(ind,16))^2/Chk1_Jack_inhATR_MGMT_P_norm(3)^2;
    cost_Chk1_Jack_inhATR_MGMT_P(4)=wght_Chk1_Jack_inhATR_MGMT_P*(Chk1_Jack_inhATR_MGMT_P_norm(4)-um_cell{sn_Jack_inhATR1000VX_MGMT_P}(ind,16))^2/Chk1_Jack_inhATR_MGMT_P_norm(4)^2;
    cost_Chk1_Jack_inhATR_MGMT_P(5)=wght_Chk1_Jack_inhATR_MGMT_P*(Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm-um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P}(ind,16))^2/Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm^2;
    cost_Chk1_Jack_inhATR_MGMT_P(6)=wght_Chk1_Jack_inhATR_MGMT_P*(Chk1_Jack_inhATR_VXcon_MGMT_P_norm-um_cell{sn_Jack_inhATR_VXcon_MGMT_P}(ind,16))^2/Chk1_Jack_inhATR_VXcon_MGMT_P_norm^2;
    cost=cost+sum(cost_Chk1_Jack_inhATR_MGMT_P);
       
%     cost_pChk1_Jack_inhATR_MGMT_P(1)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_TMZVXcon_MGMT_P_Norm-pChk10_Jack_inhATR_MGMT_P)^2/pChk1_Jack_inhATR_TMZVXcon_MGMT_P_Norm^2;
    cost_pChk1_Jack_inhATR_MGMT_P(1)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm-um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P}(1,17))^2/pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm^2;
   
    cost_pChk1_Jack_inhATR_MGMT_P(2)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_MGMT_P_norm(1)-um_cell{sn_Jack_inhATR8VX_MGMT_P}(ind,17))^2/pChk1_Jack_inhATR_MGMT_P_norm(1)^2;
    cost_pChk1_Jack_inhATR_MGMT_P(3)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_MGMT_P_norm(2)-um_cell{sn_Jack_inhATR40VX_MGMT_P}(ind,17))^2/pChk1_Jack_inhATR_MGMT_P_norm(2)^2;
    cost_pChk1_Jack_inhATR_MGMT_P(4)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_MGMT_P_norm(3)-um_cell{sn_Jack_inhATR200VX_MGMT_P}(ind,17))^2/pChk1_Jack_inhATR_MGMT_P_norm(3)^2;
    cost_pChk1_Jack_inhATR_MGMT_P(5)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_MGMT_P_norm(4)-um_cell{sn_Jack_inhATR1000VX_MGMT_P}(ind,17))^2/pChk1_Jack_inhATR_MGMT_P_norm(4)^2;
    cost_pChk1_Jack_inhATR_MGMT_P(6)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm-um_cell{sn_Jack_inhATR_TMZVXcon_MGMT_P}(ind,17))^2/pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm^2;
    cost_pChk1_Jack_inhATR_MGMT_P(7)=wght_pChk1_Jack_inhATR_MGMT_P*(pChk1_Jack_inhATR_VXcon_MGMT_P_norm-um_cell{sn_Jack_inhATR_VXcon_MGMT_P}(ind,17))^2/pChk1_Jack_inhATR_VXcon_MGMT_P_norm^2;
    cost=cost+sum(cost_pChk1_Jack_inhATR_MGMT_P);
      
       
   for i=1:length(pChk1_Aas_time)
       ind=pChk1_Aas_time(i)*numb_comptime1+1;%<---------------------%That is because numb_comptime=(tf-ti)*numb_comptime1+1
       cost_pChk1_Aas(i)=wght_pChk1_Aas*(pChk1_Aas_norm(i)-um_cell{sn_Aas}(ind,17))^2/pChk1_Aas_norm(i)^2;
    end
    cost=cost+sum(cost_pChk1_Aas);
    
    for i=1:length(cdc25c_Aas_time)
       ind=cdc25c_Aas_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
        cost_cdc25c_Aas(i)=wght_cdc25c_Aas*(cdc25c_Aas_norm(i)-um_cell{sn_Aas}(ind,18))^2/cdc25c_Aas_norm(i)^2;
    end
    cost=cost+sum(cost_cdc25c_Aas);

    for i=1:length(p53_Aas_time)
       ind=p53_Aas_time(i)*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
        cost_p53_Aas(i)=wght_p53_Aas*(p53_Aas_norm(i)-um_cell{sn_Aas}(ind,19))^2/p53_Aas_norm(i)^2;
    end
    cost=cost+sum(cost_p53_Aas);
    
      ind1=24*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
      ind2=72*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
      
%       He low doses MGMT-
       cost_DSB_He_ldTMZ_MGMT_M_72h(1)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_72h-um_cell{sn_He_0TMZ_MGMT_M_144h}(ind2,13))^2/DSB_72h^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(2)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(2)-um_cell{sn_He_1TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(2)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(3)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(3)-um_cell{sn_He_2TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(3)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(4)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(4)-um_cell{sn_He_3TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(4)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(5)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(5)-um_cell{sn_He_4TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(5)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(6)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(6)-um_cell{sn_He_5TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(6)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(7)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(7)-um_cell{sn_He_10TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(7)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(8)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(8)-um_cell{sn_He_15TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(8)^2;
       cost_DSB_He_ldTMZ_MGMT_M_72h(9)=wght_DSB_He_ldTMZ_MGMT_M_72h*(DSB_He_ldTMZ_MGMT_M_72h(9)-um_cell{sn_He_20TMZ_MGMT_M_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_M_72h(9)^2;
       cost=cost+sum(cost_DSB_He_ldTMZ_MGMT_M_72h);

       cost_p53_He_ldTMZ_MGMT_M_24h(1)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(1)-um_cell{sn_He_0TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(1)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(2)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(2)-um_cell{sn_He_1TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(2)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(3)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(3)-um_cell{sn_He_2TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(3)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(4)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(4)-um_cell{sn_He_3TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(4)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(5)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(5)-um_cell{sn_He_4TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(5)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(6)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(6)-um_cell{sn_He_5TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(6)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(7)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(7)-um_cell{sn_He_10TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(7)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(8)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(8)-um_cell{sn_He_15TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(8)^2;
       cost_p53_He_ldTMZ_MGMT_M_24h(9)=wght_p53_He_ldTMZ_MGMT_M_24h*(p53_He_ldTMZ_MGMT_M_24h_norm(9)-um_cell{sn_He_20TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_ldTMZ_MGMT_M_24h_norm(9)^2;
       cost=cost+sum(cost_p53_He_ldTMZ_MGMT_M_24h);
       
       cost_p53_He_ldTMZ_MGMT_M_72h(1)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(1)-um_cell{sn_He_0TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(1)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(2)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(2)-um_cell{sn_He_1TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(2)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(3)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(3)-um_cell{sn_He_2TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(3)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(4)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(4)-um_cell{sn_He_3TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(4)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(5)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(5)-um_cell{sn_He_4TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(5)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(6)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(6)-um_cell{sn_He_5TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(6)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(7)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(7)-um_cell{sn_He_10TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(7)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(8)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(8)-um_cell{sn_He_15TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(8)^2;
       cost_p53_He_ldTMZ_MGMT_M_72h(9)=wght_p53_He_ldTMZ_MGMT_M_72h*(p53_He_ldTMZ_MGMT_M_72h_norm(9)-um_cell{sn_He_20TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_ldTMZ_MGMT_M_72h_norm(9)^2;
       cost=cost+sum(cost_p53_He_ldTMZ_MGMT_M_72h);
       
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(1)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(1)-um_cell{sn_He_0TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(1)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(2)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(2)-um_cell{sn_He_1TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(2)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(3)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(3)-um_cell{sn_He_2TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(3)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(4)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(4)-um_cell{sn_He_3TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(4)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(5)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(5)-um_cell{sn_He_4TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(5)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(6)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(6)-um_cell{sn_He_5TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(6)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(7)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(7)-um_cell{sn_He_10TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(7)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(8)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(8)-um_cell{sn_He_15TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(8)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_24h(9)=wght_p53ser46_He_ldTMZ_MGMT_M_24h*(p53ser46_He_ldTMZ_MGMT_M_24h_norm(9)-um_cell{sn_He_20TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_ldTMZ_MGMT_M_24h_norm(9)^2;
       cost=cost+sum(cost_p53ser46_He_ldTMZ_MGMT_M_24h);
       
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(1)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(1)-um_cell{sn_He_0TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(1)^2; 
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(2)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(2)-um_cell{sn_He_1TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(2)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(3)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(3)-um_cell{sn_He_2TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(3)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(4)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(4)-um_cell{sn_He_3TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(4)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(5)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(5)-um_cell{sn_He_4TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(5)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(6)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(6)-um_cell{sn_He_5TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(6)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(7)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(7)-um_cell{sn_He_10TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(7)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(8)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(8)-um_cell{sn_He_15TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(8)^2;
       cost_p53ser46_He_ldTMZ_MGMT_M_72h(9)=wght_p53ser46_He_ldTMZ_MGMT_M_72h*(p53ser46_He_ldTMZ_MGMT_M_72h_norm(9)-um_cell{sn_He_20TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_ldTMZ_MGMT_M_72h_norm(9)^2;
       cost=cost+sum(cost_p53ser46_He_ldTMZ_MGMT_M_72h);
      %He High doses MGMT-
      
       cost_p53_He_hdTMZ_MGMT_M_24h(1)=wght_p53_He_hdTMZ_MGMT_M_24h*(p53_He_hdTMZ_MGMT_M_24h_norm(2)-um_cell{sn_He_12_5TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_hdTMZ_MGMT_M_24h_norm(2)^2;
       cost_p53_He_hdTMZ_MGMT_M_24h(2)=wght_p53_He_hdTMZ_MGMT_M_24h*(p53_He_hdTMZ_MGMT_M_24h_norm(3)-um_cell{sn_He_25TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_hdTMZ_MGMT_M_24h_norm(3)^2;
       cost_p53_He_hdTMZ_MGMT_M_24h(3)=wght_p53_He_hdTMZ_MGMT_M_24h*(p53_He_hdTMZ_MGMT_M_24h_norm(4)-um_cell{sn_He_50TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_hdTMZ_MGMT_M_24h_norm(4)^2;
       cost_p53_He_hdTMZ_MGMT_M_24h(4)=wght_p53_He_hdTMZ_MGMT_M_24h*(p53_He_hdTMZ_MGMT_M_24h_norm(5)-um_cell{sn_He_75TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_hdTMZ_MGMT_M_24h_norm(5)^2;
       cost_p53_He_hdTMZ_MGMT_M_24h(5)=wght_p53_He_hdTMZ_MGMT_M_24h*(p53_He_hdTMZ_MGMT_M_24h_norm(6)-um_cell{sn_He_100TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_hdTMZ_MGMT_M_24h_norm(6)^2;
       cost_p53_He_hdTMZ_MGMT_M_24h(6)=wght_p53_He_hdTMZ_MGMT_M_24h*(p53_He_hdTMZ_MGMT_M_24h_norm(7)-um_cell{sn_He_125TMZ_MGMT_M_144h}(ind1,19))^2/p53_He_hdTMZ_MGMT_M_24h_norm(7)^2;
       cost=cost+sum(cost_p53_He_hdTMZ_MGMT_M_24h);
       
       cost_p53_He_hdTMZ_MGMT_M_72h(1)=wght_p53_He_hdTMZ_MGMT_M_72h*(p53_He_hdTMZ_MGMT_M_72h_norm(2)-um_cell{sn_He_12_5TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_hdTMZ_MGMT_M_72h_norm(2)^2;
       cost_p53_He_hdTMZ_MGMT_M_72h(2)=wght_p53_He_hdTMZ_MGMT_M_72h*(p53_He_hdTMZ_MGMT_M_72h_norm(3)-um_cell{sn_He_25TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_hdTMZ_MGMT_M_72h_norm(3)^2;
       cost_p53_He_hdTMZ_MGMT_M_72h(3)=wght_p53_He_hdTMZ_MGMT_M_72h*(p53_He_hdTMZ_MGMT_M_72h_norm(4)-um_cell{sn_He_50TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_hdTMZ_MGMT_M_72h_norm(4)^2;
       cost_p53_He_hdTMZ_MGMT_M_72h(4)=wght_p53_He_hdTMZ_MGMT_M_72h*(p53_He_hdTMZ_MGMT_M_72h_norm(5)-um_cell{sn_He_75TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_hdTMZ_MGMT_M_72h_norm(5)^2;
       cost_p53_He_hdTMZ_MGMT_M_72h(5)=wght_p53_He_hdTMZ_MGMT_M_72h*(p53_He_hdTMZ_MGMT_M_72h_norm(6)-um_cell{sn_He_100TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_hdTMZ_MGMT_M_72h_norm(6)^2;
       cost_p53_He_hdTMZ_MGMT_M_72h(6)=wght_p53_He_hdTMZ_MGMT_M_72h*(p53_He_hdTMZ_MGMT_M_72h_norm(7)-um_cell{sn_He_125TMZ_MGMT_M_144h}(ind2,19))^2/p53_He_hdTMZ_MGMT_M_72h_norm(7)^2;
       cost=cost+sum(cost_p53_He_hdTMZ_MGMT_M_72h);
    
       cost_p53ser46_He_hdTMZ_MGMT_M_24h(1)=wght_p53ser46_He_hdTMZ_MGMT_M_24h*(p53ser46_He_hdTMZ_MGMT_M_24h_norm(2)-um_cell{sn_He_12_5TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_hdTMZ_MGMT_M_24h_norm(2)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_24h(2)=wght_p53ser46_He_hdTMZ_MGMT_M_24h*(p53ser46_He_hdTMZ_MGMT_M_24h_norm(3)-um_cell{sn_He_25TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_hdTMZ_MGMT_M_24h_norm(3)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_24h(3)=wght_p53ser46_He_hdTMZ_MGMT_M_24h*(p53ser46_He_hdTMZ_MGMT_M_24h_norm(4)-um_cell{sn_He_50TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_hdTMZ_MGMT_M_24h_norm(4)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_24h(4)=wght_p53ser46_He_hdTMZ_MGMT_M_24h*(p53ser46_He_hdTMZ_MGMT_M_24h_norm(5)-um_cell{sn_He_75TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_hdTMZ_MGMT_M_24h_norm(5)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_24h(5)=wght_p53ser46_He_hdTMZ_MGMT_M_24h*(p53ser46_He_hdTMZ_MGMT_M_24h_norm(6)-um_cell{sn_He_100TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_hdTMZ_MGMT_M_24h_norm(6)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_24h(6)=wght_p53ser46_He_hdTMZ_MGMT_M_24h*(p53ser46_He_hdTMZ_MGMT_M_24h_norm(7)-um_cell{sn_He_125TMZ_MGMT_M_144h}(ind1,20))^2/p53ser46_He_hdTMZ_MGMT_M_24h_norm(7)^2;
       cost=cost+sum(cost_p53ser46_He_hdTMZ_MGMT_M_24h);
       
       cost_p53ser46_He_hdTMZ_MGMT_M_72h(1)=wght_p53ser46_He_hdTMZ_MGMT_M_72h*(p53ser46_He_hdTMZ_MGMT_M_72h_norm(2)-um_cell{sn_He_12_5TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_hdTMZ_MGMT_M_72h_norm(2)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_72h(2)=wght_p53ser46_He_hdTMZ_MGMT_M_72h*(p53ser46_He_hdTMZ_MGMT_M_72h_norm(3)-um_cell{sn_He_25TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_hdTMZ_MGMT_M_72h_norm(3)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_72h(3)=wght_p53ser46_He_hdTMZ_MGMT_M_72h*(p53ser46_He_hdTMZ_MGMT_M_72h_norm(4)-um_cell{sn_He_50TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_hdTMZ_MGMT_M_72h_norm(4)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_72h(4)=wght_p53ser46_He_hdTMZ_MGMT_M_72h*(p53ser46_He_hdTMZ_MGMT_M_72h_norm(5)-um_cell{sn_He_75TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_hdTMZ_MGMT_M_72h_norm(5)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_72h(5)=wght_p53ser46_He_hdTMZ_MGMT_M_72h*(p53ser46_He_hdTMZ_MGMT_M_72h_norm(6)-um_cell{sn_He_100TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_hdTMZ_MGMT_M_72h_norm(6)^2;
       cost_p53ser46_He_hdTMZ_MGMT_M_72h(6)=wght_p53ser46_He_hdTMZ_MGMT_M_72h*(p53ser46_He_hdTMZ_MGMT_M_72h_norm(7)-um_cell{sn_He_125TMZ_MGMT_M_144h}(ind2,20))^2/p53ser46_He_hdTMZ_MGMT_M_72h_norm(7)^2;
       cost=cost+sum(cost_p53ser46_He_hdTMZ_MGMT_M_72h);
       
%       He low doses MGMT+
       cost_DSB_He_ldTMZ_MGMT_P_72h(1)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_72h-um_cell{sn_He_0TMZ_MGMT_P_144h}(ind2,13))^2/DSB_72h^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(2)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(2)-um_cell{sn_He_1TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(2)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(3)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(3)-um_cell{sn_He_2TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(3)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(4)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(4)-um_cell{sn_He_3TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(4)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(5)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(5)-um_cell{sn_He_4TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(5)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(6)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(6)-um_cell{sn_He_5TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(6)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(7)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(7)-um_cell{sn_He_10TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(7)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(8)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(8)-um_cell{sn_He_15TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(8)^2;
       cost_DSB_He_ldTMZ_MGMT_P_72h(9)=wght_DSB_He_ldTMZ_MGMT_P_72h*(DSB_He_ldTMZ_MGMT_P_72h(9)-um_cell{sn_He_20TMZ_MGMT_P_144h}(ind2,13))^2/DSB_He_ldTMZ_MGMT_P_72h(9)^2;
       cost=cost+sum(cost_DSB_He_ldTMZ_MGMT_P_72h);
       
       
       for i=1:size(O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time,1)
           ind=O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time(i)*numb_comptime1+1;%<---------------------%That is because numb_comptime=(tf-ti)*numb_comptime1+1
           cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A(i)=wght_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A*(O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A(i)-(um_cell{sn_Ka_XTMZ_MGMT_M}(ind,8)+um_cell{sn_Ka_XTMZ_MGMT_M}(ind,10)+um_cell{sn_Ka_XTMZ_MGMT_M}(ind,11)))^2/O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A(i)^2;
       end
       cost=cost+sum(cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A);
       
       ind1=3*numb_comptime1+1;%That is because numb_comptime=(tf-ti)*numb_comptime1+1
%        cost_O6MeG_Ka_3h_MGMT_M(1)=wght_O6MeG_Ka_3h_MGMT_M*(O6Meg_Ka_3h_MGMT_M(1)-(um_cell{sn_He_0TMZ_MGMT_M_144h}(ind1,8)+um_cell{sn_He_0TMZ_MGMT_M_144h}(ind1,10)+um_cell{sn_He_0TMZ_MGMT_M_144h}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_M(1)^2;%%both data and model are zero
       cost_O6MeG_Ka_3h_MGMT_M(2)=wght_O6MeG_Ka_3h_MGMT_M*(O6Meg_Ka_3h_MGMT_M(2)-(um_cell{sn_Ka_20TMZ_MGMT_M}(ind1,8)+um_cell{sn_Ka_20TMZ_MGMT_M}(ind1,10)+um_cell{sn_Ka_20TMZ_MGMT_M}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_M(2)^2;
       cost_O6MeG_Ka_3h_MGMT_M(3)=wght_O6MeG_Ka_3h_MGMT_M*(O6Meg_Ka_3h_MGMT_M(3)-(um_cell{sn_Ka_50TMZ_MGMT_M}(ind1,8)+um_cell{sn_Ka_50TMZ_MGMT_M}(ind1,10)+um_cell{sn_Ka_50TMZ_MGMT_M}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_M(3)^2;
       cost_O6MeG_Ka_3h_MGMT_M(4)=wght_O6MeG_Ka_3h_MGMT_M*(O6Meg_Ka_3h_MGMT_M(4)-(um_cell{sn_Ka_75TMZ_MGMT_M}(ind1,8)+um_cell{sn_Ka_75TMZ_MGMT_M}(ind1,10)+um_cell{sn_Ka_75TMZ_MGMT_M}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_M(4)^2;
       cost=cost+sum(cost_O6MeG_Ka_3h_MGMT_M);
       
       cost_O6MeG_Ka_3h_MGMT_P(1)=wght_O6MeG_Ka_3h_MGMT_P*(O6Meg_Ka_3h_MGMT_P(1)-(um_cell{sn_Ka_20TMZ_MGMT_P}(ind1,8)+um_cell{sn_Ka_20TMZ_MGMT_P}(ind1,10)+um_cell{sn_Ka_20TMZ_MGMT_P}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_P(1)^2;
       cost_O6MeG_Ka_3h_MGMT_P(2)=wght_O6MeG_Ka_3h_MGMT_P*(O6Meg_Ka_3h_MGMT_P(2)-(um_cell{sn_Ka_50TMZ_MGMT_P}(ind1,8)+um_cell{sn_Ka_50TMZ_MGMT_P}(ind1,10)+um_cell{sn_Ka_50TMZ_MGMT_P}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_P(2)^2;
       cost_O6MeG_Ka_3h_MGMT_P(3)=wght_O6MeG_Ka_3h_MGMT_P*(O6Meg_Ka_3h_MGMT_P(3)-(um_cell{sn_Ka_100TMZ_MGMT_P}(ind1,8)+um_cell{sn_Ka_100TMZ_MGMT_P}(ind1,10)+um_cell{sn_Ka_100TMZ_MGMT_P}(ind1,11)))^2/O6Meg_Ka_3h_MGMT_P(3)^2;
       cost=cost+sum(cost_O6MeG_Ka_3h_MGMT_P);
       
       
       %Jackson TMZ survival
       surv_stddev_Jack_MGMT_M_factor=surv_stddev_Jack_MGMT_M;
       surv_stddev_Jack_MGMT_M_factor(surv_stddev_Jack_MGMT_M_factor<1e-10)=surv_stddev_Jack_MGMT_M_zerofactor;
       for i=2:size(surv_mean_Jack_MGMT_M,1)%The data at TMZ=0 not used
       cost_surv_Jack_MGMT_M(i-1)=wght_surv_Jack_MGMT_M*(surv_mean_Jack_MGMT_M(i)-Jack_surv_curvm_MGMT_M(i))^2/(surv_stddev_Jack_MGMT_M_factor(i))^2;
       end
       cost=cost+sum(cost_surv_Jack_MGMT_M);
       
       surv_stddev_Jack_MGMT_P_factor=surv_stddev_Jack_MGMT_P;
       surv_stddev_Jack_MGMT_P_factor(surv_stddev_Jack_MGMT_P_factor<1e-10)=surv_stddev_Jack_MGMT_P_zerofactor;
       for i=2:size(surv_mean_Jack_MGMT_P,1)-3%The data at TMZ=0 not used
       cost_surv_Jack_MGMT_P(i-1)=wght_surv_Jack_MGMT_P*(surv_mean_Jack_MGMT_P(i)-Jack_surv_curvm_MGMT_P(i))^2/(surv_stddev_Jack_MGMT_P_factor(i))^2;
       end
       
       cost_surv_Jack_MGMT_P(size(surv_mean_Jack_MGMT_P,1)-3)=wght_surv_Jack_MGMT_P_256TMZ*(surv_mean_Jack_MGMT_P(10)-Jack_surv_curvm_MGMT_P(10))^2/(surv_stddev_Jack_MGMT_P_factor(10))^2;
       cost_surv_Jack_MGMT_P(size(surv_mean_Jack_MGMT_P,1)-2)=wght_surv_Jack_MGMT_P_512TMZ*(surv_mean_Jack_MGMT_P(11)-Jack_surv_curvm_MGMT_P(11))^2/(surv_stddev_Jack_MGMT_P_factor(11))^2;
       cost_surv_Jack_MGMT_P(size(surv_mean_Jack_MGMT_P,1)-1)=wght_surv_Jack_MGMT_P_1024TMZ*(surv_mean_Jack_MGMT_P(12)-Jack_surv_curvm_MGMT_P(12))^2/(surv_stddev_Jack_MGMT_P_factor(12))^2;
       cost=cost+sum(cost_surv_Jack_MGMT_P);
       
       %He TMZ apoptosis
       %%MGMT-
       %%%low doses
       apop_stddev_He_ld_MGMT_M_factor=apop_stddev_He_ldTMZ_MGMT_M_120h;
       apop_stddev_He_ld_MGMT_M_factor(apop_stddev_He_ld_MGMT_M_factor<1e-10)=apop_stddev_He_ld_MGMT_M_zerofactor;
       for i=1:size(apop_mean_He_ldTMZ_MGMT_M_120h,1)%The data at TMZ=0 not used
       cost_apop_He_ld_MGMT_M_120h(i)=wght_apop_He_ld_MGMT_M_120h*(apop_mean_He_ldTMZ_MGMT_M_120h(i)-He_ld_apop_curvm_MGMT_M_120h(i))^2/(apop_stddev_He_ld_MGMT_M_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_ld_MGMT_M_120h);
       %%%high doses
       %%%%72h
       apop_stddev_He_hd_MGMT_M_factor=apop_stddev_He_hdTMZ_MGMT_M_72h;
       apop_stddev_He_hd_MGMT_M_factor(apop_stddev_He_hd_MGMT_M_factor<1e-10)=apop_stddev_He_hd_MGMT_M_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_M_72h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_M_72h(i)=wght_apop_He_hd_MGMT_M_72h*(apop_mean_He_hdTMZ_MGMT_M_72h(i)-He_hd_apop_curvm_MGMT_M_72h(i))^2/(apop_stddev_He_hd_MGMT_M_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_M_72h);
       %%%%96h
       apop_stddev_He_hd_MGMT_M_factor=apop_stddev_He_hdTMZ_MGMT_M_96h;
       apop_stddev_He_hd_MGMT_M_factor(apop_stddev_He_hd_MGMT_M_factor<1e-10)=apop_stddev_He_hd_MGMT_M_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_M_96h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_M_96h(i)=wght_apop_He_hd_MGMT_M_96h*(apop_mean_He_hdTMZ_MGMT_M_96h(i)-He_hd_apop_curvm_MGMT_M_96h(i))^2/(apop_stddev_He_hd_MGMT_M_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_M_96h);
       %%%%120h
       apop_stddev_He_hd_MGMT_M_factor=apop_stddev_He_hdTMZ_MGMT_M_120h;
       apop_stddev_He_hd_MGMT_M_factor(apop_stddev_He_hd_MGMT_M_factor<1e-10)=apop_stddev_He_hd_MGMT_M_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_M_120h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_M_120h(i)=wght_apop_He_hd_MGMT_M_120h*(apop_mean_He_hdTMZ_MGMT_M_120h(i)-He_hd_apop_curvm_MGMT_M_120h(i))^2/(apop_stddev_He_hd_MGMT_M_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_M_120h);
       %%%%144h
       apop_stddev_He_hd_MGMT_M_factor=apop_stddev_He_hdTMZ_MGMT_M_144h;
       apop_stddev_He_hd_MGMT_M_factor(apop_stddev_He_hd_MGMT_M_factor<1e-10)=apop_stddev_He_hd_MGMT_M_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_M_144h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_M_144h(i)=wght_apop_He_hd_MGMT_M_144h*(apop_mean_He_hdTMZ_MGMT_M_144h(i)-He_hd_apop_curvm_MGMT_M_144h(i))^2/(apop_stddev_He_hd_MGMT_M_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_M_144h);
       
       %%MGMT+
       %%%low doses
       apop_stddev_He_ld_MGMT_P_factor=apop_stddev_He_ldTMZ_MGMT_P_120h;
       apop_stddev_He_ld_MGMT_P_factor(apop_stddev_He_ld_MGMT_P_factor<1e-10)=apop_stddev_He_ld_MGMT_P_zerofactor;
       for i=1:size(apop_mean_He_ldTMZ_MGMT_P_120h,1)%The data at TMZ=0 not used
       cost_apop_He_ld_MGMT_P_120h(i)=wght_apop_He_ld_MGMT_P_120h*(apop_mean_He_ldTMZ_MGMT_P_120h(i)-He_ld_apop_curvm_MGMT_P_120h(i))^2/(apop_stddev_He_ld_MGMT_P_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_ld_MGMT_P_120h);
       %%%high doses
       %%%%72h
       apop_stddev_He_hd_MGMT_P_factor=apop_stddev_He_hdTMZ_MGMT_P_72h;
       apop_stddev_He_hd_MGMT_P_factor(apop_stddev_He_hd_MGMT_P_factor<1e-10)=apop_stddev_He_hd_MGMT_P_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_P_72h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_P_72h(i)=wght_apop_He_hd_MGMT_P_72h*(apop_mean_He_hdTMZ_MGMT_P_72h(i)-He_hd_apop_curvm_MGMT_P_72h(i))^2/(apop_stddev_He_hd_MGMT_P_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_P_72h);
       %%%%96h
       apop_stddev_He_hd_MGMT_P_factor=apop_stddev_He_hdTMZ_MGMT_P_96h;
       apop_stddev_He_hd_MGMT_P_factor(apop_stddev_He_hd_MGMT_P_factor<1e-10)=apop_stddev_He_hd_MGMT_P_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_P_96h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_P_96h(i)=wght_apop_He_hd_MGMT_P_96h*(apop_mean_He_hdTMZ_MGMT_P_96h(i)-He_hd_apop_curvm_MGMT_P_96h(i))^2/(apop_stddev_He_hd_MGMT_P_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_P_96h);
       %%%%120h
       apop_stddev_He_hd_MGMT_P_factor=apop_stddev_He_hdTMZ_MGMT_P_120h;
       apop_stddev_He_hd_MGMT_P_factor(apop_stddev_He_hd_MGMT_P_factor<1e-10)=apop_stddev_He_hd_MGMT_P_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_P_120h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_P_120h(i)=wght_apop_He_hd_MGMT_P_120h*(apop_mean_He_hdTMZ_MGMT_P_120h(i)-He_hd_apop_curvm_MGMT_P_120h(i))^2/(apop_stddev_He_hd_MGMT_P_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_P_120h);
       %%%%144h
       apop_stddev_He_hd_MGMT_P_factor=apop_stddev_He_hdTMZ_MGMT_P_144h;
       apop_stddev_He_hd_MGMT_P_factor(apop_stddev_He_hd_MGMT_P_factor<1e-10)=apop_stddev_He_hd_MGMT_P_zerofactor;
       for i=1:size(apop_mean_He_hdTMZ_MGMT_P_144h,1)%The data at TMZ=0 not used
       cost_apop_He_hd_MGMT_P_144h(i)=wght_apop_He_hd_MGMT_P_144h*(apop_mean_He_hdTMZ_MGMT_P_144h(i)-He_hd_apop_curvm_MGMT_P_144h(i))^2/(apop_stddev_He_hd_MGMT_P_factor(i))^2;
       end
       cost=cost+sum(cost_apop_He_hd_MGMT_P_144h);
       
       
       
end

end