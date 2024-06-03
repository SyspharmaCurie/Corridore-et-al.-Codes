function  MAIN_Drug_combinations_compute()

% The goal of this code is to compute the AUC of the survival curve after
% the combination of the TMZ with 1 or 2 inhibitors.
% The results are saved and it can be visualize using
% "Drug_combinations_visualiz.m".

clear all
format long

%% Computational Time Start
now1 = tic();

%% Set paths
my_dir = fileparts(which(mfilename));
TMZPKPD_dir = './Calib_TMZ_PK-PD' ;
figure_drugcomb = './fig_drugcomb_func' ;
figure_model = './fig_model_func' ;
% Set current directory to 'my_dir' and add path to sub-folders:
restoredefaultpath
cd(my_dir)
% addpath(genpath(my_dir))
addpath(genpath(TMZPKPD_dir))
addpath(genpath(figure_drugcomb))
addpath(genpath(figure_model))

%% Inhibitor Combinations and result folder (use the column "InhibitorIndex in Inhibitor_names_extended.csv")
% Column vector for combining TMZ + 1 inhibitor. Two column matrix for combining TMZ + 2 inhibitors.
% In both case, the number of lines indicate the number of combinations to test.
% To pick an inhibitor, to use the number reported in the column
% "InhibitorIndex" of "Inhibitor_names_extended.csv"

% index_vec=(0:15)';%[0 4 7]';%1 drug
% inhib_indx_mat=index_vec;

index_vec=[1 4 7];%(1:15);%2 drug
inhib_indx_mat=[0 0;nchoosek(index_vec,2)];

inhib_comb_numb=size(inhib_indx_mat,1);%number of drug combinations to simulate
empl_inhib_numb=size(inhib_indx_mat,2);%number of drug composing the combination

%% Create results folder
Results_dir=mkdir_results(empl_inhib_numb);

%% Read inhibitor names
filename_inhibitors='Inhibitor_names_extended.csv';
Inhib_name_tab = readtable(filename_inhibitors);
Inhib_name_mat_ext=table2array(Inhib_name_tab(:,1));
%%% Read inhibitor names END

%% Steady state DMSO population
[DMSO_pop_MGMT_M,DMSO_pop_MGMT_P] = DMS0_pop();

%% Number of possible inhibitors
inhib_numb=size(Inhib_name_mat_ext,1);

%% TMZ concentration and inhibition level
%TMZ doses
xvec=(-2:0.5:10);
fvec=2.^xvec;
TMZout0_surv=[0 fvec];
%Inhibition    
inhib_level_vec=(0:0.1:1);%[0 0.3 0.6 0.99];%
if empl_inhib_numb==1
    [coeff1_mat,coeff2_mat]=meshgrid(inhib_level_vec,1);
else
    [coeff1_mat,coeff2_mat]=meshgrid(inhib_level_vec,inhib_level_vec);
