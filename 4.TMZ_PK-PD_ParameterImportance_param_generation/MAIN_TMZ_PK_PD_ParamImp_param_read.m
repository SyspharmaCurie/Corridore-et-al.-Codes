function MAIN_TMZ_PK_PD_ParamImp_param_read ()

%This code has for goal to show the histograms of the AUC related to the
%parameter value sample generated with
%"MAIN_TMZ_PK_PD_ParamImp_param_generation.m". Recall to change the result
%folder name in Results_data_dir_TMZalone.

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

%% Create Results folder
% Results_dir=mkdir_results();

%% Plot control
[plot_surv_figcon,hist_survcurv_AUC_MGMT_M_TMZalone_figcon,hist_survcurv_AUC_MGMT_P_TMZalone_figcon,hist_survcurv_AUC_allpat_TMZalone_figcon,...
    plot_surv_fignumb,hist_survcurv_AUC_MGMT_M_TMZalone_fignumb,hist_survcurv_AUC_MGMT_P_TMZalone_fignumb,hist_survcurv_AUC_allpat_TMZalone_fignumb...
    ] = plot_control();

%% Read virtual population
Results_data_dir_TMZalone='Results_2024-03-21_21.17.24_TMZalone';

[dataset_MGMT_M_TMZalone,dataset_MGMT_P_TMZalone,...
    surv_curvm_orig_MGMT_M_TMZalone,surv_curvm_orig_MGMT_P_TMZalone,surv_curvm_mat_MGMT_M_TMZalone,surv_curvm_mat_MGMT_P_TMZalone,...
    survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,...
    survcurv_AUC_vec_allpat_TMZalone] = read_populatio_dataset(Results_data_dir_TMZalone);

patient_num=size(surv_curvm_mat_MGMT_M_TMZalone,2);
TMZout0_surv=[0 1 2 4 8 16 32 64 128 256 512 1024 3e3]';
%% Plot virtual population
if plot_surv_figcon==1
    figure(plot_surv_fignumb)
    clf
end
plot_setting_viab(TMZout0_surv,surv_curvm_orig_MGMT_M_TMZalone,...simulations
    'm',plot_surv_figcon,plot_surv_fignumb,1 ...figure control
    )
        
plot_setting_viab(TMZout0_surv,surv_curvm_orig_MGMT_P_TMZalone,...simulations
    'p',plot_surv_figcon,plot_surv_fignumb,1 ...figure control
    )

for patient_indx=1:patient_num
    plot_setting_viab(TMZout0_surv,surv_curvm_mat_MGMT_M_TMZalone(:,patient_indx),...simulations
        'm',plot_surv_figcon,plot_surv_fignumb,0 ...figure control
        )
    plot_setting_viab(TMZout0_surv,surv_curvm_mat_MGMT_P_TMZalone(:,patient_indx),...simulations
        'p',plot_surv_figcon,plot_surv_fignumb,0 ...figure control
        )
end

%% Plot AUC virtual population histogram
%TMZ alone
plot_AUCHist(survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_M_TMZalone,'m','A',hist_survcurv_AUC_MGMT_M_TMZalone_figcon,hist_survcurv_AUC_MGMT_M_TMZalone_fignumb,'TMZ alone')
plot_AUCHist(survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,'p','A',hist_survcurv_AUC_MGMT_P_TMZalone_figcon,hist_survcurv_AUC_MGMT_P_TMZalone_fignumb,'TMZ alone')
plot_AUCHist(survcurv_AUC_vec_allpat_TMZalone,survcurv_AUC_orig_MGMT_M_TMZalone,'a','A',hist_survcurv_AUC_allpat_TMZalone_figcon,hist_survcurv_AUC_allpat_TMZalone_fignumb,'TMZ alone')


%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


