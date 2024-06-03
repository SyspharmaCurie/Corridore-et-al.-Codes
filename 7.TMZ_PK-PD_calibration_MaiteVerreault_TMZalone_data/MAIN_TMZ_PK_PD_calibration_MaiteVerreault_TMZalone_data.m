function MAIN_TMZ_PK_PD_calibration_MaiteVerreault_TMZalone_data()

%The following code has for goal to estimate the data provided by Maïte
%Verrault with the only application of TMZ, and collected in the folder
%"Data" with the PK-PD model which equations are reported in "TMZ_PK_PD_ODE.m".
% TO NOTE: "estimation=0" to visualize the model with the initial
% parameters. "estimation=1" to perform the model calibration and then to
% visualize the model with the estmated parameters.


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
addpath(genpath('./cmaes_anx_funcs'))
addpath(genpath('./fig_funcs'))
addpath(genpath('./Legend_colors'))
addpath(genpath('./lin_regression'))
%% Fix simulation index
global sn_Verre_TMZalone_0TMZ_MGMT_M sn_Verre_TMZalone_5TMZ_MGMT_M sn_Verre_TMZalone_25TMZ_MGMT_M sn_Verre_TMZalone_50TMZ_MGMT_M sn_Verre_TMZalone_100TMZ_MGMT_M sn_Verre_TMZalone_200TMZ_MGMT_M sn_Verre_TMZalone_400TMZ_MGMT_M sn_Verre_TMZalone_800TMZ_MGMT_M sn_Verre_TMZalone_1000TMZ_MGMT_M...
    sn_Verre_TMZalone_0TMZ_MGMT_P sn_Verre_TMZalone_5TMZ_MGMT_P sn_Verre_TMZalone_25TMZ_MGMT_P sn_Verre_TMZalone_50TMZ_MGMT_P sn_Verre_TMZalone_100TMZ_MGMT_P sn_Verre_TMZalone_200TMZ_MGMT_P sn_Verre_TMZalone_400TMZ_MGMT_P sn_Verre_TMZalone_800TMZ_MGMT_P sn_Verre_TMZalone_1000TMZ_MGMT_P...
    sim_number
    sim_indx()

%% plot control
[Verre_surv_TMZalone_PKPDplot_fig,pop_model_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fig,...
    Verre_surv_TMZalone_PKPDplot_fignumb,pop_model_TMZalone_survcurv_fignumb,Verre_surv_TMZalone_survcurv_fignumb] = plot_control();


%% Create legend colors folder and file
Legend_colors_dir=strcat('Legend_colors/');
if ~exist(Legend_colors_dir,'dir')
    mkdir(Legend_colors_dir);
end
fileID=fopen(strcat(Legend_colors_dir,'Legend_colors.txt'),'w');
fclose(fileID);

%% DATA
[DSB_He_ldTMZ_MGMT_M_72h,DSB_He_ldTMZ_MGMT_P_72h,...
          TMZ_surv_Verre_TMZalone_MGMT_M,surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...
          TMZ_surv_Verre_TMZalone_MGMT_P,surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P] = data_reader();
      
%% volume in L
Vcell=7*1e-12;
%intracellular volume in L
Vin=1e6*Vcell;
%extracellular medium in L
Vout=2e-3;

%% Time in hours
[numb_comptime1,t_Verre_surv] = simulations_time();

%% Initial conditions, in microM
[TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,mO60,RNA_MGMT0,MGMT0_U87_LN229,GT0,SSB0,Cdc250,RNA_Mdm20,Mdm20,cell_pop0,cell_pop_norm0_Verre_MGMT_M] = def_int_cond(...
    TMZ_surv_Verre_TMZalone_MGMT_M,TMZ_surv_Verre_TMZalone_MGMT_P);

%% PARAMETERS 
[pA,pT2,pA2,kT0,lambdaT,kM0,lambdaM,pH0,kcat,dna,kd_MGMT,omega_cc,t0_cc,M_cc,A_cc,phi_cc,n_cc,...
    k_GT,k_MMR,k_BER,kd_ATR,n_add,kf_Chk1_MGMT_M,kd_Chk1,kd_cdc25,n_cdc25,...
    n_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kt_Mdm2,kt_Mdm2p53,n_p53,kf_Mdm2,n_p53int,...
    k_addO,k_addN,DSB_72h_fac,k_DSBO,k_DSBN,K_add,k_Chk1,C_Chk1,...
    kd_pChk1,k_cdc25,K_cdc25,K_p53,cell_pop_norm0_Verre_MGMT_P...
    ] = def_params();

