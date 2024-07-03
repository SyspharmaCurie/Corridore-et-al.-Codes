function MAIN_Virtual_Population ()

% The following code has for goal to read the results of the simulations
% generated with "vitural_pop_creation.m" and colleted in the folder
% "Results"

clear all
format long
%% Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));

% Set current directory to 'my_dir' and add path to sub-folders:
restoredefaultpath
cd(my_dir)
addpath(genpath('./Data_reader_funcs'))
addpath(genpath('./fig_funcs'))
addpath(genpath('./Legend_colors'))

%% Plot control
[hist_survcurv_AUC_treat_HRBERinh_figcon,hist_survcurv_AUC_2treat_HRBERinh_figcon,...
    hist_survcurv_AUC_treat_HRBERinh_fignumb,hist_survcurv_AUC_2treat_HRBERinh_fignumb...
    ] = plot_control();

%% Read virtual population
Data_dir_TMZalone='VP_TMZalone';
Data_dir_BERinh='VP_BERinh';
Data_dir_HRinh='VP_HRinh';
Data_dir_HRBERinh='VP_HRBERinh';

[dataset_MGMT_M_TMZalone,dataset_MGMT_P_TMZalone,...
    surv_curvm_orig_MGMT_M_TMZalone,surv_curvm_orig_MGMT_P_TMZalone,surv_curvm_mat_MGMT_M_TMZalone,surv_curvm_mat_MGMT_P_TMZalone,...
    survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,...
    survcurv_AUC_vec_allpat_TMZalone] = read_populatio_dataset(Data_dir_TMZalone);

[dataset_MGMT_M_BERinh,dataset_MGMT_P_BERinh,...
    surv_curvm_orig_MGMT_M_BERinh,surv_curvm_orig_MGMT_P_BERinh,surv_curvm_mat_MGMT_M_BERinh,surv_curvm_mat_MGMT_P_BERinh,...
    survcurv_AUC_orig_MGMT_M_BERinh,survcurv_AUC_orig_MGMT_P_BERinh,survcurv_AUC_vec_MGMT_M_BERinh,survcurv_AUC_vec_MGMT_P_BERinh,...
    survcurv_AUC_vec_allpat_BERinh] = read_populatio_dataset(Data_dir_BERinh);

[dataset_MGMT_M_HRinh,dataset_MGMT_P_HRinh,...
    surv_curvm_orig_MGMT_M_HRinh,surv_curvm_orig_MGMT_P_HRinh,surv_curvm_mat_MGMT_M_HRinh,surv_curvm_mat_MGMT_P_HRinh,...
    survcurv_AUC_orig_MGMT_M_HRinh,survcurv_AUC_orig_MGMT_P_HRinh,survcurv_AUC_vec_MGMT_M_HRinh,survcurv_AUC_vec_MGMT_P_HRinh,...
    survcurv_AUC_vec_allpat_HRinh] = read_populatio_dataset(Data_dir_HRinh);

[dataset_MGMT_M_HRBERinh,dataset_MGMT_P_HRBERinh,...
    surv_curvm_orig_MGMT_M_HRBERinh,surv_curvm_orig_MGMT_P_HRBERinh,surv_curvm_mat_MGMT_M_HRBERinh,surv_curvm_mat_MGMT_P_HRBERinh,...
    survcurv_AUC_orig_MGMT_M_HRBERinh,survcurv_AUC_orig_MGMT_P_HRBERinh,survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,...
    survcurv_AUC_vec_allpat_HRBERinh] = read_populatio_dataset(Data_dir_HRBERinh);

%% Plot AUC virtual population histogram
%Treatments
plot_AUCHist_treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,survcurv_AUC_vec_allpat_HRBERinh,...
    hist_survcurv_AUC_treat_HRBERinh_figcon,hist_survcurv_AUC_treat_HRBERinh_fignumb,'HR&BER inh.')

%TMZ alone and Treatments
plot_AUCHist_2treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,survcurv_AUC_vec_allpat_HRBERinh,...
    3,hist_survcurv_AUC_2treat_HRBERinh_figcon,hist_survcurv_AUC_2treat_HRBERinh_fignumb)


%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


