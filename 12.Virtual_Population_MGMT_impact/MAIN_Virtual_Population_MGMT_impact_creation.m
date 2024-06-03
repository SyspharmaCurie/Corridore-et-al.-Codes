function MAIN_Virtual_Population_MGMT_impact_creation()

% The following code has for goal to analyse the impact of MGMT on the
% survival curve AUC, varing MGMT initial condition and simulating the 
% application of TMZ alone or with BER and\or RI1. The results are saved in
% the folder "Results" and can be read thanks
% "Virtual_Population_MGMT_impact_read.m".

clear all
format long
%% Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));

% Set current directory to 'my_dir' and add path to sub-folders:
restoredefaultpath
cd(my_dir)
% addpath(genpath(my_dir))
addpath(genpath('./cellpop_module'))
addpath(genpath('./fig_funcs'))
addpath(genpath('./Legend_colors'))
addpath(genpath('./linear_regression'))


%% Create Results folder
Results_dir=mkdir_results();
%% Create legend colors folder and file
Legend_colors_dir=strcat('Legend_colors/');
if ~exist(Legend_colors_dir,'dir')
    mkdir(Legend_colors_dir);
end
fileID=fopen(strcat(Legend_colors_dir,'Legend_colors.txt'),'w');
fclose(fileID);

%% Define population size
patient_num=1000;

%% TMZ alone dataset
TMZalone_dataset_dir='Results_2024-04-10_13.05.48_TMZalone';

%% NO-vine-copula Parameter Values
pT=0.003704;%estimated
pT2=0.007785;%estimated
k_BER=2.16;%Srivastava et al. 1998
inhib_factor_BER_Nip=0.6; % 1; %
k_BER_inhib=k_BER*inhib_factor_BER_Nip;
k_MMR=5.60;%h^-1 % variance ref.Corridore_TMZ_PKPD_Supplementary data.docx
k_HR=0.166;%Short et al. Neuro-Oncology 2006
inhib_factor_HR_RI1=0.93; % 1; % 
k_HR_inhib=k_HR*inhib_factor_HR_RI1;
kf_ATR_MGMT_M=1.217e-05;%Schwanhäusser 2011 
kf_Chk1_MGMT_M=1.746e-03;%Schwanhäusser 2011 
kf_Mdm2=0.049685462;%TMZ_PKPD_Model_parameter_values5_v3.numbers% 2.664e3; %%Sturrock 2011 % 1.2; %%Ma 2005

MGMT0_U87_LN229=0;%ref Aasland 2020 for cell lines U87 e LN229, Materials and Methods
Cdc250=4.5273;%TMZ_PKPD_Model_parameter_values5_v3.numbers

%% vine-copula Parameter Values kf_Chk1, kf_Mdm2
k_MGMT=47.6202303904;
k_addO=0.0112400924;
k_addN=0.1538482587;
k_DSBO=0.0003179173;
k_DSBN=0.0000374695;
k_CyA=2.0706560496;
k_ATR=0.0211012041;
K_add=0.0000711823;
kd_pATR=0.0039367373;
k_Chk1=487.5462567023;
C_Chk1=0.7552709574;
kd_pChk1=0.0828772014;
k_cdc25=244.8291664616;
K_cdc25=1.3691691921;
k_p53=37.7092427390;
K_ATR=0.0004211550;
kp_ser46=3.9031215450;
K_p53=0.5375556463;
upAsy=0.2557676226;
sness=0.0042264268;
k_apop=0.0647671225;
tED50=378.1999848170;

%% vine-copula Parameter Values but supposed lognorm
MGMT_P0=2.2376032847;
kf_ATR_MGMT_P=0.0000110219;
kf_p53=0.0007014704;


%% NO-vine-copula Parameter standard deviation
CV_perc_treat_pop=20;

pT_var = (pT*CV_perc_treat_pop/100)^2;  
pT2_var = (pT2*CV_perc_treat_pop/100)^2;
k_addO_var = (k_addO*CV_perc_treat_pop/100)^2;
k_addN_var = (k_addN*CV_perc_treat_pop/100)^2;
k_CyA_var = (k_CyA*CV_perc_treat_pop/100)^2;
K_cdc25_var = (K_cdc25*CV_perc_treat_pop/100)^2;
MGMT_P0_var = (MGMT_P0*CV_perc_treat_pop/100)^2;
k_MGMT_var = (k_MGMT*CV_perc_treat_pop/100)^2;
k_BER_var = (k_BER*CV_perc_treat_pop/100)^2;
k_MMR_var = (k_MMR*CV_perc_treat_pop/100)^2;
k_DSBO_var = (k_DSBO*CV_perc_treat_pop/100)^2;
k_DSBN_var = (k_DSBN*CV_perc_treat_pop/100)^2;
k_HR_var = (k_HR*CV_perc_treat_pop/100)^2;
kf_ATR_MGMT_M_var = (kf_ATR_MGMT_M*CV_perc_treat_pop/100)^2;
kf_ATR_MGMT_P_var = (kf_ATR_MGMT_P*CV_perc_treat_pop/100)^2;
k_ATR_var = (k_ATR*CV_perc_treat_pop/100)^2;
K_add_var = (K_add*CV_perc_treat_pop/100)^2;
kd_pATR_var = (kd_pATR*CV_perc_treat_pop/100)^2;
kf_Chk1_MGMT_M_var = (kf_Chk1_MGMT_M*CV_perc_treat_pop/100)^2;
C_Chk1_var = (C_Chk1*CV_perc_treat_pop/100)^2;
k_Chk1_var = (k_Chk1*CV_perc_treat_pop/100)^2;
kd_pChk1_var = (kd_pChk1*CV_perc_treat_pop/100)^2;
Cdc250_var = (Cdc250*CV_perc_treat_pop/100)^2;
k_cdc25_var = (k_cdc25*CV_perc_treat_pop/100)^2;
kf_p53_var= (kf_p53*CV_perc_treat_pop/100)^2;
k_p53_var = (k_p53*CV_perc_treat_pop/100)^2;
K_ATR_var = (K_ATR*CV_perc_treat_pop/100)^2;
kp_ser46_var = (kp_ser46*CV_perc_treat_pop/100)^2;
kf_Mdm2_var = (kf_Mdm2*CV_perc_treat_pop/100)^2;
K_p53_var = (K_p53*CV_perc_treat_pop/100)^2;
k_apop_var = (k_apop*CV_perc_treat_pop/100)^2;
upAsy_var = (upAsy*CV_perc_treat_pop/100)^2;
tED50_var = (tED50*CV_perc_treat_pop/100)^2;
sness_var = (sness*CV_perc_treat_pop/100)^2;