%% PARAMETERS to estimate
[upAsy,tED50,kf_p53,sness,k_ATR,k_apop,k_p53,kd_pATR,k_CyA,k_MGMT,pT,k_HR,MGMT_P0,kf_ATR_MGMT_M,kf_ATR_MGMT_P] = def_params_toEstimate();
orig_param = def_original_params();

%% estimation Algorithm control
estimation=0
cmaes_maxiter=2;
cmaesloop_size=12;
cmaes_run_number=1;

for cmaes_run=1:cmaes_run_number
    cmaes_run
%% Create Results folder
Results_dir=mkdir_results();    
    
%% Elements depending on PARAMETERS
[K_ATR,kp_ser46,kf_MGMT_M,kf_MGMT_P,K_cc,k_addEx,mN370,DSB0,...
    ATR0_MGMT_M,pATR0_MGMT_M,...
    ATR0_MGMT_P,pATR0_MGMT_P,...
    Chk10_MGMT_M,kf_Chk1_MGMT_P,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kd_ser46_MGMT_M,kd_ser46_MGMT_P,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kd_Mdm2] = param_dep_elem(...
    RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,DSB_He_ldTMZ_MGMT_M_72h,k_HR,k_DSBN,k_CyA,n_cc,...
    k_BER,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,n_add,K_add,kd_ATR,...
    kd_pATR,...
    kf_Chk1_MGMT_M,k_Chk1,kd_Chk1,C_Chk1,...
    kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2);


%% Simulation Initial conditions
[int_cond_mat]= initial_cond_func(TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,GT0,SSB0,mN370,DSB0,Cdc250,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,MGMT_P0,...
    ATR0_MGMT_M,...
    ATR0_MGMT_P,...
    pATR0_MGMT_M,pATR0_MGMT_P,...
    Chk10_MGMT_M,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,...
    p53_ser460_MGMT_M,p53_ser460_MGMT_P);


%% Estimation Algorithm
if estimation==1
    
    Results_cmaes_dir=strcat(Results_dir,'/cmaes_files');
if ~exist(Results_cmaes_dir,'dir')
    mkdir(Results_cmaes_dir);
end
    
%%%Parameters to estimate
param0=[upAsy,tED50,kf_p53,sness,k_ATR,k_apop,k_p53,kd_pATR,k_CyA,k_MGMT,pT,k_HR,MGMT_P0,kf_ATR_MGMT_M,kf_ATR_MGMT_P];
param_name={'upAsy','tED50','kf_p53','sness','k_ATR','k_apop','k_p53','kd_pATR','k_CyA','k_MGMT','pT','k_HR','MGMT_P0','kf_ATR_MGMT_M','kf_ATR_MGMT_P'};
%%%Parameters to estimate END

%%%Search space
[LO,UP] = cmaes_search_space(orig_param,param0);
%%%Search space END

%%%Parameter Scaling to [0,1]
    param0_scale=(log(param0)-log(LO))./(log(UP)-log(LO));
    LO_scale=(log(LO)-log(LO))./(log(UP)-log(LO));
    UP_scale=(log(UP)-log(LO))./(log(UP)-log(LO));
%%%Parameter Scaling END

%%%cmaes options
    options.TolFun=1e-1;
    options.TolX=1e-4;
    options.tolhistfun=1e-2;
    options.MaxIter=cmaes_maxiter;
    % options.MinIter=7;
    options.LogPlot = 'on';
    options.LBounds = LO_scale';
    options.UBounds = UP_scale';
    options.StopOnWarnings = 'no';
%     options.LogModulo = '0';
    options.LogPlot = 'off';
    options.SaveVariables = 'on';
    options.LogFilenamePrefix=strcat(Results_cmaes_dir,'/outcmaes');
    options.SaveFilename=strcat(Results_cmaes_dir,'/variablescmaes.mat');
    % sigma=1e-4*ones(11,1);
    sigma=[];
