#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 19 16:38:49 2023

@author: sergiocorridore
"""
import pandas as pd
import numpy as np

import time
# -- machine-learning
from sklearn import set_config
# tunning
from sklearn.model_selection import train_test_split
# models
from sklearn.ensemble import RandomForestRegressor
# cross-val 
from sklearn.model_selection import cross_val_score, cross_validate
# learning curve.
from sklearn.model_selection import LearningCurveDisplay, learning_curve
# visualisation
import matplotlib.pyplot as plt
# feature importance
from sklearn.inspection import permutation_importance
# -- my functions
import utils as ut
from perform_an import compute_feature_importances_MDI,compute_feature_importances_SHAP
from plot_FUNCs import plot_feature_importances_MDI,plot_feature_importances_SHAP,plot_feature_importances_SH_alltreat

t_start = time.time()

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir_TMZalone="Results_2024-03-29_15.30.14_TMZalone/"
Time_data_dir_BERinh="Results_2024-03-30_19.53.04_BERinh/"
Time_data_dir_HRinh="Results_2024-03-31_07.08.57_HRinh/"
Time_data_dir_HRBERinh="Results_2024-03-29_21.48.48_HRBERinh/"

patientnumb=80000 #number of patients for each tratment dataset
dataset_treat,output_relative,output_absolute,output_TMZalone,output_treat=ut.cv_datasetoutput(Time_data_dir_HRBERinh,Time_data_dir_TMZalone,patientnumb)

patientnumb_SH=70000 #30000
dataset_treat=dataset_treat.iloc[0:patientnumb_SH]
output_relative=output_relative[0:patientnumb_SH]
output_absolute=output_absolute[0:patientnumb_SH]

#Output definition 
# output=output_relative
output=output_absolute

# Step 1: Data Splitting
X_train, X_prev, y_train, y_prev = train_test_split(dataset_treat, output, test_size=0.2, random_state=42)

# Read the Feature importance Gradient Boosting files
# Time_res_dir_BERinh=''
# Time_res_dir_HRinh=''
# Time_res_dir_HRBERinh='Results_2024-04-03_14.56.29_GB_FeatImp_MDI_SH_BERInh_Rel_allpat'

Time_abs_dir_BERinh=''
Time_abs_dir_HRinh=''
Time_abs_dir_HRBERinh='Results_2024-04-05_15.29.56_GB_FeatImp_MDI_SH_BERInh_Abs_allpat'

# feature names
feature_names=['pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_MGMT','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','K_ATR','kp_ser46','kf_Mdm2','K_p53','k_apop','upAsy','tED50','sness']

# Feature importance based on mean decrease in impurity¶
# feature_importances_sorted_MDI=ut.read_FI_results(Time_res_dir_BERinh,'MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MDI,'TMZ + BER inh.',Time_res_dir_BERinh)

# feature_importances_sorted_MDI=ut.read_FI_results(Time_res_dir_HRinh,'MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MDI,'TMZ + HR inh.',Time_res_dir_HRinh)

feature_importances_sorted_MDI=ut.read_FI_results(Time_abs_dir_HRBERinh,'MDI')
plot_feature_importances_MDI(feature_importances_sorted_MDI,'TMZ + HR & BER inh.',Time_abs_dir_HRBERinh)

# Feature importance based on SHAP
# shap_values_BERinh=ut.read_FI_results(Time_res_dir_BERinh,'SH')
# plot_feature_importances_SHAP(shap_values_BERinh,X_prev_SH,feature_names,'TMZ + BER inh.',Time_res_dir_BERinh)
# shap_values_HRinh=ut.read_FI_results(Time_res_dir_HRinh,'SH')
# plot_feature_importances_SHAP(shap_values_HRinh,X_prev_SH,feature_names,'TMZ + HR inh.',Time_res_dir_HRinh)
shap_values_HRBERinh=ut.read_FI_results(Time_abs_dir_HRBERinh,'SH')
plot_feature_importances_SHAP(shap_values_HRBERinh,X_prev,feature_names,'TMZ + HR & BER inh.' ,Time_abs_dir_HRBERinh)

# shap_values_alltreat=[shap_values_BERinh, shap_values_HRinh, shap_values_HRBERinh]
# shap_values_treatNAMES=['TMZ + BER inh.', 'TMZ + HR inh.', 'TMZ + HR&BER inh.']
# plot_feature_importances_SH_alltreat(shap_values_alltreat,feature_names,shap_values_treatNAMES)

# Computing_time: end
ut.print_difftime(t_start,'Total time')







