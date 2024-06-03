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
Time_res_dir=ut.create_res_fold('GB_CV_HRBERinh_Abs_allpat')

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir_TMZalone="Results_2024-03-29_15.30.14_TMZalone/"
Time_data_dir_BERinh="Results_2024-03-30_19.53.04_BERinh/"
Time_data_dir_HRinh="Results_2024-03-31_07.08.57_HRinh/"
Time_data_dir_HRBERinh="Results_2024-03-29_21.48.48_HRBERinh/"

patientnumb=80000; #number of patients for each tratment dataset
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_BERinh,Time_data_dir_TMZalone,patientnumb)
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_HRinh,Time_data_dir_TMZalone,patientnumb)
dataset_treat,output_relative,output_absolute,output_TMZalone,output_BERHRInh=ut.cv_datasetoutput(Time_data_dir_HRBERinh,Time_data_dir_TMZalone,patientnumb)

# plt.hist(output_relative,bins=100)
# plt.show() 

# plt.hist(output_absolute,bins=100)
# plt.show() 

#Output definition
# output=output_relative
output=output_absolute

t_dataset=ut.print_difftime(t_start,'Dataset upload time')

# Step 1: Data Splitting
X_train, X_prev, y_train, y_prev = train_test_split(dataset_treat, output, test_size=0.2, random_state=42)
t_dataset_split=ut.print_difftime(t_dataset,'Dataset Split time')

# Step 2: Building Gradient Boosting Models
GB = GradientBoostingRegressor(loss='squared_error',n_estimators=500,max_features=None)

# Step 3: Cross-Validation for Hyperparameter Tuning
cv = KFold(n_splits=10, shuffle=True, random_state=42)
param_grid = {
    # 'loss' : ['squared_error'],
    # 'n_estimators' : [10, 100, 500],
    'max_depth' : [11,13],
    # 'max_features' : ['sqrt', None]
}
param_grid_list=list(ParameterGrid(param_grid))

perform_cv(X_train,y_train,GB,param_grid,cv,Time_res_dir)
save_cv_results(Time_res_dir)
t_cv=ut.print_difftime(t_dataset_split,'Cross Validation time')

# Step 4: Compute calibrated model error on the prevision data
ComputeSave_preverr(X_prev,y_prev,Time_res_dir)
t_preverr=ut.print_difftime(t_cv,'Previon Data Error time')

# Step 5: Learning Curve on the whole dataset
perform_lc(dataset_treat,output,Time_res_dir)
save_lc_results(Time_res_dir)
t_lc=ut.print_difftime(t_preverr,'Learning Curve time')

# Computing_time: end
ut.print_difftime(t_start,'Total time')
