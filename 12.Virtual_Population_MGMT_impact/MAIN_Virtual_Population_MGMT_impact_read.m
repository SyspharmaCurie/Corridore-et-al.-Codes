function MAIN_Virtual_Population_MGMT_impact_read ()

% The following code has for goal to read the results of the simulations
% generated with "Virtual_Population_MGMT_impact_creation.m" and collected
% in the folder "Results".

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
[plot_surv_TMZalone_figcon,plot_surv_BERinh_figcon,plot_surv_HRinh_figcon,plot_surv_HRBERinh_figcon,...
    hist_survcurv_AUC_MGMT_M_TMZalone_figcon,hist_survcurv_AUC_MGMT_P_TMZalone_figcon,hist_survcurv_AUC_allpat_TMZalone_figcon,...
    hist_survcurv_AUC_treat_BERinh_figcon,hist_survcurv_AUC_treat_HRinh_figcon,hist_survcurv_AUC_treat_HRBERinh_figcon,...
    hist_survcurv_AUC_2treat_BERinh_figcon,hist_survcurv_AUC_2treat_HRinh_figcon,hist_survcurv_AUC_2treat_HRBERinh_figcon,...
    plot_surv_TMZalone_fignumb,plot_surv_BERinh_fignumb,plot_surv_HRinh_fignumb,plot_surv_HRBERinh_fignumb,...
    hist_survcurv_AUC_MGMT_M_TMZalone_fignumb,hist_survcurv_AUC_MGMT_P_TMZalone_fignumb,hist_survcurv_AUC_allpat_TMZalone_fignumb,...
    hist_survcurv_AUC_treat_BERinh_fignumb,hist_survcurv_AUC_treat_HRinh_fignumb,hist_survcurv_AUC_treat_HRBERinh_fignumb,...
    hist_survcurv_AUC_2treat_BERinh_fignumb,hist_survcurv_AUC_2treat_HRinh_fignumb,hist_survcurv_AUC_2treat_HRBERinh_fignumb...
    ] = plot_control();

%% Read virtual population
Results_data_dir_TMZalone='Results_2024-04-10_13.05.48_TMZalone';
Results_data_dir_BERinh='Results_2024-04-10_13.05.48_TMZalone';
Results_data_dir_HRinh='Results_2024-04-10_13.05.48_TMZalone';
Results_data_dir_HRBERinh='Results_2024-04-10_13.15.00HRBERinh';


[dataset_MGMT_M_TMZalone,dataset_MGMT_P_TMZalone,...
    surv_curvm_orig_MGMT_M_TMZalone,surv_curvm_orig_MGMT_P_TMZalone,surv_curvm_mat_MGMT_M_TMZalone,surv_curvm_mat_MGMT_P_TMZalone,...
    survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,...
    survcurv_AUC_vec_allpat_TMZalone] = read_populatio_dataset(Results_data_dir_TMZalone);

[dataset_MGMT_M_BERinh,dataset_MGMT_P_BERinh,...
    surv_curvm_orig_MGMT_M_BERinh,surv_curvm_orig_MGMT_P_BERinh,surv_curvm_mat_MGMT_M_BERinh,surv_curvm_mat_MGMT_P_BERinh,...
    survcurv_AUC_orig_MGMT_M_BERinh,survcurv_AUC_orig_MGMT_P_BERinh,survcurv_AUC_vec_MGMT_M_BERinh,survcurv_AUC_vec_MGMT_P_BERinh,...
    survcurv_AUC_vec_allpat_BERinh] = read_populatio_dataset(Results_data_dir_BERinh);

[dataset_MGMT_M_HRinh,dataset_MGMT_P_HRinh,...
    surv_curvm_orig_MGMT_M_HRinh,surv_curvm_orig_MGMT_P_HRinh,surv_curvm_mat_MGMT_M_HRinh,surv_curvm_mat_MGMT_P_HRinh,...
    survcurv_AUC_orig_MGMT_M_HRinh,survcurv_AUC_orig_MGMT_P_HRinh,survcurv_AUC_vec_MGMT_M_HRinh,survcurv_AUC_vec_MGMT_P_HRinh,...
    survcurv_AUC_vec_allpat_HRinh] = read_populatio_dataset(Results_data_dir_HRinh);

