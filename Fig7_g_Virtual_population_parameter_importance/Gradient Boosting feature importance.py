#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 19 16:38:49 2023

@author: sergiocorridore

The goal of this code is to study importance of model parameters to predict difference in AUC.
This will be use as signature of response to 3-drug combination.
"""

import time
# -- machine-learning
# tunning
from sklearn.model_selection import train_test_split
# models
from sklearn.ensemble import GradientBoostingRegressor
# -- Other functions
import Funcs.utils as ut
from Funcs.perform_an import compute_feature_importances_SHAP
from Funcs.plot_FUNCs import plot_feature_importances_SHAP

t_start = time.time()

sim_name="GB_FeatImp_MDI_SH_BERInh_Abs_allpat"

# Step 0: Read the CSV file from PK-PD model simulations
Time_data_dir_TMZalone="TMZalone_VP/"
Time_data_dir_HRBERinh="HRBERinh_VP/"

patientnumb=80000 #number of patients for each tratment dataset
dataset_treat,output_relative,output_absolute,output_TMZalone,output_treat=ut.cv_datasetoutput(Time_data_dir_HRBERinh,Time_data_dir_TMZalone,patientnumb)

patientnumb_SH=70000 
dataset_treat=dataset_treat.iloc[0:patientnumb_SH]
output_relative=output_relative[0:patientnumb_SH]
output_absolute=output_absolute[0:patientnumb_SH]


#Output definition 
# output=output_relative
output=output_absolute

# Data Splitting
X_train, X_prev, y_train, y_prev = train_test_split(dataset_treat, output, test_size=0.2, random_state=42)
t_read_data=ut.print_difftime(t_start,'t_read_data')

# choise of the model
regressor = GradientBoostingRegressor(loss='squared_error',n_estimators=500,max_features=None,max_depth=12)

feature_names=['pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_MGMT','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','K_ATR','kp_ser46','kf_Mdm2','K_p53','k_apop','upAsy','tED50','sness']

# fit the model
regressor.fit(X_train, y_train)
t_model_fits=ut.print_difftime(t_read_data,'t_model_fits')

# Feature importance based on SHAP
shap_values_HRBERinh=compute_feature_importances_SHAP(regressor,X_train,X_prev)
plot_feature_importances_SHAP(shap_values_HRBERinh,feature_names)
t_FI_SH=ut.print_difftime(t_model_fits,'feature_importances_SHAP')

# Computing_time: end
ut.print_difftime(t_start,'Total time')