%%%cmaes options END

%%cmaes loop
param_scale=zeros(size(param0,2),cmaesloop_size);
param=zeros(size(param0,2),cmaesloop_size);
cost=zeros(cmaesloop_size,1);

%%%cmaes
parfor counter=1:cmaesloop_size
    
[param_cmaes_scale,cout,counteval,stopflag,out,bestever_cmaes_scale]= cmaes('cost_function_computation',param0_scale',sigma,options,counter,LO',UP',t_Verre_surv,numb_comptime1,...
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...%simulations initial conditions
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,RNA_MGMT0,GT0,SSB0,Cdc250,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,...
    cell_pop0,cell_pop_norm0_Verre_MGMT_M,cell_pop_norm0_Verre_MGMT_P,...
    surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...data
    surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    DSB_He_ldTMZ_MGMT_M_72h,...
    Vin,Vout,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...%simulation parameters
    kd_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_BER,kd_ATR,kf_Chk1_MGMT_M,kd_Chk1,n_cdc25,kd_cdc25,n_cc,n_add,...
    n_ATR,kd_p53,kd_p53Mdm2,n_Mdm2,K_Mdm2,kt_Mdm2,kt_Mdm2p53,n_p53,kf_Mdm2,n_p53int,...
    k_addO,k_addN,DSB_72h_fac,k_DSBO,k_DSBN,K_add,k_Chk1,C_Chk1,...
    kd_pChk1,k_cdc25,K_cdc25,K_p53);
%%%cmaes END

%%%Parameter Scaling to [LO,UP]
    param_scale(:,counter)=bestever_cmaes_scale.x;
    param(:,counter)=LO'.*(UP'./LO').^param_scale(:,counter);
    cost(counter)=bestever_cmaes_scale.f;
    
%%%Parameter Scaling to [LO,UP] END
% % % % % % % to verify the scalings are inverse functions
% % % % % % % param=LO.*(UP./LO).^param0_scale;
% % % % % % % param-param0

%%%Print estimated parameters
print_estim_param( Results_dir,param_name,param(:,counter),param_scale(:,counter),cost(counter),counter);

%%%Print cmaes loop index
print_cmaes_loop_idx( Results_dir,counter);
end

%find best parameter set
[bestcost,bestcost_indx]=min(cost);
param_scale_fin=param_scale(:,bestcost_indx);
param_fin=param(:,bestcost_indx);

%Print fin parameters cost func
print_fin_param( Results_dir,param_name,param_fin,param_scale_fin,bestcost,LO,UP);

%%%Estimated parameters
i=1;
upAsy=param_fin(i);i=i+1;
tED50=param_fin(i);i=i+1;
kf_p53=param_fin(i);i=i+1;
sness=param_fin(i);i=i+1;
k_ATR=param_fin(i);i=i+1;
k_apop=param_fin(i);i=i+1;
k_p53=param_fin(i);i=i+1;
kd_pATR=param_fin(i);i=i+1;
k_CyA=param_fin(i);i=i+1;
k_MGMT=param_fin(i);i=i+1;
pT=param_fin(i);i=i+1;
k_HR=param_fin(i);i=i+1;
MGMT_P0=param_fin(i);i=i+1;
kf_ATR_MGMT_M=param_fin(i);i=i+1;
kf_ATR_MGMT_P=param_fin(i);

%%%Estimated parameters END

%% Elements depending on the estimated parameters
[K_ATR,kp_ser46,kf_MGMT_M,kf_MGMT_P,K_cc,k_addEx,mN370,DSB0,...
    ATR0_MGMT_M,pATR0_MGMT_M,...
    ATR0_MGMT_P,pATR0_MGMT_P,...
    Chk10_MGMT_M,kf_Chk1_MGMT_P,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,p53_ser460_MGMT_M,p53_ser460_MGMT_P,kd_ser46_MGMT_M,kd_ser46_MGMT_P,ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P,kd_Mdm2] = param_dep_elem(...
    RNA_MGMT0,MGMT0_U87_LN229,MGMT_P0,kd_MGMT,...
    Cdc250,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25,...
    DSB_72h_fac,DSB_He_ldTMZ_MGMT_M_72h,k_HR,k_DSBN,k_CyA,n_cc,...
    k_BER,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,k_ATR,n_add,K_add,kd_ATR,...
    kd_pATR,...
    kf_Chk1_MGMT_M,k_Chk1,kd_Chk1,C_Chk1,...
    kd_pChk1,...
    k_cdc25,kd_cdc25,...
    kf_p53,k_p53,n_ATR,kd_p53,kd_p53Mdm2,Mdm20,n_Mdm2,K_Mdm2,...
    kt_Mdm2,kt_Mdm2p53,n_p53,K_p53,RNA_Mdm20,kf_Mdm2);