[dataset_MGMT_M_HRBERinh,dataset_MGMT_P_HRBERinh,...
    surv_curvm_orig_MGMT_M_HRBERinh,surv_curvm_orig_MGMT_P_HRBERinh,surv_curvm_mat_MGMT_M_HRBERinh,surv_curvm_mat_MGMT_P_HRBERinh,...
    survcurv_AUC_orig_MGMT_M_HRBERinh,survcurv_AUC_orig_MGMT_P_HRBERinh,survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,...
    survcurv_AUC_vec_allpat_HRBERinh] = read_populatio_dataset(Results_data_dir_HRBERinh);
TMZout0_surv=[0 1 2 4 8 16 32 64 128 256 512 1024 3e3]';

%% Plot virtual population
patient_num_plot_surv_curv=100;
plot_setting_viab_control(TMZout0_surv,surv_curvm_orig_MGMT_M_TMZalone,surv_curvm_orig_MGMT_P_TMZalone,...
    patient_num_plot_surv_curv,surv_curvm_mat_MGMT_M_TMZalone,surv_curvm_mat_MGMT_P_TMZalone,...
    plot_surv_TMZalone_figcon,plot_surv_TMZalone_fignumb)

plot_setting_viab_control(TMZout0_surv,surv_curvm_orig_MGMT_M_BERinh,surv_curvm_orig_MGMT_P_BERinh,...
    patient_num_plot_surv_curv,surv_curvm_mat_MGMT_M_BERinh,surv_curvm_mat_MGMT_P_BERinh,...
    plot_surv_BERinh_figcon,plot_surv_BERinh_fignumb)

plot_setting_viab_control(TMZout0_surv,surv_curvm_orig_MGMT_M_HRinh,surv_curvm_orig_MGMT_P_HRinh,...
    patient_num_plot_surv_curv,surv_curvm_mat_MGMT_M_HRinh,surv_curvm_mat_MGMT_P_HRinh,...
    plot_surv_HRinh_figcon,plot_surv_HRinh_fignumb)

plot_setting_viab_control(TMZout0_surv,surv_curvm_orig_MGMT_M_HRBERinh,surv_curvm_orig_MGMT_P_HRBERinh,...
    patient_num_plot_surv_curv,surv_curvm_mat_MGMT_M_HRBERinh,surv_curvm_mat_MGMT_P_HRBERinh,...
    plot_surv_HRBERinh_figcon,plot_surv_HRBERinh_fignumb)

%% Plot AUC virtual population histogram
%TMZ alone
plot_AUCHist(survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_M_TMZalone,'m','A',hist_survcurv_AUC_MGMT_M_TMZalone_figcon,hist_survcurv_AUC_MGMT_M_TMZalone_fignumb,'TMZ alone')
plot_AUCHist(survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,'p','A',hist_survcurv_AUC_MGMT_P_TMZalone_figcon,hist_survcurv_AUC_MGMT_P_TMZalone_fignumb,'TMZ alone')
plot_AUCHist(survcurv_AUC_vec_allpat_TMZalone,survcurv_AUC_orig_MGMT_M_TMZalone,'a','A',hist_survcurv_AUC_allpat_TMZalone_figcon,hist_survcurv_AUC_allpat_TMZalone_fignumb,'TMZ alone')

%Treatments
plot_AUCHist_treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_BERinh,survcurv_AUC_vec_MGMT_P_BERinh,survcurv_AUC_vec_allpat_BERinh,...
    hist_survcurv_AUC_treat_BERinh_figcon,hist_survcurv_AUC_treat_BERinh_fignumb,'BER inh.')
plot_AUCHist_treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_HRinh,survcurv_AUC_vec_MGMT_P_HRinh,survcurv_AUC_vec_allpat_HRinh,...
    hist_survcurv_AUC_treat_HRinh_figcon,hist_survcurv_AUC_treat_HRinh_fignumb,'HR inh.')
plot_AUCHist_treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,survcurv_AUC_vec_allpat_HRBERinh,...
    hist_survcurv_AUC_treat_HRBERinh_figcon,hist_survcurv_AUC_treat_HRBERinh_fignumb,'HR&BER inh.')

