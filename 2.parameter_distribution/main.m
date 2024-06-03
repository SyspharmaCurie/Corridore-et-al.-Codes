%The following code has for goal to print the distributions of the
%estimated parameters using the values tested in the CMAES code and
%collected in the folder "Results"

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
addpath(genpath('./outcmaes'))

%% Set cmeas files and optimal param set
[outputs_dir] = output_dir_def();
optim_dir = "Multi_init_cond/LOUP4/Results_2023-08-17_11.03.14/Init_cond_1/";

%% Param names
param_name={'TMZout0\_Ka\_XTMZ','MGMT\_P0','k\_MGMT','k\_addO','k\_addN','DSB\_72h\_fac','k\_DSBO','k\_DSBN','k\_CyA','fVX','kf\_ATR\_MGMT\_P','k\_ATR','K\_add','kd\_pATR','k\_Chk1','C\_Chk1','pChk1\_ref12\_5\_24h','pChk1\_ref100\_24h','pChk1\_ref100\_48h','kd\_pChk1','k\_cdc25','K\_cdc25','kf\_p53','k\_p53','K\_ATR','p53ser46\_ref50\_72h','kp\_ser46','K\_p53','upAsy','sness','k\_apop','tED50','cell\_pop\_norm0\_Jack\_MGMT\_P','k\_dis'};
param_num=size(param_name,2);

%% Charge cmeas files
[all_param,all_param_scale,all_cost,LO_main,UP_main,opt_scale_param]=cmaes_file_selec(outputs_dir,optim_dir,param_num);
[min_cost,idx_min]=min(all_cost);

min_param_scale=all_param_scale(idx_min,:);

idx=find(all_cost<1.01*min_cost);% Define the tollerance

param_dist=all_param(idx,:);
stdvec=std(param_dist);
param_scale_dist=all_param_scale(idx,:);
cost_dist=all_cost(idx,:);

%% Plot
% param_vs_costfunc_v26(param_name,param_dist,cost_dist,LO_main,UP_main)
% param_istgmm_v26(param_name,param_dist,LO_main,UP_main)
% param_vs_costfunc_v26(param_name,param_scale_dist,cost_dist,zeros(size(LO_main)),ones(size(UP_main)))
% param_istgmm_v26(param_name,param_scale_dist,opt_scale_param,zeros(size(LO_main)),ones(size(UP_main)))
vec_distrtoplot=[(2:16) (20:25) (27:34)];% param to plot
param_distr_plot(param_scale_dist,param_num,opt_scale_param,min_param_scale,param_name,vec_distrtoplot)


%% Save all_param
writematrix(param_dist,'../3.rvinecop_analysis/all_param.csv')  %The data are saved in R code folder ("3.rvinecop_analysis") to performe R-vine-copula analysis.


%% Computational Time End
wholeTime = toc(now1)
disp('sec')


