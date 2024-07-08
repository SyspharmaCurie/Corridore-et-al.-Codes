% The goal of this code is to employ the calibrated TMZ model to identify
% optimal drug targets which inhibition would enhance TMZ antitumor
% efficacy. An in silico search was performed by inhibiting each possible
% target present in the model over the whole TMZ exposure duration.
% Here we aimed at identifying drug combinations composed of TMZ and a
% single targeted molecule, at various levels from 0 to 100% corresponding
% to different target affinities or doses.

clear all
format long

%% Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));
TMZPKPD_dir = './1inhibitor_calib_TMZ_PK-PD_model' ;
Other_funcs = './Other_funcs' ;
% Set current directory to 'my_dir' and add path to sub-folders:
restoredefaultpath
cd(my_dir)
addpath(genpath(TMZPKPD_dir))
addpath(genpath(Other_funcs))

%% Inhibitor Combinations and result folder (use the column "InhibitorIndex in Inhibitor_names_extended.csv")
inhib_comb_numb=33;%number of targets to inhibit

%% Read inhibitor names
filename_inhibitors='Inhibitor_names.xlsx';
Inhib_name_tab = readtable(filename_inhibitors);
Inhib_name_mat_ext=table2array(Inhib_name_tab(:,1));
%%% Read inhibitor names END

%% Steady state DMSO population
DMSO_pop_MGMT_M=100*ones(721,1);
DMSO_pop_MGMT_P=DMSO_pop_MGMT_M;

%% TMZ concentration and inhibition level
%TMZ
xvec=(-2:0.5:10);
fvec=2.^xvec;
TMZout0_surv=[0 fvec];
%Inhibition
inhib_level_vec=[1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.001 ];
inhib_level_num=size(inhib_level_vec,2);
[coeff1_mat,coeff2_mat]=meshgrid(inhib_level_vec,1);
grid_size=size(coeff1_mat);

%% Resulting AUC and IC50 vector and cell definition 
tm_cell_mat=cell(grid_size);
um_cell_mat=cell(grid_size);
tcellpopm_cell_mat=cell(grid_size);
cellpopom_cell_mat=cell(grid_size);
surv_curvm_MGMT_M_mat=cell(grid_size);
surv_curvm_MGMT_P_mat=cell(grid_size);
survAUC_MGMT_M_mat=zeros(grid_size);
survAUC_MGMT_P_mat=zeros(grid_size);
diff_survAUC_MGMT_P_M=zeros(grid_size);
IC50_MGMT_M_mat=zeros(grid_size);
IC50_MGMT_P_mat=zeros(grid_size);

survAUC_MGMT_M_cell=cell(1,inhib_comb_numb);
survAUC_MGMT_P_cell=cell(1,inhib_comb_numb);

tm_cell_tot=cell(inhib_comb_numb,1);
um_cell_tot=cell(inhib_comb_numb,1);
tcellpopm_cell_tot=cell(inhib_comb_numb,1);
cellpopm_cell_tot=cell(inhib_comb_numb,1);
surv_curvm_MGMT_M_tot=cell(inhib_comb_numb,1);
surv_curvm_MGMT_P_tot=cell(inhib_comb_numb,1);
survAUC_totinh_MGMT_M=zeros(inhib_comb_numb,1);
survAUC_totinh_MGMT_P=zeros(inhib_comb_numb,1);
IC50_MGMT_M_cell=cell(inhib_comb_numb,1);
IC50_MGMT_P_cell=cell(inhib_comb_numb,1);
IC50_totinh_MGMT_M=zeros(inhib_comb_numb,1);
IC50_totinh_MGMT_P=zeros(inhib_comb_numb,1);

%% AUC and IC50 computation
for inhib_comb=1:inhib_comb_numb
    empl_inhib_name=Inhib_name_mat_ext(inhib_comb)'
     inhib_factor=ones(inhib_comb_numb,1);
        for j=1:inhib_level_num
            
            inhib_factor(inhib_comb)=inhib_level_vec(j);
            
            [tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,surv_curvm_MGMT_M,surv_curvm_MGMT_P,survAUC_MGMT_M,survAUC_MGMT_P,IC50_MGMT_M,IC50_MGMT_P] = compute_survcurv_AUC(TMZout0_surv,inhib_factor,DMSO_pop_MGMT_M,DMSO_pop_MGMT_P);
            
            tm_cell_mat{inhib_comb,j}=tm_cell;
            um_cell_mat{inhib_comb,j}=um_cell;
            tcellpopm_cell_mat{inhib_comb,j}=tcellpopm_cell;
            cellpopom_cell_mat{inhib_comb,j}=cellpopm_cell;
            surv_curvm_MGMT_M_mat{inhib_comb,j}=surv_curvm_MGMT_M;
            surv_curvm_MGMT_P_mat{inhib_comb,j}=surv_curvm_MGMT_P;
            survAUC_MGMT_M_mat(inhib_comb,j)=survAUC_MGMT_M;
            survAUC_MGMT_P_mat(inhib_comb,j)=survAUC_MGMT_P;
            diff_survAUC_MGMT_P_M(inhib_comb,j)=survAUC_MGMT_P-survAUC_MGMT_M;
            IC50_MGMT_M_mat(inhib_comb,j)=IC50_MGMT_M;
            IC50_MGMT_P_mat(inhib_comb,j)=IC50_MGMT_P;
       
        end
end

figure(1)
subplot(1,2,1)
hM=heatmap(IC50_MGMT_M_mat);
hM.ColorbarVisible = 'off';
colormap(hM,flipud(parula))


hM.YDisplayLabels=Inhib_name_mat_ext;
hM.XDisplayLabels={'0%','10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'};
hM.Title = 'MGMT^-';
hM.ColorLimits = [0 200];
hM.GridVisible = 'off';
 
subplot(1,2,2)
hP=heatmap(IC50_MGMT_P_mat);
colormap(hP,flipud(parula))

hP.Title = 'MGMT^+';
hP.YDisplayLabels=NaN*ones(length(IC50_MGMT_P_mat),1);
hP.XDisplayLabels={'0%','10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'};
hP.ColorLimits = [0 200];
hP.GridVisible = 'off';





%% Final
wholeTime = toc(now1)