%% Datasets
if (inhib_factor_BER_Nip==1 && inhib_factor_HR_RI1==1) %TMZ alone
    [dataset_MGMT_M,dataset_MGMT_P] = def_distr(patient_num,...
    pT,pT_var,pT2,pT2_var,k_addO,k_addO_var,k_addN,k_addN_var,k_CyA,k_CyA_var,K_cdc25,K_cdc25_var,...
    MGMT0_U87_LN229,MGMT_P0,MGMT_P0_var,k_MGMT,k_MGMT_var,k_BER,k_BER_var,k_MMR,k_MMR_var,k_DSBO,k_DSBO_var,k_DSBN,k_DSBN_var,...
    k_HR,k_HR_var,kf_ATR_MGMT_M,kf_ATR_MGMT_M_var,kf_ATR_MGMT_P,kf_ATR_MGMT_P_var,...
    k_ATR,k_ATR_var,K_add,K_add_var,kd_pATR,kd_pATR_var,kf_Chk1_MGMT_M,kf_Chk1_MGMT_M_var,C_Chk1,C_Chk1_var,k_Chk1,k_Chk1_var,kd_pChk1,kd_pChk1_var,...
    Cdc250,Cdc250_var,k_cdc25,k_cdc25_var,kf_p53,kf_p53_var,k_p53,k_p53_var,K_ATR,K_ATR_var,kp_ser46,kp_ser46_var,kf_Mdm2,kf_Mdm2_var,K_p53,K_p53_var,...
    k_apop,k_apop_var,upAsy,upAsy_var,tED50,tED50_var,sness,sness_var);

dataset_checking(dataset_MGMT_M,dataset_MGMT_P)

else % New Treatments
    [dataset_MGMT_M,dataset_MGMT_P,...
        surv_curvm_orig_MGMT_M,surv_curvm_orig_MGMT_P,surv_curvm_mat_MGMT_M,surv_curvm_mat_MGMT_P,...
        survcurv_AUC_orig_MGMT_M,survcurv_AUC_orig_MGMT_P,survcurv_AUC_vec_MGMT_M,survcurv_AUC_vec_MGMT_P,...
        survcurv_AUC_vec_allpat] = read_populatio_dataset(TMZalone_dataset_dir);
        patient_num=size(dataset_MGMT_M,1)
        patient_num=size(dataset_MGMT_P,1)
end
%% PKPD simulations with original parameters
param_MGMT_M=[pT,pT2,k_addO,k_addN,k_CyA,K_cdc25,MGMT0_U87_LN229,k_MGMT,k_BER,k_MMR,k_DSBO,k_DSBN,k_HR,kf_ATR_MGMT_M,k_ATR,K_add,kd_pATR,kf_Chk1_MGMT_M,k_Chk1,kd_pChk1,Cdc250,k_cdc25,kf_p53,k_p53,K_ATR,kp_ser46,kf_Mdm2,K_p53,k_apop,upAsy,tED50,sness];
simualtions_PKPD_original(param_MGMT_M,inhib_factor_BER_Nip,inhib_factor_HR_RI1,'m',Results_dir);

kf_Chk1_MGMT_P=kf_Chk1_MGMT_M*C_Chk1;
param_MGMT_P=[pT,pT2,k_addO,k_addN,k_CyA,K_cdc25,MGMT_P0,k_MGMT,k_BER,k_MMR,k_DSBO,k_DSBN,k_HR,kf_ATR_MGMT_P,k_ATR,K_add,kd_pATR,kf_Chk1_MGMT_P,k_Chk1,kd_pChk1,Cdc250,k_cdc25,kf_p53,k_p53,K_ATR,kp_ser46,kf_Mdm2,K_p53,k_apop,upAsy,tED50,sness];
simualtions_PKPD_original(param_MGMT_P,inhib_factor_BER_Nip,inhib_factor_HR_RI1,'p',Results_dir);

%% Simlations
%MGMT-
cell_pop_AUC_IC5O_sim(patient_num,dataset_MGMT_M,'m',Results_dir,...
    inhib_factor_BER_Nip,inhib_factor_HR_RI1)
%MGMT+
cell_pop_AUC_IC5O_sim(patient_num,dataset_MGMT_P,'p',Results_dir,...
    inhib_factor_BER_Nip,inhib_factor_HR_RI1)

%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


