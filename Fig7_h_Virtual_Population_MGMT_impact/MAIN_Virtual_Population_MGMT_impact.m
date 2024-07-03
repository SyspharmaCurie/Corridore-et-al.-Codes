function MAIN_Virtual_Population_MGMT_impact ()

% The following code has for goal to show the impact of protein levels of
% MGMT (MGMT0) on TMZ AUC, 3-drug AUC and their difference in indicated VP
% populations. 

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
addpath(genpath('./fig_funcs'))
addpath(genpath('./Read_dataset_funcs'))

%% Read virtual population
dataset_dir_TMZalone='TMZalone_VP';
dataset_dir_HRBERinh='HRBERinh_VP';


[dataset_MGMT_M_TMZalone,dataset_MGMT_P_TMZalone,...
    surv_curvm_orig_MGMT_M_TMZalone,surv_curvm_orig_MGMT_P_TMZalone,surv_curvm_mat_MGMT_M_TMZalone,surv_curvm_mat_MGMT_P_TMZalone,...
    survcurv_AUC_orig_MGMT_M_TMZalone,survcurv_AUC_orig_MGMT_P_TMZalone,survcurv_AUC_vec_MGMT_M_TMZalone,survcurv_AUC_vec_MGMT_P_TMZalone,...
    survcurv_AUC_vec_allpat_TMZalone] = read_populatio_dataset(dataset_dir_TMZalone);

[dataset_MGMT_M_HRBERinh,dataset_MGMT_P_HRBERinh,...
    surv_curvm_orig_MGMT_M_HRBERinh,surv_curvm_orig_MGMT_P_HRBERinh,surv_curvm_mat_MGMT_M_HRBERinh,surv_curvm_mat_MGMT_P_HRBERinh,...
    survcurv_AUC_orig_MGMT_M_HRBERinh,survcurv_AUC_orig_MGMT_P_HRBERinh,survcurv_AUC_vec_MGMT_M_HRBERinh,survcurv_AUC_vec_MGMT_P_HRBERinh,...
    survcurv_AUC_vec_allpat_HRBERinh] = read_populatio_dataset(dataset_dir_HRBERinh);


%% Figure
MGMT0_distr_MGMT_P_TMZalone=dataset_MGMT_P_TMZalone(:,7);
MGMT0_distr_MGMT_P_HRBERinh=dataset_MGMT_P_HRBERinh(:,7);

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

%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


