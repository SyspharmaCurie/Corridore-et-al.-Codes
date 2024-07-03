function [TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,mO60,RNA_MGMT0,MGMT0_U87_LN229,GT0,SSB0,Cdc250,RNA_Mdm20,Mdm20,cell_pop0,cell_pop_norm0_Jack_MGMT_M] = def_int_cond()
    
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
cell_pop_norm0_Jack_MGMT_M=70.0112166364;

end

