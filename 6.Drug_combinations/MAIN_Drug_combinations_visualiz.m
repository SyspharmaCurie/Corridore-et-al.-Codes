function  MAIN_Drug_combinations_visualiz()

% The goal of this code is to visualize the results obtained with
% "Drug_combinations_compute.m". Recall to change the result folder and to
% report it in "Results_dir".

clear all
format long

%%%%%Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));
TMZPKPD_dir = './Calib_TMZ_PK-PD_V26_2ndstep_p53_IC50_0' ;
figure_drugcomb = './fig_drugcomb_func' ;
figure_model = './fig_model_func' ;
% Set current directory to 'my_dir' and add path to sub-folders:
restoredefaultpath
cd(my_dir)
% addpath(genpath(my_dir))
addpath(genpath(TMZPKPD_dir))
addpath(genpath(figure_drugcomb))
addpath(genpath(figure_model))
%% Create Plot folder
% Results_dir='Results/1_Drug_comb/Results_2023-09-05_19.34.39';
Results_dir='Results/2_Drug_comb/Results_2023-09-06_15.08.11';
[plot_dir,plot_dir_cont]=mkdir_results_plot(Results_dir);

%% Load AUC and IC50
load (strcat(Results_dir,'/TMZout0_surv'),'TMZout0_surv');
% load (strcat(Results_dir,'/tm_cell_tot'),'tm_cell_tot');
% load (strcat(Results_dir,'/um_cell_tot'),'um_cell_tot');
load (strcat(Results_dir,'/tcellpopm_cell_tot'),'tcellpopm_cell_tot');
load (strcat(Results_dir,'/cellpopm_cell_tot'),'cellpopm_cell_tot');
load (strcat(Results_dir,'/surv_curvm_MGMT_M_tot'),'surv_curvm_MGMT_M_tot');
load (strcat(Results_dir,'/surv_curvm_MGMT_P_tot'),'surv_curvm_MGMT_P_tot');

load (strcat(Results_dir,'/inhib_indx_mat'),'inhib_indx_mat');
load (strcat(Results_dir,'/coeff1_mat'),'coeff1_mat');
load (strcat(Results_dir,'/coeff2_mat'),'coeff2_mat');
load (strcat(Results_dir,'/survAUC_MGMT_M_cell'),'survAUC_MGMT_M_cell');
load (strcat(Results_dir,'/survAUC_MGMT_P_cell'),'survAUC_MGMT_P_cell');
load (strcat(Results_dir,'/IC50_MGMT_M_cell'),'IC50_MGMT_M_cell');
load (strcat(Results_dir,'/IC50_MGMT_P_cell'),'IC50_MGMT_P_cell');

%% Load sorted AUC and IC50
load (strcat(Results_dir,'/survAUC_MGMT_M_cell_sort'),'survAUC_MGMT_M_cell_sort');
load (strcat(Results_dir,'/survAUC_MGMT_P_cell_sort'),'survAUC_MGMT_P_cell_sort');
load (strcat(Results_dir,'/survAUC_totinh_MGMT_M'),'survAUC_totinh_MGMT_M');
load (strcat(Results_dir,'/survAUC_totinh_MGMT_P'),'survAUC_totinh_MGMT_P');
load (strcat(Results_dir,'/inhib_indx_mat_MGMT_M_sort_survAUC'),'inhib_indx_mat_MGMT_M_sort_survAUC');
load (strcat(Results_dir,'/survAUC_totinh_MGMT_M_sort'),'survAUC_totinh_MGMT_M_sort');
load (strcat(Results_dir,'/inhib_indx_mat_MGMT_P_sort_survAUC'),'inhib_indx_mat_MGMT_P_sort_survAUC');
load (strcat(Results_dir,'/survAUC_totinh_MGMT_P_sort'),'survAUC_totinh_MGMT_P_sort');

load (strcat(Results_dir,'/IC50_MGMT_M_cell_sort'),'IC50_MGMT_M_cell_sort');
load (strcat(Results_dir,'/IC50_MGMT_P_cell_sort'),'IC50_MGMT_P_cell_sort');
load (strcat(Results_dir,'/IC50_totinh_MGMT_M'),'IC50_totinh_MGMT_M');
load (strcat(Results_dir,'/IC50_totinh_MGMT_P'),'IC50_totinh_MGMT_P');
load (strcat(Results_dir,'/inhib_indx_mat_MGMT_M_sort_IC50'),'inhib_indx_mat_MGMT_M_sort_IC50');
load (strcat(Results_dir,'/IC50_totinh_MGMT_M_sort'),'IC50_totinh_MGMT_M_sort');
load (strcat(Results_dir,'/inhib_indx_mat_MGMT_P_sort_IC50'),'inhib_indx_mat_MGMT_P_sort_IC50');
load (strcat(Results_dir,'/IC50_totinh_MGMT_P_sort'),'IC50_totinh_MGMT_P_sort');

