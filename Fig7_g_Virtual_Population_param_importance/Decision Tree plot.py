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

Time_data_dir_TMZalone="Results_2024-03-07_18.50.58_TMZalone/"
Time_data_dir_BERinh="Results_2024-03-15_21.25.25_BERInh/"
Time_data_dir_HRinh="Results_2024-03-16_11.32.00_HRInh/"
Time_data_dir_HRBERinh="Results_2024-03-08_00.28.09_HRBERinh/"

patientnumb=79998; #number of patients for each tratment dataset
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_BERinh,Time_data_dir_TMZalone,patientnumb)
# dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_HRinh,Time_data_dir_TMZalone,patientnumb)
dataset_treat,output_relative,output_absolute=ut.cv_datasetoutput(Time_data_dir_HRBERinh,Time_data_dir_TMZalone,patientnumb)

#Output definition
output=output_relative
# output=output_absolute

# # feature names
feature_names=['k_MMR','Cdc250','tED50','upAsy','sness','MGMT0','k_HR','k_BER','k_p53','kf_Mdm2','k_apop','k_ATR','kf_Chk1','K_add','k_CyA','k_DSBO']

dataset_treat=dataset_treat[feature_names].iloc[0:2*patientnumb]
# dataset_MGMT_P=patient_param_MGMT_P[feature_names_MGMT_P].iloc[0:patientnumb];#patient_param_MGMT_P.copy()
# output_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_M.copy()
# output_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_P.copy()

# Step 1: Data Splitting
X_train, X_prev, y_train, y_prev = train_test_split(dataset_treat, output, test_size=0.2, random_state=42)
t_data=ut.print_difftime(t_start,'Read and split Data')

# Step 2: Building Decision Tree Model
DT = tree.DecisionTreeRegressor(max_depth=10, max_features= None, max_leaf_nodes= None, splitter= 'best')


# Step 3: Decision Tree Model fit
DT.fit(X_train,y_train)
t_fit=ut.print_difftime(t_data,'Decision tree fit')

# Step 4: Compute calibrated model error on the prevision data
y_prev_comp=DT.predict(X_prev)
MSE_err=mean_squared_error(y_prev,y_prev_comp)
r2_err=r2_score(y_prev,y_prev_comp)
print("\n\nError on the prevision\n")
print("MSE_prev_err: "+str(MSE_err)+"\n")
print("r2_prev_err_: "+str(r2_err))
t_preverr=ut.print_difftime(t_fit,'Previon Data Error time')

# Step 5: Decision tree visualization
plt.figure(figsize = (50,3))
tree.plot_tree(DT, feature_names = feature_names,
               class_names = ['AUC'], filled = True)
plt.savefig(Time_res_dir+'/Figures/DecisionTree.png',dpi=600)
plt.savefig(Time_res_dir+'/Figures/DecisionTree.svg',dpi=600)
t_visDT=ut.print_difftime(t_preverr,'DT visualitzation')

# Computing_time: end
ut.print_difftime(t_start,'Total time')
