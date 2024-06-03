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

#computing_time: start
t_start = time.time()

# Create the Results directory
Time_res_dir=ut.create_res_fold('GB_CV_TMZalone')

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir="Results_2024-03-21_21.17.24_TMZalone/"
# Time_data_dir=""
# Time_data_dir=""
# Time_data_dir=""
[patient_param_MGMT_M,patient_param_MGMT_P,patient_survcurvAUC_MGMT_M,patient_survcurvAUC_MGMT_P]=ut.PKPDmodel_sim(Time_data_dir)


patientnumb=79998; #number of patients for each tratment dataset
dataset_MGMT_M=patient_param_MGMT_M.iloc[0:patientnumb]
dataset_MGMT_P=patient_param_MGMT_P.iloc[0:patientnumb]
output_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb]
output_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb]

# plt.hist(output_MGMT_M,bins=100)
# plt.show() 

# plt.hist(output_MGMT_P,bins=100)
# plt.show() 

# Step 1: Data Splitting
X_train_MGMT_M, X_prev_MGMT_M, y_train_MGMT_M, y_prev_MGMT_M = train_test_split(dataset_MGMT_M, output_MGMT_M, test_size=0.2, random_state=42)
X_train_MGMT_P, X_prev_MGMT_P, y_train_MGMT_P, y_prev_MGMT_P = train_test_split(dataset_MGMT_P, output_MGMT_P, test_size=0.2, random_state=42)
t_data=ut.print_difftime(t_start,'Read and split Data')

# Step 2: Building Decision Tree Model
GB_MGMT_M = GradientBoostingRegressor(loss='squared_error',max_features=None)
GB_MGMT_P = GradientBoostingRegressor(loss='squared_error',max_features=None)

# Step 3: Cross-Validation for Hyperparameter Tuning
cv = KFold(n_splits=10, shuffle=True, random_state=42)
param_grid = {
    # 'loss' : ['squared_error'],
    'n_estimators' : [200, 300],
    'max_depth' : [15, 30, 60],
    # 'max_features' : ['sqrt', None]

}
param_grid_list=list(ParameterGrid(param_grid))

perform_cv(X_train_MGMT_M,y_train_MGMT_M,GB_MGMT_M,param_grid,cv,Time_res_dir,'M')
save_cv_results(Time_res_dir,'M')
t_cv_MGMT_M=ut.print_difftime(t_data,'MGMT- Cross Validation time')
perform_cv(X_train_MGMT_P,y_train_MGMT_P,GB_MGMT_P,param_grid,cv,Time_res_dir,'P')
save_cv_results(Time_res_dir,'P')
t_cv_MGMT_P=ut.print_difftime(t_cv_MGMT_M,'MGMT+ Cross Validation time')

# Step 4: Compute calibrated model error on the prevision data
ComputeSave_preverr(X_prev_MGMT_M,y_prev_MGMT_M,'M',Time_res_dir)
ComputeSave_preverr(X_prev_MGMT_P,y_prev_MGMT_P,'P',Time_res_dir)
t_preverr=ut.print_difftime(t_cv_MGMT_P,'Previon Data Error time')

# Step 5: Learning Curve on the whole dataset
perform_lc(dataset_MGMT_M,output_MGMT_M,Time_res_dir,'M')
save_lc_results(Time_res_dir,'M')
perform_lc(dataset_MGMT_P,output_MGMT_P,Time_res_dir,'P')
save_lc_results(Time_res_dir,'P')
t_lc=ut.print_difftime(t_preverr,'Learning Curve time')

# Computing_time: end
ut.print_difftime(t_start,'Total time')