end
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
    empl_inhib_indx=inhib_indx_mat(inhib_comb,:)
    empl_inhib_name=Inhib_name_mat_ext(empl_inhib_indx+1)'
    
    for i=1:grid_size(1)
    inhib_factor=ones(inhib_numb,1);
    
        for j=1:grid_size(2)
            if empl_inhib_numb==1
                if empl_inhib_indx~=0
                    inhib_factor(empl_inhib_indx)=1-coeff1_mat(i,j);
                end
            else
                if empl_inhib_indx~=[0 0]
                    inhib_factor(empl_inhib_indx)=[1-coeff1_mat(i,j) 1-coeff2_mat(i,j)];
                end
            end
            
            [tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,surv_curvm_MGMT_M,surv_curvm_MGMT_P,survAUC_MGMT_M,survAUC_MGMT_P,IC50_MGMT_M,IC50_MGMT_P] = compute_survcurv_AUC(TMZout0_surv,inhib_factor,DMSO_pop_MGMT_M,DMSO_pop_MGMT_P);
            
            tm_cell_mat{i,j}=tm_cell;
            um_cell_mat{i,j}=um_cell;
            tcellpopm_cell_mat{i,j}=tcellpopm_cell;
            cellpopom_cell_mat{i,j}=cellpopm_cell;
            surv_curvm_MGMT_M_mat{i,j}=surv_curvm_MGMT_M;
            surv_curvm_MGMT_P_mat{i,j}=surv_curvm_MGMT_P;
            survAUC_MGMT_M_mat(i,j)=survAUC_MGMT_M;
            survAUC_MGMT_P_mat(i,j)=survAUC_MGMT_P;
            diff_survAUC_MGMT_P_M(i,j)=survAUC_MGMT_P-survAUC_MGMT_M;
            IC50_MGMT_M_mat(i,j)=IC50_MGMT_M;
            IC50_MGMT_P_mat(i,j)=IC50_MGMT_P;
        end
    end
    tm_cell_tot{inhib_comb}=tm_cell_mat;
    um_cell_tot{inhib_comb}=um_cell_mat;
    tcellpopm_cell_tot{inhib_comb}=tcellpopm_cell_mat;
    cellpopm_cell_tot{inhib_comb}=cellpopom_cell_mat;
    surv_curvm_MGMT_M_tot{inhib_comb}=surv_curvm_MGMT_M_mat;
    surv_curvm_MGMT_P_tot{inhib_comb}=surv_curvm_MGMT_P_mat;
    survAUC_MGMT_M_cell{inhib_comb}=survAUC_MGMT_M_mat;
    survAUC_MGMT_P_cell{inhib_comb}=survAUC_MGMT_P_mat;
    IC50_MGMT_M_cell{inhib_comb}=IC50_MGMT_M_mat;
    IC50_MGMT_P_cell{inhib_comb}=IC50_MGMT_P_mat;
    
    if empl_inhib_numb==1
        survAUC_totinh_MGMT_M(inhib_comb)=survAUC_MGMT_M_mat(end);
        survAUC_totinh_MGMT_P(inhib_comb)=survAUC_MGMT_P_mat(end);
        IC50_totinh_MGMT_M(inhib_comb)=IC50_MGMT_M_mat(end);
        IC50_totinh_MGMT_P(inhib_comb)=IC50_MGMT_P_mat(end);
    else
        survAUC_totinh_MGMT_M(inhib_comb)=survAUC_MGMT_M_mat(end,end);
        survAUC_totinh_MGMT_P(inhib_comb)=survAUC_MGMT_P_mat(end,end);
        IC50_totinh_MGMT_M(inhib_comb)=IC50_MGMT_M_mat(end,end);
        IC50_totinh_MGMT_P(inhib_comb)=IC50_MGMT_P_mat(end,end);
    end
end
%% Sorting of AUC and IC50
[inhib_indx_mat_MGMT_M_sort_survAUC,survAUC_MGMT_M_cell_sort,survAUC_totinh_MGMT_M_sort] = ...
    sort_res_totinh(inhib_indx_mat,survAUC_MGMT_M_cell,survAUC_totinh_MGMT_M);
[inhib_indx_mat_MGMT_P_sort_survAUC,survAUC_MGMT_P_cell_sort,survAUC_totinh_MGMT_P_sort] = ...
    sort_res_totinh(inhib_indx_mat,survAUC_MGMT_P_cell,survAUC_totinh_MGMT_P);

[inhib_indx_mat_MGMT_M_sort_IC50,IC50_MGMT_M_cell_sort,IC50_totinh_MGMT_M_sort] = ...
    sort_res_totinh(inhib_indx_mat,IC50_MGMT_M_cell,IC50_totinh_MGMT_M);
[inhib_indx_mat_MGMT_P_sort_IC50,IC50_MGMT_P_cell_sort,IC50_totinh_MGMT_P_sort] = ...
    sort_res_totinh(inhib_indx_mat,IC50_MGMT_P_cell,IC50_totinh_MGMT_P);

