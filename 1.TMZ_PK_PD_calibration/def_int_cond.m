function [TMZout0_Jack,TMZout0_Jack_inhATR,TMZout0_Aas,TMZout0_He_ld,TMZout0_He_hd,TMZout0_Ka_MGMT_M,TMZout0_Ka_MGMT_P,TMZout0_MAX,TMZout0_surv_Jack_MGMT_M,TMZout0_surv_Jack_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,mO60,RNA_MGMT0,MGMT0_U87_LN229,GT0,SSB0,Cdc250,RNA_Mdm20,Mdm20,cell_pop0,cell_pop_norm0_Jack_MGMT_M,cell_pop_norm0_He] = def_int_cond(...
    TMZdata_nosurv_Jack_data,TMZdata_Jack_inhATR,TMZdata_Aas,TMZdata_He_ld,TMZdata_He_hd,TMZdata_O6Meg_Ka_3h_MGMT_M,TMZdata_O6Meg_Ka_3h_MGMT_P,TMZdata_surv_Jack_MGMT_M,TMZdata_surv_Jack_MGMT_P)
    

    TMZout0_Jack=TMZdata_nosurv_Jack_data;%in microM %Western Blot Fig2A% Parameter to be changed for different drug concentrations 1000 / 500 / 62 microM%%%
    TMZout0_Jack_inhATR=TMZdata_Jack_inhATR';%in microM %Western Blot Fig2A
    TMZout0_Aas=TMZdata_Aas;%in microM
    TMZout0_He_ld=TMZdata_He_ld';%in microM
    TMZout0_He_hd=TMZdata_He_hd(2:end)';%in microM
    TMZout0_Ka_MGMT_M=TMZdata_O6Meg_Ka_3h_MGMT_M(2:end)';
    TMZout0_Ka_MGMT_P=TMZdata_O6Meg_Ka_3h_MGMT_P';
    TMZout0_MAX=3e3;%max([TMZout0_Jack TMZout0_Jack_inhATR TMZout0_Aas TMZout0_He_ld TMZout0_He_hd]);
    TMZout0_surv_Jack_MGMT_M=[TMZdata_surv_Jack_MGMT_M; 3e3]';
    TMZout0_surv_Jack_MGMT_P=[TMZdata_surv_Jack_MGMT_P; 3e3]';
    TMZin0=0;
    MTICout0=0;
    MTICin0=0;  
    AICout0=0; 
    AICin0=0;
    Cat0=0;%Steady state condition
    mO60=0;%Steady state condition
    RNA_MGMT0=1.399e-5; %TMZ_PKPD_Model_parameter_values5_v3.numbers
    MGMT0=3.86e-2; % TMZ_PKPD_Model_parameter_values5_v3.numbers
    % MGMT_P0=15e-2;%20e-2;%ref. Jackson 2019, 500 nM of O6BG (MGMT inhibitor)
    MGMT0_U87_LN229=0;%ref Aasland 2020 for cell lines U87 e LN229, Materials and Methods
    GT0=0;%Steady state condition
    SSB0=0;%Steady state condition
    % DSB0=(DSB_He_ldTMZ_MGMT_M_72h(1)+DSB_He_ldTMZ_MGMT_P_72h(1))/2;
    % ATR_tot=0.00012;%TMZ_PKPD_Model_parameter_values5_v3.numbers
    % Chk10=0.0155;%TMZ_PKPD_Model_parameter_values5_v3.numbers
    Cdc250=4.5273;%TMZ_PKPD_Model_parameter_values5_v3.numbers
    % p530=0.12;%Ma et al. 2005 %0.001;%
    % p53_ser460=0.001;

    RNA_Mdm20=4.317e-03;%TMZ_PKPD_Model_parameter_values5_v3.numbers %0.05;%Ma 2005 %
    Mdm20=0.05173757;%TMZ_PKPD_Model_parameter_values5_v3.numbers %2;%Ma 2005 %

    cell_pop0=100;
    cell_pop_norm0_Jack_MGMT_M=70.0059666424;
    cell_pop_norm0_He=1;

end

