function [pT, pT2, k_addO,RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kt_MGMT,k_MGMT,kd_MGMT,k_GT,k_MMR,...
    k_addN,k_BER,k_DSBO,k_DSBN,k_HR,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,...
    Cdc250,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,kd_p53,kd_p53Mdm2,kp_ser46,kt_Mdm2,kt_Mdm2p53,RNA_Mdm20,Mdm20,kf_Mdm2,k_apop,...
    mN370,DSB0,ATR0_MGMT_M,ATR0_MGMT_P,pATR0_MGMT_M,pATR0_MGMT_P,Chk10_MGMT_M,Chk10_MGMT_P,kf_Chk1_MGMT_P,pChk10_MGMT_M,pChk10_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P] = inhibition_func(inhib_factor,...
    pT, pT2,k_addO,k_addEx,RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kt_MGMT,k_MGMT,kd_MGMT,k_GT,k_MMR,...
    k_addN,k_BER,k_DSBO,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,C_Chk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,Mdm20,kf_Mdm2,k_apop,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25)


%TMZ PK
pT=pT*inhib_factor(1);
pT2=pT2*inhib_factor(2);

%Adduct formation
k_addO=k_addO*inhib_factor(3);
k_addN=k_addN*inhib_factor(4);

%% MGMT-mRNA traduction - 
RNA_MGMT0=RNA_MGMT0*inhib_factor(5);
MGMT0_U87_LN229=MGMT0_U87_LN229*inhib_factor(5);
MGMT_P0=MGMT_P0*inhib_factor(5);
kt_MGMT=kt_MGMT*inhib_factor(5);
%MGMT deg
kd_MGMT=kd_MGMT*inhib_factor(6);
%MGMT0?

%MGMT activity
k_MGMT=k_MGMT*inhib_factor(7);

%% BER - 8
k_BER=k_BER*inhib_factor(8);
%% G:T - 
k_GT=k_GT*inhib_factor(9);
%% SSB by MMR - 
k_MMR=k_MMR*inhib_factor(10);
%% O6meG-depending DSB - 
k_DSBO=k_DSBO*inhib_factor(11);
%% N73meAG-depending DSB - 
k_DSBN=k_DSBN*inhib_factor(12);


%% HR - 7
k_HR=k_HR*inhib_factor(13);
%% ATR production - 8
% ATR0_MGMT_M=ATR0_MGMT_M*inhib_factor(8);
% ATR0_MGMT_P=ATR0_MGMT_P*inhib_factor(8);
% pATR0_MGMT_M=pATR0_MGMT_M*inhib_factor(8);
% pATR0_MGMT_P=pATR0_MGMT_P*inhib_factor(8);
kf_ATR_MGMT_M=kf_ATR_MGMT_M*inhib_factor(14);
kf_ATR_MGMT_P=kf_ATR_MGMT_P*inhib_factor(14);
%%ATR ged
kd_ATR=kd_ATR*inhib_factor(15);

%% ATR activation - 9
% pATR0_MGMT_M=pATR0_MGMT_M*inhib_factor(9);
% pATR0_MGMT_P=pATR0_MGMT_P*inhib_factor(9);
k_ATR=k_ATR*inhib_factor(16);
%pATR deg
kd_pATR=kd_pATR*inhib_factor(17);

%% Chk1 production - 10
% Chk10_MGMT_M=Chk10_MGMT_M*inhib_factor(10);
% Chk10_MGMT_P=Chk10_MGMT_P*inhib_factor(10);
% pChk10_MGMT_M=pChk10_MGMT_M*inhib_factor(10);
% pChk10_MGMT_P=pChk10_MGMT_P*inhib_factor(10);
kf_Chk1_MGMT_M=kf_Chk1_MGMT_M*inhib_factor(18);

%CHK1 deg
kd_Chk1=kd_Chk1*inhib_factor(19);
%% Chk1 activation - 11
% pChk10_MGMT_M=pChk10_MGMT_M*inhib_factor(11);
% pChk10_MGMT_P=pChk10_MGMT_P*inhib_factor(11);
k_Chk1=k_Chk1*inhib_factor(20);
%%pCHK1 deg
kd_pChk1=kd_pChk1*inhib_factor(21);

%% Cell-cycle effect - 14
k_CyA=k_CyA*inhib_factor(22);
%% Cdc25 production - 12
kf_cdc25_MGMT_M=kf_cdc25_MGMT_M*inhib_factor(23);
kf_cdc25_MGMT_P=kf_cdc25_MGMT_P*inhib_factor(23);

% kf_cdc25_MGMT_M=kf_cdc25_MGMT_M*inhib_factor(12);
% kf_cdc25_MGMT_P=kf_cdc25_MGMT_P*inhib_factor(12);
%%CDC25 deg
kd_cdc25=kd_cdc25*inhib_factor(24);
%% Cdc25 activation - 13
k_cdc25=k_cdc25*inhib_factor(25);%pb here due to updaye of kfcdc25

%%P53
kf_p53=kf_p53*inhib_factor(26);
kd_p53=kd_p53*inhib_factor(27);
k_p53=k_p53*inhib_factor(28);
kd_p53Mdm2=kd_p53Mdm2*inhib_factor(29);
kp_ser46=kp_ser46*inhib_factor(30);

%%Mdm2
kt_Mdm2p53=kt_Mdm2p53*inhib_factor(31);

%Mdm2 translation
kf_Mdm2=kf_Mdm2*inhib_factor(32);
Mdm20=Mdm20*inhib_factor(32);

%Cell death
k_apop=k_apop*inhib_factor(33);

%%%%%
%% Update of related initial conditions
CyA0 =CyclinA_fun(0,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
mN370=k_addEx/(k_BER+k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc)));
% mN370=mN37_72h;%
DSB0=mN370*k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc))/k_HR;

% ATR steady state
ATR0_MGMT_M=kf_ATR_MGMT_M/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);
ATR0_MGMT_P=kf_ATR_MGMT_P/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);

% pATR steady state
pATR0_MGMT_M=k_ATR*ATR0_MGMT_M*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);
pATR0_MGMT_P=k_ATR*ATR0_MGMT_P*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);
%% Chk1 Steady state condition
Chk10_MGMT_M=kf_Chk1_MGMT_M/(k_Chk1*pATR0_MGMT_M+kd_Chk1);
kf_Chk1_MGMT_P=C_Chk1*kf_Chk1_MGMT_M;
Chk10_MGMT_P=kf_Chk1_MGMT_P/(k_Chk1*pATR0_MGMT_P+kd_Chk1);

% pChk1 Steady state condition
%MGMT-
pChk10_MGMT_M=k_Chk1*Chk10_MGMT_M*pATR0_MGMT_M/kd_pChk1;
%MGMT+
pChk10_MGMT_P=k_Chk1*Chk10_MGMT_P*pATR0_MGMT_P/kd_pChk1;

%%  Cdc25 steady state
Cdc250=kf_cdc25_MGMT_M/(k_cdc25*pChk10_MGMT_M+kd_cdc25);


%% p53 steady state
p530_MGMT_M=kf_p53*(1+k_p53*(pATR0_MGMT_M^n_ATR)/(pATR0_MGMT_M^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0_MGMT_M);
p530_MGMT_P=kf_p53*(1+k_p53*(pATR0_MGMT_P^n_ATR)/(pATR0_MGMT_P^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0_MGMT_P);

%% p53ser46 steady state
p53_ser460_MGMT_M=0.05*p530_MGMT_M;
p53_ser460_MGMT_P=0.05*p530_MGMT_P;







end

