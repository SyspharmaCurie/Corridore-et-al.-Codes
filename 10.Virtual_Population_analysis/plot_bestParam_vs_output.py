#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 19 16:38:49 2023

@author: sergiocorridore
"""
import os
print("Current working directory: {0}".format(os.getcwd()))

import pandas as pd
import numpy as np

import time
from datetime import datetime

# -- create new folder 
import os

# -- machine-learning
from sklearn import tree
from sklearn.ensemble import GradientBoostingRegressor
# tunning
from sklearn.model_selection import train_test_split, KFold
# metrics
from sklearn.metrics import mean_squared_error, r2_score, accuracy_score
# Parameters Grid
from sklearn.model_selection import ParameterGrid

# -- save python object
import pickle

# -- Figures
import matplotlib.pyplot as plt

# -- my functions
import utils as ut
from perform_an import perform_cv,save_cv_results
from perform_an import ComputeSave_preverr
from perform_an import perform_lc,save_lc_results
from plot_FUNCs import plot_param_vs_output, plot_param_vs_output_3d,plot_param_vs_hist

#computing_time: start
t_start = time.time()

# Create the Results directory
Time_res_dir=ut.create_res_fold('Plot_bestParam_vs_output')

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir_TMZalone="Results_2024-03-25_13.04.43_TMZalone/"
Time_data_dir_BERinh="Results_2024-03-25_14.56.01_BERinh/"
Time_data_dir_HRinh="Results_2024-03-25_15.00.46_HRinh/"
Time_data_dir_HRBERinh="Results_2024-03-25_15.01.57_HRBERinh/"

patientnumb=79998; #number of patients for each tratment dataset
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_BERinh,Time_data_dir_TMZalone,patientnumb)
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_HRinh,Time_data_dir_TMZalone,patientnumb)
dataset_treat,output_relative,output_absolute,output_TMZalone,output_BERHRInh,=ut.cv_datasetoutput(Time_data_dir_HRBERinh,Time_data_dir_TMZalone,patientnumb)

#Output definition
output=output_relative
# output=output_absolute

t_dataset=ut.print_difftime(t_start,'Dataset upload time')

# plot_param_vs_output(dataset_treat.k_MMR,output_TMZalone,'k_MMR',Time_res_dir)
# plot_param_vs_output(dataset_treat.MGMT0,output_TMZalone,'MGMT0',Time_res_dir)
plot_param_vs_output(dataset_treat.k_MMR,output_BERHRInh,'k_MMR',Time_res_dir)
plot_param_vs_output(dataset_treat.MGMT0,output_BERHRInh,'MGMT0',Time_res_dir)

plot_param_vs_hist(dataset_treat.k_MMR,'k_MMR',Time_res_dir)
plot_param_vs_hist(dataset_treat.Cdc250,'Cdc250',Time_res_dir)
plot_param_vs_hist(dataset_treat.tED50,'tED50',Time_res_dir)
plot_param_vs_hist(dataset_treat.upAsy,'upAsy',Time_res_dir)
plot_param_vs_hist(dataset_treat.sness,'sness',Time_res_dir)
plot_param_vs_hist(dataset_treat.MGMT0,'MGMT0',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_HR,'k_HR',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_BER,'k_BER',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_p53,'k_p53',Time_res_dir)
plot_param_vs_hist(dataset_treat.kf_Mdm2,'kf_Mdm2',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_apop,'k_apop',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_ATR,'k_ATR',Time_res_dir)
plot_param_vs_hist(dataset_treat.kf_Chk1,'kf_Chk1',Time_res_dir)
plot_param_vs_hist(dataset_treat.K_add,'K_add',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_CyA,'k_CyA',Time_res_dir)
plot_param_vs_hist(dataset_treat.k_DSBO,'k_DSBO',Time_res_dir)


plot_param_vs_output(dataset_treat.k_MMR,output,'k_MMR',Time_res_dir)
plot_param_vs_output(dataset_treat.Cdc250,output,'Cdc250',Time_res_dir)
plot_param_vs_output(dataset_treat.tED50,output,'tED50',Time_res_dir)
plot_param_vs_output(dataset_treat.upAsy,output,'upAsy',Time_res_dir)
plot_param_vs_output_3d(dataset_treat.tED50,dataset_treat.upAsy,output,'tED50','upAsy',Time_res_dir)
plot_param_vs_output(dataset_treat.sness,output,'sness',Time_res_dir)
plot_param_vs_output(dataset_treat.MGMT0,output,'MGMT0',Time_res_dir)
plot_param_vs_output(dataset_treat.k_HR,output,'k_HR',Time_res_dir)
plot_param_vs_output(dataset_treat.k_BER,output,'k_BER',Time_res_dir)
plot_param_vs_output(dataset_treat.k_p53,output,'k_p53',Time_res_dir)
plot_param_vs_output(dataset_treat.kf_Mdm2,output,'kf_Mdm2',Time_res_dir)
plot_param_vs_output(dataset_treat.k_apop,output,'k_apop',Time_res_dir)
plot_param_vs_output_3d(dataset_treat.k_apop,dataset_treat.kf_ATR,output,'k_apop','kf_ATR',Time_res_dir)
plot_param_vs_output(dataset_treat.k_ATR,output,'k_ATR',Time_res_dir)
plot_param_vs_output(dataset_treat.kf_Chk1,output,'kf_Chk1',Time_res_dir)
plot_param_vs_output(dataset_treat.K_add,output,'K_add',Time_res_dir)
plot_param_vs_output(dataset_treat.k_CyA,output,'k_CyA',Time_res_dir)
plot_param_vs_output_3d(dataset_treat.K_add,dataset_treat.k_CyA,output,'K_add','k_CyA',Time_res_dir)
plot_param_vs_output(dataset_treat.k_DSBO,output,'k_DSBO',Time_res_dir)


# Computing_time: end
ut.print_difftime(t_start,'Total time')
