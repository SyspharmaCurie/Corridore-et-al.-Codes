function [kf_MGMT,K_cc,k_addEx,mN370,DSB0,...
    ATR0,pATR0,Chk10,pChk10,...
    kf_cdc25,p530,p53_ser460,kd_ser46,ktd_Mdm2,kd_Mdm2...
    ] = param_dep_elem(...
    RNA_MGMT0,MGMT0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,k_HR,k_DSBN,k_CyA,n_cc,k_BER,...
    kf_ATR,k_ATR,n_add,K_add,kd_ATR,kd_pATR,...
    kf_Chk1,k_Chk1,kd_Chk1,kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,kp_ser46,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2)


%% linear regression
% kd_pATR = comp_lin_regr_K_add_kd_pATR(K_add);
% K_ATR = comp_lin_regr_k_ATR_K_ATR(k_ATR);
% kp_ser46 = comp_lin_regr_k_ATR_kp_ser46(k_ATR);
% if MGMT0<1e-10
%     k_MGMT=0;
% else
%     k_MGMT = comp_lin_regr_MGMT_P0_k_MGMT(MGMT0);
% end
%% MGMT steady state
kf_MGMT=MGMT0*kd_MGMT/RNA_MGMT0;%comptuted
%% Cell Cycle
K_cc=0.3*A_cc+M_cc;
%% DSB steady state
CyA_72h = CyclinA_fun(72,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
DSB_72h=DSB_72h_fac*8.744850708785361e-06;%From DSB He data
mN37_72h=(k_HR*DSB_72h)/(k_DSBN*(1+k_CyA*(CyA_72h^n_cc)/(CyA_72h^n_cc+K_cc^n_cc)));
%% N73mAG steady state
k_addEx=mN37_72h*(k_BER+k_DSBN*(1+k_CyA*(CyA_72h^n_cc)/(CyA_72h^n_cc+K_cc^n_cc)));
CyA0 =CyclinA_fun(0,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
mN370=k_addEx/(k_BER+k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc)));
% mN370=mN37_72h;%
DSB0=mN370*k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc))/k_HR;
%% ATR steady state
ATR0=kf_ATR/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);
%% pATR steady state
pATR0=k_ATR*ATR0*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);
%% Chk1 Steady state condition
Chk10=kf_Chk1/(k_Chk1*pATR0+kd_Chk1);

%% pChk1 Steady state condition
pChk10=k_Chk1*Chk10*pATR0/kd_pChk1;

%%  Cdc25 steady state
kf_cdc25=(k_cdc25*pChk10+kd_cdc25)*Cdc250;

%% p53 steady state
p530=kf_p53*(1+k_p53*(pATR0^n_ATR)/(pATR0^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0);

%% p53ser46 steady state
p53_ser460=0.05*p530;
kd_ser46=kp_ser46*p530*pATR0/p53_ser460;

%% Mdm2RNA steady state
ktd_Mdm2=(kt_Mdm2+kt_Mdm2p53*((p530+p53_ser460)^n_p53)/((p530+p53_ser460)^n_p53+K_p53^n_p53))/RNA_Mdm20;% It corresponds to 2.3328 of Sturrock 2011 %1.2; %%Ma 2005

%% Mdm2 steady state
kd_Mdm2=kf_Mdm2*RNA_Mdm20/Mdm20; % It does NOT corresond with 3.3336 of Sturrock 2011


end

