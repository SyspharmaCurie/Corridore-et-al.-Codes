function [pA,pT2,pA2,kT0,lambdaT,kM0,lambdaM,pH0,kcat,dna,kd_MGMT,omega_cc,t0_cc,M_cc,A_cc,phi_cc,n_cc,...
    k_GT,k_MMR,k_BER,kd_ATR,n_add,kf_Chk1_MGMT_M,kd_Chk1,kd_cdc25,n_cdc25,...
    n_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kt_Mdm2,kt_Mdm2p53,n_p53,kf_Mdm2,n_p53int,...
    k_addO,k_addN,DSB_72h_fac,k_DSBO,k_DSBN,K_add,k_Chk1,C_Chk1,...
    kd_pChk1,k_cdc25,K_cdc25,K_p53,cell_pop_norm0_Verre_MGMT_P...
    ] = def_params()
%influx
pA=0.003561;
%efflux
pT2=0.007785;%estimated
pA2=0.007555;
%pH
kT0=1.1e-7;%estimated
lambdaT= 2.086665;%estimated
kM0=292;%estimated
lambdaM=0.3107;%estimated
%%param pH
pH0=7.5698;
%TMZ cation
kcat=6000;%estimated
%Base pairs concentration times real k_add
dna=5500;

%MGTM production
% kt_MGMT=1.04613974434337e-6;%TMZ_PKPD_Model_parameter_values5_v3.numbers
kd_MGMT=0.011;%estimated
% kf_MGMT_P=29.011;%comptuted
% kf_MGMT_P=MGMT_P0*kd_MGMT/RNA_MGMT0;%comptuted
% k_MGMT=23.4e3;%estimated

%Cell Cycle
omega_cc=2*pi/24;
t0_cc=0;
M_cc=1;
A_cc=1;
phi_cc=9;
n_cc=6;

%MMR %See file k_MMR estimation
k_GT=1;%h^-1
k_MMR=5.60;%h^-1 %Corridore_TMZ_PKPD_Supplementary data.docx

%N37meG & DSB
k_BER=2.16;%Srivastava et al. 1998

%ATR
kd_ATR=0.0435;
n_add=2;%TO ESTIMATE (when under estimation, n_add tends to be =2)

%Chk1
kf_Chk1_MGMT_M=1.746e-03;
kd_Chk1=0.0899;

%Cdc25
kd_cdc25=0.0317;
n_cdc25=6;

%p53-MDM2
n_ATR=2;
kd_p53=0.5;%Hesse Martinelli Aboumanify, Ballesta, Relógio 2021
kd_p53Mdm2=144; %%Sturrock 2011
n_Mdm2=2; %%Sturrock 2011
K_Mdm2=8;%%Sturrock 2011

kt_Mdm2=0.0010138;%TMZ_PKPD_Model_parameter_values5_v3.numbers %0.11664; %%Sturrock 2011
kt_Mdm2p53=6.66; %%Sturrock 2011 % 1440; %%Ma 2005
n_p53=4; %%Sturrock 2011
% K_p53=0.748; %%Sturrock 2011 %1e-3; %% Ma 2005
% ktd_Mdm2=kt_Mdm2/RNA_Mdm20;% It corresonds with 2.3328 of Sturrock 2011 %1.2; %%Ma 2005

kf_Mdm2=0.049685462;%TMZ_PKPD_Model_parameter_values5_v3.numbers% 2.664e3; %%Sturrock 2011 % 1.2; %%Ma 2005

%cell population
n_p53int=2;

%last estimated parameters
k_addO=0.0112400924;
k_addN=0.1538482587;
DSB_72h_fac=1.1271047025;
k_DSBO=0.0003179173;
k_DSBN=0.0000374695;
% kd_pATR=0.0039367373;
k_Chk1=487.5462567023;
C_Chk1=0.7552709574;
kd_pChk1=0.0828772014;
k_cdc25=244.8291664616;
K_cdc25=1.3691691921;
% k_p53=37.7092427390;
% K_ATR=0.0004211550;
% kp_ser46=3.9031215450;
K_p53=0.5375556463;
% sness=0.0042264268;
% k_apop=0.0647671225;
cell_pop_norm0_Verre_MGMT_P=100;74.0019919655;

K_add=0.0000711823;

end

