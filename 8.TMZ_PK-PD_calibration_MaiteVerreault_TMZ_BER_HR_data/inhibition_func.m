function [k_BERInhib_Nip,k_HRInhib_RI1,...
    mN370,DSB0,ATR0_MGMT_M,ATR0_MGMT_P,pATR0_MGMT_M,pATR0_MGMT_P,...
    Chk10_MGMT_M,Chk10_MGMT_P,pChk10_MGMT_M,pChk10_MGMT_P,...
    Cdc250_MGMT_M,Cdc250_MGMT_P,p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P...
    ] = inhibition_func(inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,kd_ATR,kd_pATR,kf_Chk1_MGMT_M,kd_Chk1,k_Chk1,kd_pChk1,C_Chk1,...
    Cdc250,kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25)


%% BER inhibition
k_BERInhib_Nip=inhib_factor_BER_Nip*k_BER;
%% HR inhibition
k_HRInhib_RI1=inhib_factor_HR_RI1*k_HR;
%%%%%
%% Update of related initial conditions
CyA0 =CyclinA_fun(0,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
mN370=k_addEx/(k_BERInhib_Nip+k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc)));
DSB0=mN370*k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc))/k_HRInhib_RI1;

% ATR steady state
ATR0_MGMT_M=kf_ATR_MGMT_M/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);
ATR0_MGMT_P=kf_ATR_MGMT_P/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);

% pATR steady state
pATR0_MGMT_M=k_ATR*ATR0_MGMT_M*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);
pATR0_MGMT_P=k_ATR*ATR0_MGMT_P*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);

% Chk1 Steady state condition
Chk10_MGMT_M=kf_Chk1_MGMT_M/(k_Chk1*pATR0_MGMT_M+kd_Chk1);
kf_Chk1_MGMT_P=C_Chk1*kf_Chk1_MGMT_M;
Chk10_MGMT_P=kf_Chk1_MGMT_P/(k_Chk1*pATR0_MGMT_P+kd_Chk1);

% pChk1 Steady state condition
pChk10_MGMT_M=k_Chk1*Chk10_MGMT_M*pATR0_MGMT_M/kd_pChk1;
pChk10_MGMT_P=k_Chk1*Chk10_MGMT_P*pATR0_MGMT_P/kd_pChk1;

% Cdc25 steady state
Cdc250_MGMT_M=kf_cdc25_MGMT_M/(k_cdc25*pChk10_MGMT_M+kd_cdc25);
Cdc250_MGMT_P=kf_cdc25_MGMT_P/(k_cdc25*pChk10_MGMT_M+kd_cdc25);

% p53 steady state
p530_MGMT_M=kf_p53*(1+k_p53*(pATR0_MGMT_M^n_ATR)/(pATR0_MGMT_M^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0_MGMT_M);
p530_MGMT_P=kf_p53*(1+k_p53*(pATR0_MGMT_P^n_ATR)/(pATR0_MGMT_P^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0_MGMT_P);

% p53ser46 steady state
p53_ser460_MGMT_M=0.05*p530_MGMT_M;
p53_ser460_MGMT_P=0.05*p530_MGMT_P;







end