empl_inhib_numb=size(inhib_indx_mat,2);%number of drug composing the combination

%% Read inhibitor names
filename_inhibitors='Inhibitor_names_extended.csv';
Inhib_name_tab = readtable(filename_inhibitors);
Inhib_name_mat_plot=table2array(Inhib_name_tab(:,3));

%% Result to show
%1drug
% idex_vec_AUC=(1:16);
% idex_vec_IC50=(1:16);
% idex_vec_AUC=[1 2 5 8 11 12 14];
% idex_vec_IC50=[1 2 5 8 11 12 14];
% idex_vec_AUC=[1 5 8 2 11 14];
% idex_vec_IC50=[1 5 8 2 11 14 16];

%2
% idex_vec_AUC=(1:16);
idex_vec_IC50=(1:4);
% idex_vec_AUC=[1 2 3 4 5 6 7 8 9 10 11 12 13];
% idex_vec_IC50=[1 2 3 4 5 6 7 8 9 10 11 12 13];
% idex_vec_IC50=[2 3 7 8 10 11 13];
% idex_vec_IC50=[7 2 10 8 3 13 11 6 5 4];
% idex_vec_AUC_survplot=[ 8];
idex_vec_IC50_survplot=(1:4);


%% Best drug combinations assessment for each cell line END
% barploting(plot_dir,Inhib_name_mat_plot,inhib_indx_mat(idex_vec_AUC,:),survAUC_totinh_MGMT_M(idex_vec_AUC),inhib_indx_mat(idex_vec_AUC,:),survAUC_totinh_MGMT_P(idex_vec_AUC),'cell pop. AUC');
% barploting(plot_dir,Inhib_name_mat_plot,inhib_indx_mat(idex_vec_IC50,:),IC50_totinh_MGMT_M(idex_vec_IC50),inhib_indx_mat(idex_vec_IC50,:),IC50_totinh_MGMT_P(idex_vec_IC50),'IC50 (\muM)');

% % Survival Curve Plot
if empl_inhib_numb==1
%     survAUC_plot_1D(plot_dir,Inhib_name_mat_plot,inhib_indx_mat(idex_vec_AUC,:),coeff1_mat,survAUC_MGMT_M_cell(idex_vec_AUC),survAUC_MGMT_P_cell(idex_vec_AUC),'Cell pop. AUC')
    survAUC_plot_1D(plot_dir,Inhib_name_mat_plot,inhib_indx_mat(idex_vec_IC50,:),coeff1_mat,IC50_MGMT_M_cell(idex_vec_IC50),IC50_MGMT_P_cell(idex_vec_IC50),'IC50')
else
%     survAUC_plot_2D(plot_dir,Inhib_name_mat_plot,inhib_indx_mat(idex_vec_AUC_survplot,:),coeff1_mat,coeff2_mat,survAUC_MGMT_M_cell(idex_vec_AUC_survplot),survAUC_MGMT_P_cell(idex_vec_AUC_survplot),'Cell pop. AUC')
    survAUC_plot_2D(plot_dir,Inhib_name_mat_plot,inhib_indx_mat(idex_vec_IC50_survplot,:),coeff1_mat,coeff2_mat,IC50_MGMT_M_cell(idex_vec_IC50_survplot),IC50_MGMT_P_cell(idex_vec_IC50_survplot),'IC50')
end

%% Model Plot
% plot_setting_PKPD(plot_dir,Inhib_name_mat_plot,inhib_indx_mat,coeff1_mat,tm_cell_tot,um_cell_tot,TMZout0_surv)

%% Cell population plot
% plot_setting_cellpop(plot_dir,Inhib_name_mat_plot,inhib_indx_mat,coeff1_mat,TMZout0_surv,tm_cell_tot,um_cell_tot,tcellpopm_cell_tot,cellpopm_cell_tot)

%% Survival curves
% plot_setting_viab(Inhib_name_mat_plot,inhib_indx_mat(idex_vec_AUC,:),TMZout0_surv,surv_curvm_MGMT_M_tot(idex_vec_AUC),surv_curvm_MGMT_P_tot(idex_vec_AUC))

%% Time
wholeTime = toc(now1)


end

