function [k_BERInhib_Nip,k_HRInhib_RI1,mN370,DSB0,ATR0,pATR0,...
    Chk10,pChk10,Cdc250,p530,p53_ser460...
    ] = inhibition_func(inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    k_addEx,k_BER,k_DSBN,k_HR,n_add,K_add,...
    kf_ATR,k_ATR,kd_ATR,kd_pATR,kf_Chk1,kd_Chk1,k_Chk1,kd_pChk1,...
    Cdc250,kf_cdc25,k_cdc25,kd_cdc25,k_CyA,kf_p53,...
    k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kp_ser46,Mdm20,t0_cc,M_cc,A_cc,n_cc, K_cc,omega_cc,phi_cc,K_cdc25,n_cdc25)


%% BER inhibition
k_BERInhib_Nip=inhib_factor_BER_Nip*k_BER;
%% HR inhibition
k_HRInhib_RI1=inhib_factor_HR_RI1*k_HR;

%%%%%
%% Update of related initial conditions
CyA0 =CyclinA_fun(0,Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);
mN370=k_addEx/(k_BERInhib_Nip+k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc)));
% mN370=mN37_72h;%
DSB0=mN370*k_DSBN*(1+k_CyA*(CyA0^n_cc)/(CyA0^n_cc+K_cc^n_cc))/k_HRInhib_RI1;

% ATR steady state
ATR0=kf_ATR/(k_ATR*(DSB0^n_add)/(DSB0^n_add+K_add^n_add)+kd_ATR);

% pATR steady state
pATR0=k_ATR*ATR0*(DSB0^n_add)/((DSB0^n_add+K_add^n_add)*kd_pATR);

% Chk1 Steady state condition
Chk10=kf_Chk1/(k_Chk1*pATR0+kd_Chk1);

% pChk1 Steady state condition
pChk10=k_Chk1*Chk10*pATR0/kd_pChk1;

% Cdc25 steady state
Cdc250=kf_cdc25/(k_cdc25*pChk10+kd_cdc25);

% p53 steady state
p530=kf_p53*(1+k_p53*(pATR0^n_ATR)/(pATR0^n_ATR+K_ATR^n_ATR))/(kd_p53+kd_p53Mdm2*(Mdm20^n_Mdm2)/(Mdm20^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*pATR0);

% p53ser46 steady state
p53_ser460=0.05*p530;







end
