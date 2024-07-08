function [k_addO,RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kt_MGMT,ktd_MGMT,kf_MGMT_M,kf_MGMT_P,k_MGMT,kd_MGMT,k_GT,k_MMR,...
    k_addN,k_addEx,mN370,k_BER,k_DSBO,k_DSBN,DSB0,k_HR,ATR0_MGMT_M,ATR0_MGMT_P,pATR0_MGMT_M,pATR0_MGMT_P,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,Chk10_MGMT_M,Chk10_MGMT_P,pChk10_MGMT_M,pChk10_MGMT_P,kf_Chk1_MGMT_M,kf_Chk1_MGMT_P,kd_Chk1,k_Chk1,kd_pChk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kf_p53,...
    k_p53,kd_p53,kd_p53Mdm2,kp_ser46,kd_ser46_MGMT_M,kd_ser46_MGMT_P,kt_Mdm2,kt_Mdm2p53,RNA_Mdm20,Mdm20,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kf_Mdm2,kd_Mdm2] = inhibition_func(inhib_factor,...
    k_addO,RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kt_MGMT,ktd_MGMT,kf_MGMT_M,kf_MGMT_P,k_MGMT,kd_MGMT,k_GT,k_MMR,...
    k_addN,k_addEx,mN370,k_BER,k_DSBO,k_DSBN,DSB0,k_HR,ATR0_MGMT_M,ATR0_MGMT_P,pATR0_MGMT_M,pATR0_MGMT_P,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,Chk10_MGMT_M,Chk10_MGMT_P,pChk10_MGMT_M,pChk10_MGMT_P,kf_Chk1_MGMT_M,kf_Chk1_MGMT_P,kd_Chk1,k_Chk1,kd_pChk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kf_p53,...
    k_p53,kd_p53,kd_p53Mdm2,kp_ser46,kd_ser46_MGMT_M,kd_ser46_MGMT_P,kt_Mdm2,kt_Mdm2p53,RNA_Mdm20,Mdm20,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kf_Mdm2,kd_Mdm2)

%% MGMT-mRNA traduction - 1
RNA_MGMT0=RNA_MGMT0*inhib_factor(1);
MGMT0_U87_LN229=MGMT0_U87_LN229*inhib_factor(1);
MGMT_P0=MGMT_P0*inhib_factor(1);
kt_MGMT=kt_MGMT*inhib_factor(1);
%% G:T - 2
k_GT=k_GT*inhib_factor(2);
%% SSB by MMR - 3
k_MMR=k_MMR*inhib_factor(3);
%% BER - 4
k_BER=k_BER*inhib_factor(4);
%% O6meG-depending DSB - 5
k_DSBO=k_DSBO*inhib_factor(5);
%% N73meAG-depending DSB - 6
k_DSBN=k_DSBN*inhib_factor(6);
%% HR - 7
k_HR=k_HR*inhib_factor(7);
%% ATR production - 8
ATR0_MGMT_M=ATR0_MGMT_M*inhib_factor(8);
ATR0_MGMT_P=ATR0_MGMT_P*inhib_factor(8);
pATR0_MGMT_M=pATR0_MGMT_M*inhib_factor(8);
pATR0_MGMT_P=pATR0_MGMT_P*inhib_factor(8);
kf_ATR_MGMT_M=kf_ATR_MGMT_M*inhib_factor(8);
kf_ATR_MGMT_P=kf_ATR_MGMT_P*inhib_factor(8);
%% ATR activation - 9
pATR0_MGMT_M=pATR0_MGMT_M*inhib_factor(9);
pATR0_MGMT_P=pATR0_MGMT_P*inhib_factor(9);
k_ATR=k_ATR*inhib_factor(9);
%% Chk1 production - 10
Chk10_MGMT_M=Chk10_MGMT_M*inhib_factor(10);
Chk10_MGMT_P=Chk10_MGMT_P*inhib_factor(10);
pChk10_MGMT_M=pChk10_MGMT_M*inhib_factor(10);
pChk10_MGMT_P=pChk10_MGMT_P*inhib_factor(10);
kf_Chk1_MGMT_M=kf_Chk1_MGMT_M*inhib_factor(10);
kf_Chk1_MGMT_P=kf_Chk1_MGMT_P*inhib_factor(10);
%% Chk1 activation - 11
pChk10_MGMT_M=pChk10_MGMT_M*inhib_factor(11);
pChk10_MGMT_P=pChk10_MGMT_P*inhib_factor(11);
k_Chk1=k_Chk1*inhib_factor(11);
%% Cdc25 production - 12
Cdc250=Cdc250*inhib_factor(12);
kf_cdc25_MGMT_M=kf_cdc25_MGMT_M*inhib_factor(12);
kf_cdc25_MGMT_P=kf_cdc25_MGMT_P*inhib_factor(12);
%% Cdc25 activation - 13
k_cdc25=k_cdc25*inhib_factor(13);
%% Cell-cycle effect - 14
k_CyA=k_CyA*inhib_factor(14);
%% Mdm2-mRNA basale traduction - 15
kt_Mdm2=kt_Mdm2*inhib_factor(15);













end

