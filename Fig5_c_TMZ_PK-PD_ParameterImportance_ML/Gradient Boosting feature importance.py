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
from sklearn.ensemble import GradientBoostingRegressor
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

t_start = time.time()

sim_name="GB_FeatImp_MDI_SH_TMZalone"
Time_res_dir=ut.create_res_fold(sim_name)

# Read the CSV file
Time_data_dir="Results_2024-03-21_21.17.24_TMZalone/"
# Time_data_dir=""
# Time_data_dir=""
# Time_data_dir=""

[patient_param_MGMT_M,patient_param_MGMT_P,patient_survcurvAUC_MGMT_M,patient_survcurvAUC_MGMT_P]=ut.PKPDmodel_sim(Time_data_dir)

# patientnumb_MDI=79998
# dataset_MDI_MGMT_M=patient_param_MGMT_M.iloc[0:patientnumb_MDI];#patient_param_MGMT_M.copy()
# dataset_MDI_MGMT_P=patient_param_MGMT_P.iloc[0:patientnumb_MDI];#patient_param_MGMT_P.copy()
# output_MDI_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb_MDI];#patient_survcurvAUC_MGMT_M.copy()
# output_MDI_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb_MDI];#patient_survcurvAUC_MGMT_P.copy()
patientnumb_SH=25000 
dataset_SH_MGMT_M=patient_param_MGMT_M.iloc[0:patientnumb_SH];#patient_param_MGMT_M.copy()
dataset_SH_MGMT_P=patient_param_MGMT_P.iloc[0:patientnumb_SH];#patient_param_MGMT_P.copy()
output_SH_MGMT_M=patient_survcurvAUC_MGMT_M.iloc[0:patientnumb_SH];#patient_survcurvAUC_MGMT_M.copy()
output_SH_MGMT_P=patient_survcurvAUC_MGMT_P.iloc[0:patientnumb_SH];#patient_survcurvAUC_MGMT_P.copy()

# Data Splitting
# X_train_MDI_MGMT_M, X_prev_MDI_MGMT_M, y_train_MDI_MGMT_M, y_prev_MDI_MGMT_M = train_test_split(dataset_MDI_MGMT_M, output_MDI_MGMT_M, test_size=0.2, random_state=42)
# X_train_MDI_MGMT_P, X_prev_MDI_MGMT_P, y_train_MDI_MGMT_P, y_prev_MDI_MGMT_P = train_test_split(dataset_MDI_MGMT_P, output_MDI_MGMT_P, test_size=0.2, random_state=42)
X_train_SH_MGMT_M, X_prev_SH_MGMT_M, y_train_SH_MGMT_M, y_prev_SH_MGMT_M = train_test_split(dataset_SH_MGMT_M, output_SH_MGMT_M, test_size=0.2, random_state=42)
X_train_SH_MGMT_P, X_prev_SH_MGMT_P, y_train_SH_MGMT_P, y_prev_SH_MGMT_P = train_test_split(dataset_SH_MGMT_P, output_SH_MGMT_P, test_size=0.2, random_state=42)

t_read_data=ut.print_difftime(t_start,'t_read_data')
# Shuffle the dataframe to avoid local behaviour in the data and allow a valid split betweein training data and test data
# #Same shuffle
# dataset_MGMT_M = dataset_MGMT_M.sample(frac=1).reset_index(drop=True)
# output_MGMT_M = output_MGMT_M.sample(frac=1).reset_index(drop=True)
# #Same shuffle
# dataset_MGMT_P = dataset_MGMT_P.sample(frac=1).reset_index(drop=True)
# output_MGMT_P = output_MGMT_P.sample(frac=1).reset_index(drop=True)

# DataNormalize y
# y = y / np.std(y)

 # choise of the model
# regressor_MDI_MGMT_M = GradientBoostingRegressor(loss='squared_error',n_estimators=300,max_features=None,max_depth=30)
# regressor_MDI_MGMT_P = GradientBoostingRegressor(loss='squared_error',n_estimators=500,max_features=None,max_depth=10)
regressor_SH_MGMT_M = GradientBoostingRegressor(loss='squared_error',n_estimators=300,max_features=None,max_depth=30)
regressor_SH_MGMT_P =GradientBoostingRegressor(loss='squared_error',n_estimators=500,max_features=None,max_depth=10)

feature_names=['pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','kf_Mdm2','K_p53','k_apop','upAsy','tED50','sness']

# fit the model
# regressor_MDI_MGMT_M.fit(X_train_MDI_MGMT_M, y_train_MDI_MGMT_M)
t_model_MDI_fits_MGMT_M=ut.print_difftime(t_read_data,'t_model_fits_MGMT_M')
# regressor_MDI_MGMT_P.fit(X_train_MDI_MGMT_P, y_train_MDI_MGMT_P)
t_model_MDI_fits_MGMT_P=ut.print_difftime(t_model_MDI_fits_MGMT_M,'t_model_fits_MGMT_P')

regressor_SH_MGMT_M.fit(X_train_SH_MGMT_M, y_train_SH_MGMT_M)
t_model_SH_fits_MGMT_M=ut.print_difftime(t_model_MDI_fits_MGMT_P,'t_model_fits_MGMT_M')
regressor_SH_MGMT_P.fit(X_train_SH_MGMT_P, y_train_SH_MGMT_P)
t_model_SH_fits_MGMT_P=ut.print_difftime(t_model_SH_fits_MGMT_M,'t_model_fits_MGMT_P')

# Feature importance based on mean decrease in impurity¶
# compute_feature_importances_MDI(regressor_MDI_MGMT_M,feature_names,'M',Time_res_dir)
t_FI_MDI_MGMT_M=ut.print_difftime(t_model_SH_fits_MGMT_P,'feature_importances_MDI MGMT M')
# compute_feature_importances_MDI(regressor_MDI_MGMT_P,feature_names,'P',Time_res_dir)
t_FI_MDI_MGMT_P=ut.print_difftime(t_FI_MDI_MGMT_M,'feature_importances_MDI MGMT P')

# Feature importance based on SHAP
compute_feature_importances_SHAP(regressor_SH_MGMT_M,X_train_SH_MGMT_M,X_prev_SH_MGMT_M,'M',Time_res_dir)
t_FI_SH_MGMT_M=ut.print_difftime(t_FI_MDI_MGMT_P,'feature_importances_SHAP MGMT M')
compute_feature_importances_SHAP(regressor_SH_MGMT_P,X_train_SH_MGMT_P,X_prev_SH_MGMT_P,'P',Time_res_dir)
t_FI_SH_MGMT_P=ut.print_difftime(t_FI_SH_MGMT_M,'feature_importances_SHAP MGMT P')


# Computing_time: end
ut.print_difftime(t_start,'Total time')







