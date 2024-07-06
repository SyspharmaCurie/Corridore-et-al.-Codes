#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 19 16:38:49 2023

@author: sergiocorridore
"""
import time
# -- Other functions
import Funcs.utils as ut
from Funcs.plot_FUNCs import plot_feature_importances_SHAP_MGMT_sametreat

t_start = time.time()


# Read the Feature importance Gradient Boosting files
Time_res_dir_TMZalone='Results_FeatImp_SH_TMZalone'

# feature names
feature_names=['pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_MGMT','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kd_pATR','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','K_ATR','kp_ser46','kt_Mdm2','K_p53','k_apop','upAsy','tED50','sness']


# Feature importance based on SHAP
shap_values_TMZalone_MGMT_M=ut.read_FI_results(Time_res_dir_TMZalone,'M','SH')

shap_values_TMZalone_MGMT_P=ut.read_FI_results(Time_res_dir_TMZalone,'P','SH')

plot_feature_importances_SHAP_MGMT_sametreat([shap_values_TMZalone_MGMT_M, shap_values_TMZalone_MGMT_P],feature_names)
# Computing_time: end
ut.print_difftime(t_start,'Total time')