%% Save AUC and IC50
save (strcat(Results_dir,'/TMZout0_surv'),'TMZout0_surv');
save (strcat(Results_dir,'/tm_cell_tot'),'tm_cell_tot');
save (strcat(Results_dir,'/um_cell_tot'),'um_cell_tot');
save (strcat(Results_dir,'/tcellpopm_cell_tot'),'tcellpopm_cell_tot');
save (strcat(Results_dir,'/cellpopm_cell_tot'),'cellpopm_cell_tot');
save (strcat(Results_dir,'/surv_curvm_MGMT_M_tot'),'surv_curvm_MGMT_M_tot');
save (strcat(Results_dir,'/surv_curvm_MGMT_P_tot'),'surv_curvm_MGMT_P_tot');

save (strcat(Results_dir,'/inhib_indx_mat'),'inhib_indx_mat');
save (strcat(Results_dir,'/coeff1_mat'),'coeff1_mat');
save (strcat(Results_dir,'/coeff2_mat'),'coeff2_mat');
save (strcat(Results_dir,'/survAUC_MGMT_M_cell'),'survAUC_MGMT_M_cell');
save (strcat(Results_dir,'/survAUC_MGMT_P_cell'),'survAUC_MGMT_P_cell');
save (strcat(Results_dir,'/IC50_MGMT_M_cell'),'IC50_MGMT_M_cell');
save (strcat(Results_dir,'/IC50_MGMT_P_cell'),'IC50_MGMT_P_cell');

%% Save sorted AUC and IC50
save (strcat(Results_dir,'/survAUC_MGMT_M_cell_sort'),'survAUC_MGMT_M_cell_sort');
save (strcat(Results_dir,'/survAUC_MGMT_P_cell_sort'),'survAUC_MGMT_P_cell_sort');
save (strcat(Results_dir,'/survAUC_totinh_MGMT_M'),'survAUC_totinh_MGMT_M');
save (strcat(Results_dir,'/survAUC_totinh_MGMT_P'),'survAUC_totinh_MGMT_P');
save (strcat(Results_dir,'/inhib_indx_mat_MGMT_M_sort_survAUC'),'inhib_indx_mat_MGMT_M_sort_survAUC');
save (strcat(Results_dir,'/survAUC_totinh_MGMT_M_sort'),'survAUC_totinh_MGMT_M_sort');
save (strcat(Results_dir,'/inhib_indx_mat_MGMT_P_sort_survAUC'),'inhib_indx_mat_MGMT_P_sort_survAUC');
save (strcat(Results_dir,'/survAUC_totinh_MGMT_P_sort'),'survAUC_totinh_MGMT_P_sort');

save (strcat(Results_dir,'/IC50_MGMT_M_cell_sort'),'IC50_MGMT_M_cell_sort');
save (strcat(Results_dir,'/IC50_MGMT_P_cell_sort'),'IC50_MGMT_P_cell_sort');
save (strcat(Results_dir,'/IC50_totinh_MGMT_M'),'IC50_totinh_MGMT_M');
save (strcat(Results_dir,'/IC50_totinh_MGMT_P'),'IC50_totinh_MGMT_P');
save (strcat(Results_dir,'/inhib_indx_mat_MGMT_M_sort_IC50'),'inhib_indx_mat_MGMT_M_sort_IC50');
save (strcat(Results_dir,'/IC50_totinh_MGMT_M_sort'),'IC50_totinh_MGMT_M_sort');
save (strcat(Results_dir,'/inhib_indx_mat_MGMT_P_sort_IC50'),'inhib_indx_mat_MGMT_P_sort_IC50');
save (strcat(Results_dir,'/IC50_totinh_MGMT_P_sort'),'IC50_totinh_MGMT_P_sort');

%% Final
wholeTime = toc(now1)


end

