#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 23 16:33:26 2023

@author: sergiocorridore
"""

import pandas as pd
import numpy as np

import time
from sklearn.utils import shuffle



# Read the CSV file from PK-PD model simulations
def PKPDmodel_sim(Time_data_dir):
  Data_dir="Data/"+Time_data_dir
  patient_param_MGMT_M = pd.read_csv(Data_dir+"dataset_MGMT_M.csv")
  patient_param_MGMT_P = pd.read_csv(Data_dir+"dataset_MGMT_P.csv")

  patient_survcurvAUC_MGMT_M = pd.read_csv(Data_dir+"survcurv_AUC_vec_MGMT_M.csv")
  patient_survcurvAUC_MGMT_P = pd.read_csv(Data_dir+"survcurv_AUC_vec_MGMT_P.csv")
  
  return [patient_param_MGMT_M,patient_param_MGMT_P,patient_survcurvAUC_MGMT_M,patient_survcurvAUC_MGMT_P]

def cv_datasetoutput(Time_data_dir_treat,Time_data_dir_TMZalone,patientnumb):
    [treat_patient_param_MGMT_M,treat_patient_param_MGMT_P,treat_patient_cancpop_survcurvAUC_MGMT_M,treat_patient_cancpop_survcurvAUC_MGMT_P]=PKPDmodel_sim(Time_data_dir_treat)
    [TMZalone_patient_param_MGMT_M,TMZalone_patient_param_MGMT_P,TMZalone_patient_cancpop_survcurvAUC_MGMT_M,TMZalone_patient_cancpop_survcurvAUC_MGMT_P]=PKPDmodel_sim(Time_data_dir_TMZalone)
    
    dataset_MGMT_M=treat_patient_param_MGMT_M.iloc[0:patientnumb];#patient_param_MGMT_M.copy()
    dataset_MGMT_P=treat_patient_param_MGMT_P.iloc[0:patientnumb];#patient_param_MGMT_P.copy()
    dataset_treat=pd.concat([dataset_MGMT_M,dataset_MGMT_P], ignore_index=True)

    output_relative_MGMT_M=(TMZalone_patient_cancpop_survcurvAUC_MGMT_M.to_numpy()-treat_patient_cancpop_survcurvAUC_MGMT_M.to_numpy())/TMZalone_patient_cancpop_survcurvAUC_MGMT_M.to_numpy()
    output_relative_MGMT_M=output_relative_MGMT_M[0:patientnumb]
    output_relative_MGMT_P=(TMZalone_patient_cancpop_survcurvAUC_MGMT_P.to_numpy()-treat_patient_cancpop_survcurvAUC_MGMT_P.to_numpy())/TMZalone_patient_cancpop_survcurvAUC_MGMT_P.to_numpy()
    output_relative_MGMT_P=output_relative_MGMT_P[0:patientnumb]
    output_relative=np.concatenate([output_relative_MGMT_M,output_relative_MGMT_P])

    output_absolute_MGMT_M=(TMZalone_patient_cancpop_survcurvAUC_MGMT_M.to_numpy()-treat_patient_cancpop_survcurvAUC_MGMT_M.to_numpy())
    output_absolute_MGMT_M=output_absolute_MGMT_M[0:patientnumb]
    output_absolute_MGMT_P=(TMZalone_patient_cancpop_survcurvAUC_MGMT_P.to_numpy()-treat_patient_cancpop_survcurvAUC_MGMT_P.to_numpy())
    output_absolute_MGMT_P=output_absolute_MGMT_P[0:patientnumb]
    output_absolute=np.concatenate([output_absolute_MGMT_M,output_absolute_MGMT_P])
    
  
    output_TMZalone=np.concatenate([TMZalone_patient_cancpop_survcurvAUC_MGMT_M,TMZalone_patient_cancpop_survcurvAUC_MGMT_P])
    output_treat=np.concatenate([treat_patient_cancpop_survcurvAUC_MGMT_M,treat_patient_cancpop_survcurvAUC_MGMT_P])

    #Shuffle
    dataset_treat,output_relative,output_absolute,output_TMZalone,output_treat = shuffle(dataset_treat,output_relative,output_absolute,output_TMZalone,output_treat, random_state=42)
        
    return[dataset_treat,output_relative,output_absolute,output_TMZalone,output_treat ]


# Computing_time
def print_difftime(t_start,moment):
    t_now = time.time()
    computing_time = t_now - t_start
    print(moment,": ",computing_time, "sec.")
    return t_now

