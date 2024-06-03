function MAIN_TMZ_PK_PD_ParamImp_param_generation()

%This code has for goal to generate a sample of values of the parameters of
%the TMZ PK-PD model according to the parameter probability distributions
%(neither vine-copula or log normal). All details are reported in Tables S4
%For each sample element, the survival curve AUC has been computed. The
%results, collected in the folder "Results", are used to analyse the
%parameter importance (See code in 5.TMZ_PK-PD_ParameterImportance_ML).

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

%% Plot control
[plot_surv_figcon,hist_survcurv_AUC_MGMT_M_TMZalone_figcon,hist_survcurv_AUC_MGMT_P_TMZalone_figcon,hist_survcurv_AUC_allpat_TMZalone_figcon,...
    plot_surv_fignumb,hist_survcurv_AUC_MGMT_M_TMZalone_fignumb,hist_survcurv_AUC_MGMT_P_TMZalone_fignumb,hist_survcurv_AUC_allpat_TMZalone_fignumb...
    ] = plot_control();

if plot_surv_figcon==1
    figure(plot_surv_fignumb)
    clf
end

%% Load cmaes file
vin_cop_params = csvread('../3.rvinecop_analysis/Results_2024-02-14/vincop_sim.csv',1,0);
patient_num=floor(size(vin_cop_params,1)/2);
vin_cop_MGMT_M_params=vin_cop_params(1:patient_num,:);
vin_cop_MGMT_P_params=vin_cop_params(patient_num+1:2*patient_num,:);

%% NO-vine-copula Parameter Values
pT=0.003704;%estimated
pT2=0.007785;%estimated
k_BER=2.16;%Srivastava et al. 1998
inhib_factor_BER_Nip=1;%0.6;
k_BER_inhib=k_BER*inhib_factor_BER_Nip;
k_MMR=5.60;%h^-1 % variance ref.Corridore_TMZ_PKPD_Supplementary data.docx
k_HR=0.166;%Short et al. Neuro-Oncology 2006
inhib_factor_HR_RI1=1;%0.93;
k_HR_inhib=k_HR*inhib_factor_HR_RI1;
kf_ATR_MGMT_M=1.217e-05;%Schwanhäusser 2011 
kf_Chk1_MGMT_M=1.746e-03;%Schwanhäusser 2011 
kf_Mdm2=0.049685462;%TMZ_PKPD_Model_parameter_values5_v3.numbers% 2.664e3; %%Sturrock 2011 % 1.2; %%Ma 2005

MGMT0_U87_LN229=0;%ref Aasland 2020 for cell lines U87 e LN229, Materials and Methods
Cdc250=4.5273;%TMZ_PKPD_Model_parameter_values5_v3.numbers

%% vine-copula Parameter Values kf_Chk1, kf_Mdm2
MGMT_P0=2.2376032847;
k_addO=0.0112400924;
k_addN=0.1538482587;
k_DSBO=0.0003179173;
k_DSBN=0.0000374695;
k_CyA=2.0706560496;
kf_ATR_MGMT_P=0.0000110219;
k_ATR=0.0211012041;
K_add=0.0000711823;
k_Chk1=487.5462567023;
C_Chk1=0.7552709574;
kd_pChk1=0.0828772014;
k_cdc25=244.8291664616;
K_cdc25=1.3691691921;
kf_p53=0.0007014704;
k_p53=37.7092427390;
K_p53=0.5375556463;
upAsy=0.2557676226;
sness=0.0042264268;
k_apop=0.0647671225;
tED50=378.1999848170;


%% NO-vine-copula Parameter standard deviation
CV_perc_not_avail_ref=20;