%TMZ alone and Treatments
plot_AUCHist_2treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_BERinh,survcurv_AUC_vec_MGMT_P_BERinh,survcurv_AUC_vec_allpat_BERinh,...
    1,hist_survcurv_AUC_2treat_BERinh_figcon,hist_survcurv_AUC_2treat_BERinh_fignumb)

plot_AUCHist_2treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_HRinh,survcurv_AUC_vec_MGMT_P_HRinh,survcurv_AUC_vec_allpat_HRinh,...
    2,hist_survcurv_AUC_2treat_HRinh_figcon,hist_survcurv_AUC_2treat_HRinh_fignumb)

plot_AUCHist_2treat_settings(survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,...
    survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,survcurv_AUC_vec_allpat_TMZalone,...
    survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,survcurv_AUC_vec_allpat_HRBERinh,...
    3,hist_survcurv_AUC_2treat_HRBERinh_figcon,hist_survcurv_AUC_2treat_HRBERinh_fignumb)

MGMT0_distr_MGMT_M_TMZalone=dataset_MGMT_M_TMZalone(:,7);
MGMT0_distr_MGMT_P_TMZalone=dataset_MGMT_P_TMZalone(:,7);
MGMT0_distr_MGMT_M_HRBERinh=dataset_MGMT_M_HRBERinh(:,7);
MGMT0_distr_MGMT_P_HRBERinh=dataset_MGMT_P_HRBERinh(:,7);
rel_output_MGMT_M=(survcurv_AUC_vec_MGMT_M_TMZalone-survcurv_AUC_vec_MGMT_M_HRBERinh)./survcurv_AUC_vec_MGMT_M_TMZalone;
rel_output_MGMT_P=(survcurv_AUC_vec_MGMT_P_TMZalone-survcurv_AUC_vec_MGMT_P_HRBERinh)./survcurv_AUC_vec_MGMT_P_TMZalone;

abs_output_MGMT_M=(survcurv_AUC_vec_MGMT_M_TMZalone-survcurv_AUC_vec_MGMT_M_HRBERinh);
abs_output_MGMT_P=(survcurv_AUC_vec_MGMT_P_TMZalone-survcurv_AUC_vec_MGMT_P_HRBERinh);
[Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
figure(999)
colororder({'k','#808080'})
clf
yyaxis left
plot(MGMT0_distr_MGMT_P_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,'-','Color',Tol_bright{1},'LineWidth',3)
hold on
plot(MGMT0_distr_MGMT_P_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,'--','Color',Tol_bright{1},'LineWidth',3)

xlim([0,4e-5])
xlabel('MGMT_0')
ylabel('Survival curve AUC')
xlim([0 4])
ylim([0 14e4])


yyaxis right
[X_MGMT0_TMZalone,I]=sort(MGMT0_distr_MGMT_P_TMZalone);
Y2_abs_output=abs_output_MGMT_P(I);
X2_MGMT0_TMZalone = [X_MGMT0_TMZalone;flipud(X_MGMT0_TMZalone)];
inBetween_abs_output = [Y2_abs_output;flipud(X_MGMT0_TMZalone)];
fill(X2_MGMT0_TMZalone, inBetween_abs_output,color_conv_an_rgb(Tol_bright{1}),'FaceAlpha',0.25,'LineStyle','none');
ylabel('Survival curve AUC diff.')

ylim([0 14e4])
set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
legend('TMZalone','TMZ+RI1+Nirap','AUC diff.','Location','northwest')
box off
% figure(1000)
% clf
% plot(MGMT0_distr_MGMT_M_TMZalone,rel_output_MGMT_M,'b*')
% hold on
% plot(MGMT0_distr_MGMT_P_TMZalone,rel_output_MGMT_P,'r*')
% ylim([0,1])
% figure(1001)
% clf
% plot(MGMT0_distr_MGMT_M_TMZalone,abs_output_MGMT_M,'b*')
% hold on
% plot(MGMT0_distr_MGMT_P_TMZalone,abs_output_MGMT_P,'r*')


%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


