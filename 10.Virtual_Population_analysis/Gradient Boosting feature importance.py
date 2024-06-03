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
# metrics
from sklearn.metrics import mean_squared_error, r2_score, accuracy_score
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

sim_name="GB_FeatImp_MDI_SH_BERInh_Abs_allpat"
Time_res_dir=ut.create_res_fold(sim_name)

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

# Data Splitting
X_train, X_prev, y_train, y_prev = train_test_split(dataset_treat, output, test_size=0.2, random_state=42)
t_read_data=ut.print_difftime(t_start,'t_read_data')

# choise of the model
regressor = GradientBoostingRegressor(loss='squared_error',n_estimators=500,max_features=None,max_depth=12)

feature_names=['pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_MGMT','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','K_ATR','kp_ser46','kf_Mdm2','K_p53','k_apop','upAsy','tED50','sness']


# fit the model
regressor.fit(X_train, y_train)
t_model_fits=ut.print_difftime(t_read_data,'t_model_fits')

# Compute calibrated model error on the prevision data
y_prev_comp=regressor.predict(X_prev)
MSE_err=mean_squared_error(y_prev,y_prev_comp)
r2_err=r2_score(y_prev,y_prev_comp)
with open(Time_res_dir+'/Resultat.txt', 'a') as f:
    f.write("\n\nError on the prevision\n")
    f.write("MSE_prev_err: "+str(MSE_err)+"\n")
    f.write("r2_prev_err_: "+str(r2_err))
    f.close()
t_preverr=ut.print_difftime(t_model_fits,'Previon Data Error time')

# Feature importance based on mean decrease in impurity¶
compute_feature_importances_MDI(regressor,feature_names,Time_res_dir)
t_FI_MDI=ut.print_difftime(t_model_fits,'feature_importances_MDI')

# Feature importance based on SHAP
compute_feature_importances_SHAP(regressor,X_train,X_prev,Time_res_dir)
t_FI_SH=ut.print_difftime(t_FI_MDI,'feature_importances_SHAP')


# Computing_time: end
ut.print_difftime(t_start,'Total time')







