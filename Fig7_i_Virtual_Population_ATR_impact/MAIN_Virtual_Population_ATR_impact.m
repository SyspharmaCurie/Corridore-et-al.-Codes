function MAIN_Virtual_Population_ATR_impact ()

% The following code has for goal to show the impact of protein levels of
% ATR (kfATR) on TMZ AUC, 3-drug AUC and their difference in indicated VP
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
kf_ATR_distr_MGMT_M_TMZalone=dataset_MGMT_M_TMZalone(:,14);
kf_ATR_distr_MGMT_M_HRBERinh=dataset_MGMT_M_HRBERinh(:,14);

abs_output_MGMT_M=(survcurv_AUC_vec_MGMT_M_TMZalone-survcurv_AUC_vec_MGMT_M_HRBERinh);
abs_output_MGMT_P=(survcurv_AUC_vec_MGMT_P_TMZalone-survcurv_AUC_vec_MGMT_P_HRBERinh);

[Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
colororder({'k','#808080'});
figure(1999)
clf
yyaxis right
[X_kf_ATR_TMZalone,I]=sort(kf_ATR_distr_MGMT_M_TMZalone);
Y1_abs_output=abs_output_MGMT_M(I);
Y2_abs_output=abs_output_MGMT_P(I);

X2_kf_ATR_TMZalone = [X_kf_ATR_TMZalone;flipud(X_kf_ATR_TMZalone)];
inBetween_abs_output = [Y1_abs_output;flipud(Y2_abs_output)];
fill(X2_kf_ATR_TMZalone, inBetween_abs_output,color_conv_an_rgb(Tol_bright{1}),'FaceAlpha',0.25,'LineStyle','none');
hold on
inBetween_abs_output2 = [Y1_abs_output;flipud(X_kf_ATR_TMZalone)];
fill(X2_kf_ATR_TMZalone, inBetween_abs_output2,color_conv_an_rgb(Tol_bright{3}),'FaceAlpha',0.25,'LineStyle','none');
ylabel('Survival curve AUC diff.')

yyaxis left

Y1_AUC_TMZalone=survcurv_AUC_vec_MGMT_M_TMZalone(I);
Y2_AUC_TMZalone=survcurv_AUC_vec_MGMT_P_TMZalone(I);
plot(X_kf_ATR_TMZalone,Y1_AUC_TMZalone,'-','Color',Tol_bright{3},'LineWidth',3)
hold on
plot(X_kf_ATR_TMZalone,Y2_AUC_TMZalone,'-','Color',Tol_bright{1},'LineWidth',3)
[X_kf_ATR_HRBERinh,I]=sort(kf_ATR_distr_MGMT_M_HRBERinh);
Y1_AUC_HRBERinh=survcurv_AUC_vec_MGMT_M_HRBERinh(I);
Y2_AUC_HRBERinh=survcurv_AUC_vec_MGMT_P_HRBERinh(I);
plot(X_kf_ATR_HRBERinh,Y1_AUC_HRBERinh,'--','Color',Tol_bright{3},'LineWidth',3)
plot(X_kf_ATR_HRBERinh,Y2_AUC_HRBERinh,'--','Color',Tol_bright{1},'LineWidth',3)

legend('TMZ alone, MGMT-','TMZ alone, MGMT+','TMZ+RI1+Nirap, MGMT-','TMZ+RI1+Nirap, MGMT+','AUC diff., MGMT-','AUC diff., MGMT+')
xlim([0,4e-5])
xlabel('kf_{ATR}')
ylabel('Survival curve AUC')
set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
box off
%% Computational Time End
wholeTime = toc(now1)
disp('sec')


end