pT_var = (pT*16.9/100)^2; % ref. coefficient of variance in Ballesta et al 2014
pT2_var = (pT2*17/100)^2; % ref. coefficient of variance in Ballesta et al 2014
k_BER_var = (k_BER*CV_perc_not_avail_ref/100)^2; % NO value in the ref.
k_MMR_var = (1.04)^2; % ref.Corridore_TMZ_PKPD_Supplementary data.docx
k_HR_var = (k_HR*CV_perc_not_avail_ref/100)^2; % NO value in the ref.
kf_ATR_MGMT_M_var = (kf_ATR_MGMT_M*CV_perc_not_avail_ref/100)^2; % NO value in the ref.
kf_Chk1_MGMT_M_var = (0.000559)^2; %Schwanhäusser 2011 
Cdc250_var = (Cdc250*CV_perc_not_avail_ref/100)^2;
kf_Mdm2_var = (kf_Mdm2*0.004/100)^2;


%% Datasets
[dataset_MGMT_M,dataset_MGMT_P] = def_distr(patient_num,vin_cop_MGMT_M_params,vin_cop_MGMT_P_params,...
    pT,pT_var,pT2,pT2_var,MGMT0_U87_LN229,k_BER,k_BER_var,k_MMR,k_MMR_var,k_HR,k_HR_var,kf_ATR_MGMT_M,kf_ATR_MGMT_M_var,...
    kf_Chk1_MGMT_M,kf_Chk1_MGMT_M_var,Cdc250,Cdc250_var,kf_Mdm2,kf_Mdm2_var);

[minnn,placee]=min(dataset_MGMT_M)
dataset_MGMT_M=[dataset_MGMT_M(1:34699,:);dataset_MGMT_M(34701:75937,:);dataset_MGMT_M(75939:end,:)];% to avoid -inf value for K_add and negative value for k_DSBN in dataset_MGMT_P 
dataset_MGMT_P=[dataset_MGMT_P(1:34699,:);dataset_MGMT_P(34701:75937,:);dataset_MGMT_P(75939:end,:)];
patient_num=size(dataset_MGMT_M,1)
patient_num=size(dataset_MGMT_P,1)
minnn=min(dataset_MGMT_P)
%% PKPD simulations with original parameters
param_MGMT_M=[pT,pT2,k_addO,k_addN,k_CyA,K_cdc25,MGMT0_U87_LN229,k_BER_inhib,k_MMR,k_DSBO,k_DSBN,k_HR_inhib,kf_ATR_MGMT_M,k_ATR,K_add,kf_Chk1_MGMT_M,k_Chk1,kd_pChk1,Cdc250,k_cdc25,kf_p53,k_p53,kf_Mdm2,K_p53,k_apop,upAsy,tED50,sness];
simualtions_PKPD_original(param_MGMT_M,inhib_factor_BER_Nip,inhib_factor_HR_RI1,'m',plot_surv_fignumb,plot_surv_figcon,Results_dir);

kf_Chk1_MGMT_P=kf_Chk1_MGMT_M*C_Chk1;
param_MGMT_P=[pT,pT2,k_addO,k_addN,k_CyA,K_cdc25,MGMT_P0,k_BER_inhib,k_MMR,k_DSBO,k_DSBN,k_HR_inhib,kf_ATR_MGMT_P,k_ATR,K_add,kf_Chk1_MGMT_P,k_Chk1,kd_pChk1,Cdc250,k_cdc25,kf_p53,k_p53,kf_Mdm2,K_p53,k_apop,upAsy,tED50,sness];
simualtions_PKPD_original(param_MGMT_P,inhib_factor_BER_Nip,inhib_factor_HR_RI1,'p',plot_surv_fignumb,plot_surv_figcon,Results_dir);

%% Simlations
%MGMT-
cell_pop_AUC_IC5O_sim(patient_num,dataset_MGMT_M,'m',Results_dir,...
    inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    plot_surv_figcon,plot_surv_fignumb)
%MGMT+
cell_pop_AUC_IC5O_sim(patient_num,dataset_MGMT_P,'p',Results_dir,...
    inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    plot_surv_figcon,plot_surv_fignumb)

%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


