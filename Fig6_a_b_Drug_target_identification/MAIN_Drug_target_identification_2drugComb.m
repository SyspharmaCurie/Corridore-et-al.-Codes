
clear all
format long

%% Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));
TMZPKPD_dir = './2inhibitor_calib_TMZ_PK-PD_model' ;
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

%% Steady state DMSO population
DMSO_pop_MGMT_M=100*ones(721,1);
DMSO_pop_MGMT_P=DMSO_pop_MGMT_M;


%% TMZ concentration and inhibition level
%TMZ
xvec=(-2:0.5:10);
fvec=2.^xvec;
TMZout0_surv=[0 fvec];
%Inhibition    
inhib_level=0.7;
grid_size=inhib_comb_numb;

%% Resulting AUC and IC50 vector and cell definition 
tm_cell_mat=cell(grid_size);
um_cell_mat=cell(grid_size);
tcellpopm_cell_mat=cell(grid_size);
cellpopom_cell_mat=cell(grid_size);
surv_curvm_MGMT_M_mat=cell(grid_size);
surv_curvm_MGMT_P_mat=cell(grid_size);
survAUC_MGMT_M_mat2=zeros(grid_size);
survAUC_MGMT_P_mat2=zeros(grid_size);
diff_survAUC_MGMT_P_M=zeros(grid_size);
IC50_MGMT_M_mat2=zeros(grid_size);
IC50_MGMT_P_mat2=zeros(grid_size);


%% AUC and IC50 computation 

for inhib_comb=1:inhib_comb_numb
    empl_inhib_name=Inhib_name_mat_ext(inhib_comb)'
        for j=1:inhib_comb
            inhib_factor=ones(inhib_comb_numb,1);
            inhib_factor(inhib_comb)=inhib_level;
            
            if j~=inhib_comb
            inhib_factor(j)=inhib_level;
            end
            
            [tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,surv_curvm_MGMT_M,surv_curvm_MGMT_P,survAUC_MGMT_M,survAUC_MGMT_P,IC50_MGMT_M,IC50_MGMT_P] = compute_survcurv_AUC(TMZout0_surv,inhib_factor,DMSO_pop_MGMT_M,DMSO_pop_MGMT_P);
            
            tm_cell_mat{inhib_comb,j}=tm_cell;
            um_cell_mat{inhib_comb,j}=um_cell;
            tcellpopm_cell_mat{inhib_comb,j}=tcellpopm_cell;
            cellpopom_cell_mat{inhib_comb,j}=cellpopm_cell;
            surv_curvm_MGMT_M_mat{inhib_comb,j}=surv_curvm_MGMT_M;
            surv_curvm_MGMT_P_mat{inhib_comb,j}=surv_curvm_MGMT_P;
            survAUC_MGMT_M_mat2(inhib_comb,j)=survAUC_MGMT_M;
            survAUC_MGMT_P_mat2(inhib_comb,j)=survAUC_MGMT_P;
            diff_survAUC_MGMT_P_M(inhib_comb,j)=survAUC_MGMT_P-survAUC_MGMT_M;
            IC50_MGMT_M_mat2(inhib_comb,j)=IC50_MGMT_M;
            IC50_MGMT_P_mat2(inhib_comb,j)=IC50_MGMT_P;
       
        end
end

figure(3)
%make triangles
ii = ones(size(IC50_MGMT_M_mat2));
idx = tril(ii);
IC50_MGMT_M_mat2(~idx) = nan;
IC50_MGMT_P_mat2(~idx) = nan;

subplot(1,2,1)
hM=heatmap(IC50_MGMT_M_mat2, 'MissingDataColor', 'w', 'GridVisible', 'on', 'MissingDataLabel', " ");

colormap(hM,flipud(parula))
hM.XDisplayLabels=Inhib_name_mat_ext(1:length(IC50_MGMT_M_mat2));
hM.YDisplayLabels=Inhib_name_mat_ext(1:length(IC50_MGMT_M_mat2));
hM.Title = 'MGMT^-';
hM.ColorLimits = [0 200];

subplot(1,2,2)
hP=heatmap(IC50_MGMT_P_mat2, 'MissingDataColor', 'w', 'GridVisible', 'on', 'MissingDataLabel', " ");

colormap(hP,flipud(parula))

hP.Title = 'MGMT^+';
hP.XDisplayLabels=Inhib_name_mat_ext(1:length(IC50_MGMT_P_mat2));
hP.YDisplayLabels=Inhib_name_mat_ext(1:length(IC50_MGMT_P_mat2));
hP.ColorLimits = [0 200];


%% Final
wholeTime = toc(now1)


%end

