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
addpath(genpath('./Data_read_funcs'))
addpath(genpath('./fig_funcs'))
addpath(genpath('./outcmaes'))

%% Set cmeas files and optimal param set
[outputs_dir] = output_dir_def();
optim_dir = "Multi_init_cond/LOUP4/Results_2023-08-17_11.03.14/Init_cond_1/";

%% Param names
param_name={'TMZout0\_Ka\_XTMZ','MGMT','k_{MGMT}','k_{AddO','k_{AddN}','DSB\_72h\_fac','k_{DSBO}','k_{DSBN}','k_{CyA}','fVX','kf_{ATR}','k_{ATR}','K_{add}','kd_{pATR}','k_{CHK1}','CHK1','pChk1\_ref12\_5\_24h','pChk1\_ref100\_24h','pChk1\_ref100\_48h','kd_{pCHK1}','k_{CDC25}','K_{CDC25}','kf_{p53}','k_{p53}','K_{ATR}','p53ser46\_ref50\_72h','kp_{ser46}','K_{p53}','UpAsy','Stiff','k_{apop}','tED50','cell\_pop\_norm0\_Jack\_MGMT\_P','k\_dis'};
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
vec_distrtoplot=[(2:5) (7:9) (10:16) (20:25) (27:32)];% param to plot
param_distr_plot(param_scale_dist,param_num,opt_scale_param,min_param_scale,param_name,vec_distrtoplot)


%% Computational Time End
wholeTime = toc(now1)
disp('sec')