%% Final Initial Conditions
[int_cond_mat]= initial_cond_func(TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,GT0,SSB0,mN370,DSB0,Cdc250,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,MGMT_P0,...
    ATR0_MGMT_M,...
    ATR0_MGMT_P,...
    pATR0_MGMT_M,pATR0_MGMT_P,...
    Chk10_MGMT_M,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,...
    p53_ser460_MGMT_M,p53_ser460_MGMT_P);
end

%% PK-PD Model
[tm_cell,um_cell] = simulations_PKPD(...
    t_Verre_surv,...
    int_cond_mat,RNA_MGMT0,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
    k_addO,kd_MGMT,k_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_addEx,k_addN,k_BER,k_DSBO,k_DSBN,k_HR,k_CyA,K_cc,n_cc,k_ATR,K_add,n_add,kd_ATR,kd_pATR,...
    k_Chk1,kd_Chk1,kd_pChk1,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kt_Mdm2,kt_Mdm2p53,K_p53,n_p53,kf_Mdm2,kd_Mdm2,...
    kf_MGMT_M,kf_MGMT_P,...
    kf_ATR_MGMT_M,kf_ATR_MGMT_P,...
    kf_Chk1_MGMT_M,kf_Chk1_MGMT_P,...
    kf_cdc25_MGMT_M,kf_cdc25_MGMT_P,...
    kd_ser46_MGMT_M,kd_ser46_MGMT_P,...
    ktd_Mdm2_MGMT_M,ktd_Mdm2_MGMT_P...
    );

%% Cell Cycle Model
CyAm_cell = simulations_CyA(tm_cell,um_cell,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

%% Cell population 
[TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P,...
    tcellpopm_cell,cellpopm_cell]=simulations_surv_curv(tm_cell,um_cell,cell_pop0,k_apop,n_p53int,upAsy,sness,tED50,...
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...
    numb_comptime1,...
    cell_pop_norm0_Verre_MGMT_M,cell_pop_norm0_Verre_MGMT_P);

%% Final Cost Function
[cost_surv_Verre_TMZalone_MGMT_M,cost_surv_Verre_TMZalone_MGMT_P,...
    cost_fin]=cost_function(...
    surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...%data
    surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P...%simulations
    )
cost_fin

print_fincostfun(Results_dir,cost_surv_Verre_TMZalone_MGMT_M,cost_surv_Verre_TMZalone_MGMT_P,cost_fin);

%% PLOT  PKPD
plot_setting_PKPD(TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,tm_cell,um_cell,CyAm_cell,...simulation
    Verre_surv_TMZalone_PKPDplot_fig,Verre_surv_TMZalone_PKPDplot_fignumb...plot control
    );

%% PLOT Cell population
 plot_setting_cellpop(numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,...simulations
    TMZout0_surv_Verre_MGMT_M,TMZout0_surv_Verre_MGMT_P,...TMZ
    n_p53int,upAsy,sness,tED50,...parameters
    pop_model_TMZalone_survcurv_fig,pop_model_TMZalone_survcurv_fignumb...plot control
    );

%% PLOT Survival Curves
plot_setting_viab(TMZ_surv_Verre_TMZalone_MGMT_M,surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...data
    TMZ_surv_Verre_TMZalone_MGMT_P,surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    TMZout0_surv_Verre_MGMT_M,TMZalone_surv_curvm_MGMT_M,TMZout0_surv_Verre_MGMT_P,TMZalone_surv_curvm_MGMT_P,...simulations
    Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb...figure control
    );


%%%%%Computational Time End
wholeTime = toc(now1)
disp('sec')

end





end
