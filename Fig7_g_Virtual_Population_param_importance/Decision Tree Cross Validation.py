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
Time_data_dir_TMZalone="Results_2024-03-29_15.30.14_TMZalone/"
Time_data_dir_BERinh="Results_2024-03-30_19.53.04_BERinh/"
Time_data_dir_HRinh="Results_2024-03-31_07.08.57_HRinh/"
Time_data_dir_HRBERinh="Results_2024-03-29_21.48.48_HRBERinh/"

patientnumb=80000; #number of patients for each tratment dataset
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_BERinh,Time_data_dir_TMZalone,patientnumb)
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_HRinh,Time_data_dir_TMZalone,patientnumb)
dataset_treat,output_relative,output_absolute,output_TMZalone,output_BERHRInh=ut.cv_datasetoutput(Time_data_dir_HRBERinh,Time_data_dir_TMZalone,patientnumb)

#Output definition
output=output_relative
# output=output_absolute

# feature names
feature_names=['K_add','kd_pATR','k_ATR','kf_ATR','k_apop','K_ATR','tED50','kf_p53','upAsy','sness','k_p53','MGMT0','kp_ser46','Cdc250','K_cdc25','k_addO']

dataset_treat=dataset_treat[feature_names].iloc[0:2*patientnumb]
# dataset_MGMT_P=patient_param_MGMT_P[feature_names_MGMT_P].iloc[0:patientnumb];#patient_param_MGMT_P.copy()
# output_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_M.copy()
# output_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_P.copy()

# Step 1: Data Splitting
X_train, X_prev, y_train, y_prev = train_test_split(dataset_treat, output, test_size=0.2, random_state=42)
t_data=ut.print_difftime(t_start,'Read and split Data')

# Step 2: Building Decision Tree Model
DT = tree.DecisionTreeRegressor(splitter="best",max_features=None,max_leaf_nodes=None)

# Step 3: Cross-Validation for Hyperparameter Tuning
cv = KFold(n_splits=10, shuffle=True, random_state=42)
param_grid = {
    # 'criterion' : ["squared_error", "friedman_mse", "absolute_error","poisson"], #Do not use: time comsuming and not score improvements
    # 'splitter' : ["best", "random"],
    'max_depth' : [15],
    # 'max_features' : ["sqrt", None],
    'max_leaf_nodes': [2, 10, None]
}
param_grid_list=list(ParameterGrid(param_grid))

perform_cv(X_train,y_train,DT,param_grid,cv,Time_res_dir)
save_cv_results(Time_res_dir)
t_cv=ut.print_difftime(t_data,'Cross Validation time')

# Step 4: Compute calibrated model error on the prevision data
ComputeSave_preverr(X_prev,y_prev,Time_res_dir)
t_preverr=ut.print_difftime(t_cv,'Previon Data Error time')

# Step 5: Decision tree visualization
plot_dectree(Time_res_dir,feature_names)
t_visDT=ut.print_difftime(t_preverr,'DT visualitzation')

# Computing_time: end
ut.print_difftime(t_start,'Total time')
