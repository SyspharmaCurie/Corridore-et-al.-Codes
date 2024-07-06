#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 23 16:33:26 2023

@author: sergiocorridore
"""
import time
# -- save python object
import pickle

# Computing_time
def print_difftime(t_start,moment):
    t_now = time.time()
    computing_time = t_now - t_start
    print(moment,": ",computing_time, "sec.")
    return t_now


# Read feature importance results
def read_FI_results(Time_res_dir,MGMT,FI_type):

  reader = open('Results/'+Time_res_dir+'/FI_'+FI_type+'_MGMT_'+MGMT+'.pckl', 'rb')
  FI_res = pickle.load(reader)
  reader.close()

  return FI_res
  

