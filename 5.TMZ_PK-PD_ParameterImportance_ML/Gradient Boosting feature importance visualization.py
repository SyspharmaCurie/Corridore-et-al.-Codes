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
from plot_FUNCs import plot_feature_importances_MDI,plot_feature_importances_SHAP,plot_feature_importances_SHAP_MGMT_sametreat,plot_feature_importances_SH_alltreat

t_start = time.time()

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir="Results_2024-03-21_21.17.24_TMZalone/"
# Time_data_dir="_BERinh/"
# Time_data_dir="_HRinh/"
# Time_data_dir="_HRBERinh/"
[patient_param_MGMT_M,patient_param_MGMT_P,patient_survcurvAUC_MGMT_M,patient_survcurvAUC_MGMT_P]=ut.PKPDmodel_sim(Time_data_dir)

patientnumb=79998;
dataset_MGMT_M=patient_param_MGMT_M.iloc[0:patientnumb];#patient_param_MGMT_M.copy()
dataset_MGMT_P=patient_param_MGMT_P.iloc[0:patientnumb];#patient_param_MGMT_P.copy()
output_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_M.copy()
output_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb];#patient_survcurvAUC_MGMT_P.copy()

# Step 1: Data Splitting
X_train_MGMT_M, X_prev_MGMT_M, y_train_MGMT_M, y_prev_MGMT_M = train_test_split(dataset_MGMT_M, output_MGMT_M, test_size=0.2, random_state=42)
X_train_MGMT_P, X_prev_MGMT_P, y_train_MGMT_P, y_prev_MGMT_P = train_test_split(dataset_MGMT_P, output_MGMT_P, test_size=0.2, random_state=42)

# Read the Feature importance Gradient Boosting files
Time_res_dir_TMZalone='Results_2024-02-15_17.12.46_GB_FeatImp_MDI_SH_TMZalone_Fin'
Time_res_dir_BERinh=''
Time_res_dir_HRinh=''
Time_res_dir_HRBERinh=''

# feature names
feature_names=['pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_MGMT','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','K_ATR','kp_ser46','kt_Mdm2','K_p53','k_apop','upAsy','tED50','sness']

# Feature importance based on mean decrease in impurity¶
# feature_importances_sorted_MGMT_M=ut.read_FI_results(Time_res_dir_TMZalone,'M','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_M,'M','TMZalone',Time_res_dir_TMZalone)
# feature_importances_sorted_MGMT_P=ut.read_FI_results(Time_res_dir_TMZalone,'P','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_P,'P','TMZalone',Time_res_dir_TMZalone)

# feature_importances_sorted_MGMT_M=ut.read_FI_results(Time_res_dir_BERinh,'M','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_M,'M','TMZ + BER inh.',Time_res_dir_BERinh)
# feature_importances_sorted_MGMT_P=ut.read_FI_results(Time_res_dir_BERinh,'P','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_P,'P','TMZ + BER inh.',Time_res_dir_BERinh)

# feature_importances_sorted_MGMT_M=ut.read_FI_results(Time_res_dir_HRinh,'M','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_M,'M','TMZ + HR inh.',Time_res_dir_HRinh)
# feature_importances_sorted_MGMT_P=ut.read_FI_results(Time_res_dir_HRinh,'P','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_P,'P','TMZ + HR inh.',Time_res_dir_HRinh)

# feature_importances_sorted_MGMT_M=ut.read_FI_results(Time_res_dir_HRBERinh,'M','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_M,'M','TMZ + HR & BERinh.',Time_res_dir_HRBERinh)
# feature_importances_sorted_MGMT_P=ut.read_FI_results(Time_res_dir_HRBERinh,'P','MDI')
# plot_feature_importances_MDI(feature_importances_sorted_MGMT_P,'P','TMZ + HR & BER inh.',Time_res_dir_HRBERinh)

# Feature importance based on SHAP
shap_values_TMZalone_MGMT_M=ut.read_FI_results(Time_res_dir_TMZalone,'M','SH')
# plot_feature_importances_SHAP(shap_values_TMZalone_MGMT_M,X_prev_MGMT_M,feature_names,'M',Time_res_dir_TMZalone)
# shap_values_BERinh_MGMT_M=ut.read_FI_results(Time_res_dir_BERinh,'M','SH')
# shap_values_HRinh_MGMT_M=ut.read_FI_results(Time_res_dir_HRinh,'M','SH')
# shap_values_HRBERinh_MGMT_M=ut.read_FI_results(Time_res_dir_HRBERinh,'M','SH')
# shap_values_alltreat_MGMT_M=[shap_values_TMZalone_MGMT_M, shap_values_BERinh_MGMT_M, shap_values_HRinh_MGMT_M, shap_values_HRBERinh_MGMT_M,]
# shap_values_treatNAMES_MGMT_M=['TMZ alone', 'TMZ + BER inh.', 'TMZ + HR inh.', 'TMZ + HR&BER inh.']
# plot_feature_importances_SH_alltreat(shap_values_alltreat_MGMT_M,feature_names,'M',shap_values_treatNAMES_MGMT_M)

shap_values_TMZalone_MGMT_P=ut.read_FI_results(Time_res_dir_TMZalone,'P','SH')
# plot_feature_importances_SHAP(shap_values_TMZalone_MGMT_P,X_prev_MGMT_P,feature_names,'P',Time_res_dir_TMZalone)
# shap_values_BERinh_MGMT_P=ut.read_FI_results(Time_res_dir_BERinh,'P','SH')
# shap_values_HRinh_MGMT_P=ut.read_FI_results(Time_res_dir_HRinh,'P','SH')
# shap_values_HRBERinh_MGMT_P=ut.read_FI_results(Time_res_dir_HRBERinh,'P','SH')
# shap_values_alltreat_MGMT_P=[shap_values_TMZalone_MGMT_P, shap_values_BERinh_MGMT_P, shap_values_HRinh_MGMT_P, shap_values_HRBERinh_MGMT_P,]
# shap_values_treatNAMES_MGMT_P=['TMZ alone', 'TMZ + BER inh.', 'TMZ + HR inh.', 'TMZ + HR&BER inh.']
# plot_feature_importances_SH_alltreat(shap_values_alltreat_MGMT_P,feature_names,'P',shap_values_treatNAMES_MGMT_P)

plot_feature_importances_SHAP_MGMT_sametreat([shap_values_TMZalone_MGMT_M, shap_values_TMZalone_MGMT_P],feature_names,Time_res_dir_TMZalone,'TMZ alone')
# Computing_time: end
ut.print_difftime(t_start,'Total time')







