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

# -- visualisation
import matplotlib.pyplot as plt
from sklearn.tree import export_graphviz
from six import StringIO
from IPython.display import Image  
import pydotplus

# -- machine-learning
from sklearn import tree
# tunning
from sklearn.model_selection import train_test_split, KFold
# metrics
from sklearn.metrics import mean_squared_error, r2_score, accuracy_score
# Parameters Grid
from sklearn.model_selection import ParameterGrid

# -- save python object
import pickle

# -- my functions
import utils as ut
from perform_an import perform_cv,save_cv_results
from perform_an import ComputeSave_preverr
from perform_an import perform_lc,save_lc_results
from plot_FUNCs import plot_dectree

#computing_time: start
t_start = time.time()

# Create the Results directory
Time_res_dir=ut.create_res_fold('DecisionTree')

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir="Results_2023-11-06_01.55.00/"
# Time_data_dir="Results_2023-11-30_16.52.46_BERinh/"
# Time_data_dir="Results_2023-11-30_17.43.10_HRinh/"
# Time_data_dir="Results_2023-11-30_17.45.04_HRBERinh/"
[patient_param_MGMT_M,patient_param_MGMT_P,patient_survcurvAUC_MGMT_M,patient_survcurvAUC_MGMT_P]=ut.PKPDmodel_sim(Time_data_dir)

# feature names
feature_names_MGMT_M=['tED50','kp_ser46','kf_p53','sness','k_p53','k_ATR']
feature_names_MGMT_P=['k_HR','kp_ser46','tED50','kf_p53','sness','pT2','pT','k_p53','k_ATR','MGMT0','k_BER']

patientnumb=60000;
dataset_MGMT_M=patient_param_MGMT_M[feature_names_MGMT_M].iloc[0:patientnumb];#patient_param_MGMT_M.copy()
dataset_MGMT_P=patient_param_MGMT_P[feature_names_MGMT_P].iloc[0:patientnumb];#patient_param_MGMT_P.copy()
output_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_M.copy()
output_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_P.copy()

# Step 1: Data Splitting
X_train_MGMT_M, X_prev_MGMT_M, y_train_MGMT_M, y_prev_MGMT_M = train_test_split(dataset_MGMT_M, output_MGMT_M, test_size=0.2, random_state=42)
X_train_MGMT_P, X_prev_MGMT_P, y_train_MGMT_P, y_prev_MGMT_P = train_test_split(dataset_MGMT_P, output_MGMT_P, test_size=0.2, random_state=42)
t_data=ut.print_difftime(t_start,'Read and split Data')

# Step 2: Building Decision Tree Model
DT_MGMT_M = tree.DecisionTreeRegressor()
DT_MGMT_P = tree.DecisionTreeRegressor()

# Step 3: Cross-Validation for Hyperparameter Tuning
cv = KFold(n_splits=10, shuffle=True, random_state=42)
param_grid = {
    # 'splitter' : ["best", "random"],
    'max_depth' : [2,3,4,5,6,7,8],
    # 'max_features' : ["log2", "sqrt", None]
}
param_grid_list=list(ParameterGrid(param_grid))

perform_cv(X_train_MGMT_M,y_train_MGMT_M,DT_MGMT_M,param_grid,cv,Time_res_dir,'M')
save_cv_results(Time_res_dir,'M')
perform_cv(X_train_MGMT_P,y_train_MGMT_P,DT_MGMT_P,param_grid,cv,Time_res_dir,'P')
save_cv_results(Time_res_dir,'P')
t_cv=ut.print_difftime(t_data,'Cross Validation time')

# Step 4: Compute calibrated model error on the prevision data
ComputeSave_preverr(X_prev_MGMT_M,y_prev_MGMT_M,'M',Time_res_dir)
ComputeSave_preverr(X_prev_MGMT_P,y_prev_MGMT_P,'P',Time_res_dir)
t_preverr=ut.print_difftime(t_cv,'Previon Data Error time')

# Step 5: Decision tree visualization
plot_dectree(Time_res_dir,'M',feature_names_MGMT_M)
t_visDT_MGMT_M=ut.print_difftime(t_preverr,'DT visualitzation MGMT-')
plot_dectree(Time_res_dir,'P',feature_names_MGMT_P)
t_visDT_MGMT_P=ut.print_difftime(t_visDT_MGMT_M,'DT visualitzation MGMT+')

# Computing_time: end
ut.print_difftime(t_start,'Total time')
