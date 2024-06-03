function [ktd_MGMT,kf_MGMT_M,kf_MGMT_P,K_cc,k_addEx,mN370,DSB0,...
    ATR0_MGMT_M,pATR0_MGMT_M,...
    ATR0_MGMT_P,pATR0_MGMT_P,...
    Chk10_MGMT_M,kf_Chk1_MGMT_P,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kd_ser46_MGMT_M,kd_ser46_MGMT_P,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kd_Mdm2] = param_dep_elem(...
    kt_MGMT,RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,k_HR,k_DSBN,k_CyA,n_cc,...
    k_BER,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,n_add,K_add,kd_ATR,...
    kd_pATR,...
    kf_Chk1_MGMT_M,k_Chk1,kd_Chk1,C_Chk1,...
    kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,kp_ser46,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2)


%% MGMT RNA steady state
ktd_MGMT=kt_MGMT/RNA_MGMT0;
%% MGMT steady state
kf_MGMT_M=MGMT0_U87_LN229*kd_MGMT/RNA_MGMT0;%comptuted
kf_MGMT_P=MGMT_P0*kd_MGMT/RNA_MGMT0;
%% Cell Cycle
K_cc=0.3*A_cc+M_cc;
%% DSB steady state
CyA_72h = CyclinA_fun(72,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
DSB_He_ldTMZ_MGMT_M_72h=8.744850708785361e-06;
DSB_72h=DSB_72h_fac*DSB_He_ldTMZ_MGMT_M_72h;%0.8*DSB_He_ldTMZ_MGMT_M_72h(1);%Defined observing the fit %(DSB_He_ldTMZ_MGMT_M_72h(1)+DSB_He_ldTMZ_MGMT_P_72h(1))/2;
mN37_72h=(k_HR*DSB_72h)/(k_DSBN*(1+k_CyA*(CyA_72h^n_cc)/(CyA_72h^n_cc+K_cc^n_cc)));
%% N73mAG steady state
k_addEx=mN37_72h*(k_BER+k_DSBN*(1+k_CyA*(CyA_72h^n_cc)/(CyA_72h^n_cc+K_cc^n_cc)));

CyA0 =CyclinA_fun(0,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
mN370=k_addEx/(k_BER+k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc)));
% mN370=mN37_72h;%
DSB0=mN370*k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc))/k_HR;

%% ATR steady state
ATR0_MGMT_M=kf_ATR_MGMT_M/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);
ATR0_MGMT_P=kf_ATR_MGMT_P/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);

%% pATR steady state
pATR0_MGMT_M=k_ATR*ATR0_MGMT_M*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);
pATR0_MGMT_P=k_ATR*ATR0_MGMT_P*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);
%% Chk1 Steady state condition
Chk10_MGMT_M=kf_Chk1_MGMT_M/(k_Chk1*pATR0_MGMT_M+kd_Chk1);
kf_Chk1_MGMT_P=C_Chk1*kf_Chk1_MGMT_M;
Chk10_MGMT_P=kf_Chk1_MGMT_P/(k_Chk1*pATR0_MGMT_P+kd_Chk1);

%% pChk1 Steady state condition
%MGMT-
pChk10_MGMT_M=k_Chk1*Chk10_MGMT_M*pATR0_MGMT_M/kd_pChk1;
%MGMT+
pChk10_MGMT_P=k_Chk1*Chk10_MGMT_P*pATR0_MGMT_P/kd_pChk1;

%%  Cdc25 steady state
kf_cdc25_MGMT_M=(k_cdc25*pChk10_MGMT_M+kd_cdc25)*Cdc250;
kf_cdc25_MGMT_P=(k_cdc25*pChk10_MGMT_P+kd_cdc25)*Cdc250;

%% p53 steady state
p530_MGMT_M=kf_p53*(1+k_p53*(pATR0_MGMT_M^n_ATR)/(pATR0_MGMT_M^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0_MGMT_M);
p530_MGMT_P=kf_p53*(1+k_p53*(pATR0_MGMT_P^n_ATR)/(pATR0_MGMT_P^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0_MGMT_P);

%% p53ser46 steady state
p53_ser460_MGMT_M=0.05*p530_MGMT_M;
p53_ser460_MGMT_P=0.05*p530_MGMT_P;
kd_ser46_MGMT_M=kp_ser46*p530_MGMT_M*pATR0_MGMT_M/p53_ser460_MGMT_M;
kd_ser46_MGMT_P=kp_ser46*p530_MGMT_P*pATR0_MGMT_P/p53_ser460_MGMT_P;

%% Mdm2RNA steady state
ktd_Mdm2_MGMT_M=(kt_Mdm2+kt_Mdm2p53*((p530_MGMT_M+p53_ser460_MGMT_M)^n_p53)/((p530_MGMT_M+p53_ser460_MGMT_M)^n_p53+K_p53^n_p53))/RNA_Mdm20;% It corresponds to 2.3328 of Sturrock 2011 %1.2; %%Ma 2005
ktd_Mdm2_MGMT_P=(kt_Mdm2+kt_Mdm2p53*((p530_MGMT_P+p53_ser460_MGMT_P)^n_p53)/((p530_MGMT_P+p53_ser460_MGMT_P)^n_p53+K_p53^n_p53))/RNA_Mdm20;% It corresponds to 2.3328 of Sturrock 2011 %1.2; %%Ma 2005

%% Mdm2 steady state
kd_Mdm2=kf_Mdm2*RNA_Mdm20/Mdm20; % It does NOT corresond with 3.3336 of Sturrock 2011


end

