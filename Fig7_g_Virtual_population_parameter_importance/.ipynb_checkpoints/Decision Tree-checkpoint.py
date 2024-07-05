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
# feature_names=['pT','pT2','MGMT0','k_MGMT','k_MMR','k_BER','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','kp_ser46','kt_Mdm2','k_apop','tED50','sness']
feature_names=['tED50','kp_ser46','kf_p53','sness','k_p53','k_ATR','k_apop','kd_pATR','k_Chk1','k_DSBO','k_DSBN','k_BER','k_HR']
feature_names_MGMT_M=['tED50','kp_ser46','kf_p53','sness','k_p53','k_ATR']
# feature_names=['tED50','kp_ser46','kf_p53','sness']

patientnumb=60000;
dataset_MGMT_M=patient_param_MGMT_M[feature_names_MGMT_M].iloc[0:patientnumb];#patient_param_MGMT_M.copy()
dataset_MGMT_P=patient_param_MGMT_P[feature_names].iloc[0:patientnumb];#patient_param_MGMT_P.copy()
output_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_M.copy()
output_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_P.copy()

# Step 1: Data Splitting
X_train_MGMT_M, X_prev_MGMT_M, y_train_MGMT_M, y_prev_MGMT_M = train_test_split(dataset_MGMT_M, output_MGMT_M, test_size=0.2, random_state=42)
X_train_MGMT_P, X_prev_MGMT_P, y_train_MGMT_P, y_prev_MGMT_P = train_test_split(dataset_MGMT_P, output_MGMT_P, test_size=0.2, random_state=42)

# Step 2: Building Decision Tree Model
# Create Decision Tree classifer object
DC_MGMT_M = tree.DecisionTreeRegressor(max_depth=3)
DC_MGMT_P = tree.DecisionTreeRegressor()

# Train Decision Tree Classifer
DC_MGMT_M = DC_MGMT_M.fit(X_train_MGMT_M,y_train_MGMT_M)
DC_MGMT_P = DC_MGMT_P.fit(X_train_MGMT_P,y_train_MGMT_P)

#Predict the response for test dataset
y_pred_MGMT_M = DC_MGMT_M.predict(X_prev_MGMT_M)
y_pred_MGMT_P = DC_MGMT_P.predict(X_prev_MGMT_P)

# Step 3: Evaluating the Model
# Model Accuracy, how often is the classifier correct?
print("Accuracy MGMT M:",r2_score(y_prev_MGMT_M, y_pred_MGMT_M))
print("Accuracy MGMT P:",r2_score(y_prev_MGMT_P, y_pred_MGMT_P))

# Step 4: Decision tree visualization
# tree.plot_tree(DC_MGMT_M)
# plt.savefig(Time_res_dir+'/Figures/DecisionTree'+'M'+'.png', dpi=300)


dot_data = StringIO()
export_graphviz(DC_MGMT_M, out_file=dot_data,  
                filled=True, rounded=True,
                special_characters=True,feature_names = feature_names_MGMT_M,class_names=['0','1'])
graph = pydotplus.graph_from_dot_data(dot_data.getvalue())  
# graph.write_png('diabetes.png')
# Image(graph.create_png())
plt.savefig(Time_res_dir+'/Figures/DecisionTree'+'M'+'.png', dpi=300)

# # Step 2: Cross-Validation for Hyperparameter Tuning
# cv = KFold(n_splits=10, shuffle=True, random_state=42)
 
# param_grid = {
#     'max_depth': [10, 40, None]
# }
# param_grid_list=list(ParameterGrid(param_grid))

# DecTr = tree.DecisionTreeRegressor()

# perform_cv(X_train_MGMT_M,y_train_MGMT_M,DecTr,param_grid,cv,Time_res_dir,'M')
# save_cv_results(Time_res_dir,'M')
# perform_cv(X_train_MGMT_P,y_train_MGMT_P,DecTr,param_grid,cv,Time_res_dir,'P')
# save_cv_results(Time_res_dir,'P')
# t_cv=ut.print_difftime(t_start,'Cross Validation time')

# # Step 3: Compute calibrated model error on the prevision data
# ComputeSave_preverr(X_prev_MGMT_M,y_prev_MGMT_M,'M',Time_res_dir)
# ComputeSave_preverr(X_prev_MGMT_P,y_prev_MGMT_P,'P',Time_res_dir)
# t_preverr=ut.print_difftime(t_cv,'Previon Data Error time')

# Computing_time: end
ut.print_difftime(t_start,'Total time')
