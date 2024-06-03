#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 23 16:33:26 2023

@author: sergiocorridore
"""

import pandas as pd
import numpy as np

import time
from datetime import datetime
# -- create new folder 
import os
# Importing the statistics module
import statistics
# -- machine-learning
from sklearn import set_config
from sklearn.metrics import mean_squared_error
# learning curve.
from sklearn.model_selection import LearningCurveDisplay, learning_curve
# models
from sklearn.ensemble import RandomForestRegressor
# -- visualisation
import matplotlib.pyplot as plt
# -- save python object
import pickle
# utils
from sklearn.utils import shuffle

# Create the Results folder
def create_res_fold(sim_name):
  now = datetime.now()
  date_time_str = now.strftime("%Y-%m-%d_%H.%M.%S")
  Time_res_dir = "Results/Results_"+date_time_str+"_"+sim_name
  Fig_res_dir = "Figures"
  res_path = os.path.join(Time_res_dir,Fig_res_dir)
  try: 
      os.makedirs(res_path, exist_ok = True) 
      print("Result Directory '%s' created successfully" % Time_res_dir) 
  except OSError as error: 
      print("Result Directory '%s' can not be created" % Time_res_dir)
  return Time_res_dir

# Read the CSV file from PK-PD model simulations
def PKPDmodel_sim(Time_data_dir):
  Data_dir="../9.Virtual_Population_generation/Results/"+Time_data_dir
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

# sorting key function
def get_MSE(elem):
    return elem.get('MSE')

def get_r2(elem):
    return elem.get('r2')

def get_second(elem):
    return elem[1]

# Computing_time
def print_difftime(t_start,moment):
    t_now = time.time()
    computing_time = t_now - t_start
    print(moment,": ",computing_time, "sec.")
    return t_now

# Read cross validation and learning curve results
def read_cv_lc_results(Time_res_dir,MGMT):

  print("\n\nReusult MGMT_"+MGMT)

  reader = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'rb')
  best_model = pickle.load(reader)
  reader.close()
  grid_search=best_model["grid_search"]

  # best_rf = grid_search.best_estimator_
  best_params=grid_search.best_params_
  non_nested_score = grid_search.best_score_

  cvres=grid_search.cv_results_

  param_comb_size=cvres["mean_test_NMSE"].size

  list_scoreMSEr2_params=[None] * param_comb_size

  for n,mean_test_NMSE, mean_test_r2,params in zip(range(0,param_comb_size),cvres["mean_test_NMSE"],cvres["mean_test_r2"],cvres["params"]):
      list_scoreMSEr2_params[n] = {'MSE': -mean_test_NMSE, 'r2': mean_test_r2, 'params': params}


  list_scoreMSEr2_params.sort(key=get_r2)
  for n in range(0,param_comb_size):
      print(n,list_scoreMSEr2_params[n]['MSE'],list_scoreMSEr2_params[n]['r2'],list_scoreMSEr2_params[n]['params'])

  train_sizes_NMSE=best_model["train_sizes_NMSE"]
  train_scores_NMSE=best_model["train_scores_NMSE"]
  test_scores_NMSE=best_model["test_scores_NMSE"]
  train_sizes_r2=best_model["train_sizes_r2"]
  train_scores_r2=best_model["train_scores_r2"]
  test_scores_r2=best_model["test_scores_r2"]

  last_train_score_NMSE=np.mean(train_scores_NMSE[-1])
  last_test_score_NMSE=np.mean(test_scores_NMSE[-1])
  learning_curve_score_NMSE=np.abs(last_train_score_NMSE-last_test_score_NMSE)
  last_train_score_r2=np.mean(train_scores_r2[-1])
  last_test_score_r2=np.mean(test_scores_r2[-1])
  learning_curve_score_r2=np.abs(last_train_score_r2-last_test_score_r2)

  display_NMSE = LearningCurveDisplay(train_sizes=train_sizes_NMSE,train_scores=train_scores_NMSE, test_scores=test_scores_NMSE, score_name="NMSE")
  display_NMSE.plot()
  plt.savefig(Time_res_dir+'/Figures/LC_NMSE_'+MGMT+'.png', dpi=300)
  #plt.show()
  display_r2 = LearningCurveDisplay(train_sizes=train_sizes_r2,train_scores=train_scores_r2, test_scores=test_scores_r2, score_name="r2")
  display_r2.plot()
  plt.savefig(Time_res_dir+'/Figures/LC_r2_'+MGMT+'.png', dpi=300)

  print('best_params:', best_params)
  print('Non-Nested score:', non_nested_score)


  print('last_train_score_NMSE:',last_train_score_NMSE)
  print('last_train_score_r2:',last_train_score_r2)
  print('last_test_score_NMSE:',last_test_score_NMSE)
  print('last_test_score_r2:',last_test_score_r2)

  print('Learning_curve_score_NMSE:', learning_curve_score_NMSE)
  print('Learning_curve_score_r2:', learning_curve_score_r2)


# Read learning curve results
def read_lc_results(Time_res_dir,MGMT):

  print("\n\nReusult Learning Curve MGMT_"+MGMT)

  reader = open('Results/'+Time_res_dir+'/best_model_lc_MGMT_'+MGMT+'.pckl', 'rb')
  best_model_lc = pickle.load(reader)
  reader.close()

  train_sizes_r2=best_model_lc["train_sizes_r2"]
  train_scores_r2=best_model_lc["train_scores_r2"]
  test_scores_r2=best_model_lc["test_scores_r2"]
  
  last_train_score_r2=np.mean(train_scores_r2[-1])
  last_test_score_r2=np.mean(test_scores_r2[-1])
  learning_curve_score_r2=np.abs(last_train_score_r2-last_test_score_r2)

  display_r2 = LearningCurveDisplay(train_sizes=train_sizes_r2,train_scores=train_scores_r2, test_scores=test_scores_r2, score_name="r2")
  display_r2.plot()
  plt.savefig('Results/'+Time_res_dir+'/Figures/LC_r2_'+MGMT+'.png', dpi=300)
  #plt.show()

  print('last_train_score_r2:',last_train_score_r2)
  print('last_test_score_r2:',last_test_score_r2)
  print('Learning_curve_score_r2:', learning_curve_score_r2)


# Read feature importance results
def read_FI_results(Time_res_dir,FI_type):

  reader = open('Results/'+Time_res_dir+'/FI_'+FI_type+'.pckl', 'rb')
  FI_res = pickle.load(reader)
  reader.close()

  return FI_res
  

