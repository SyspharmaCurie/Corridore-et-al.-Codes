import pandas as pd
import numpy as np

# -- machine-learning
from sklearn import set_config
# models
from sklearn.ensemble import RandomForestRegressor
# cross-val 
from sklearn.model_selection import cross_val_score, cross_validate
# tunning
from sklearn.model_selection import train_test_split, GridSearchCV, KFold
# metrics
from sklearn.metrics import mean_squared_error, r2_score
# learning curve.
from sklearn.model_selection import LearningCurveDisplay, learning_curve
# -- save python object
import pickle
# -- visualisation
import matplotlib.pyplot as plt
# -- feature importance
from sklearn.inspection import permutation_importance
import shap

# -- my functions
import utils as ut


def perform_cv(X_train,y_train,regressor,param_grid,cv,Time_res_dir,MGMT):
    scoring = {"NMSE": "neg_mean_squared_error", "r2": "r2"}

    grid_search = GridSearchCV(estimator=regressor, param_grid=param_grid, cv=cv, scoring=scoring, refit="r2", return_train_score=True, n_jobs=-1 )
    grid_search.fit(X_train, y_train)
    best_est = grid_search.best_estimator_
    best_est.fit(X_train, y_train)

    best_model = {"grid_search":grid_search,
                        "best_est":best_est}
    
    # Saving the objects:
    f = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'wb')
    pickle.dump(best_model, f)
    f.close()


def save_cv_results(Time_res_dir,MGMT):

  reader = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'rb')
  best_model = pickle.load(reader)
  reader.close()
  grid_search=best_model["grid_search"]

  best_params=grid_search.best_params_
  non_nested_score = grid_search.best_score_
  cvres=grid_search.cv_results_
  param_comb_size=cvres["mean_test_NMSE"].size

  list_scoreMSEr2_params=[None] * param_comb_size

  for n,mean_test_NMSE, mean_test_r2,params in zip(range(0,param_comb_size),cvres["mean_test_NMSE"],cvres["mean_test_r2"],cvres["params"]):
      list_scoreMSEr2_params[n] = {'MSE': -mean_test_NMSE, 'r2': mean_test_r2, 'params': params}


  list_scoreMSEr2_params.sort(key=ut.get_r2,reverse=True)
  
  with open(Time_res_dir+'/Resultat_MGMT_'+MGMT+'.txt', 'a') as f:
        f.write("\n\nCross Validation Results: MGMT_"+MGMT+"\n")
        for n in range(0,param_comb_size):
            f.write(str(n)+") "+str(list_scoreMSEr2_params[n]['MSE'])+", "+str(list_scoreMSEr2_params[n]['r2'])+", "+str(list_scoreMSEr2_params[n]['params'])+"\n")
        f.write("best_params: "+ str(best_params))
        f.write("\nNon-Nested score: "+ str(non_nested_score))
        f.close()


def ComputeSave_preverr(X_prev,y_prev,MGMT,Time_res_dir):

    reader = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'rb')
    best_model = pickle.load(reader)
    reader.close()
    regressor=best_model["best_est"]

    y_prev_comp=regressor.predict(X_prev)
    MSE_err=mean_squared_error(y_prev,y_prev_comp)
    r2_err=r2_score(y_prev,y_prev_comp)

    with open(Time_res_dir+'/Resultat_MGMT_'+MGMT+'.txt', 'a') as f:
        f.write("\n\nError on the prevision: MGMT_"+MGMT+"\n")
        f.write("MSE_prev_err: "+str(MSE_err)+"\n")
        f.write("r2_prev_err_: "+str(r2_err))
        f.close()

def perform_lc(X,y,Time_res_dir,MGMT):

    reader = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'rb')
    best_model = pickle.load(reader)
    reader.close()
    regressor=best_model["best_est"]
    
    train_sizes_r2, train_scores_r2, test_scores_r2 = learning_curve(regressor, X, y,scoring='r2')

    best_model = {"regressor":regressor,
                        "train_sizes_r2":train_sizes_r2,
                        "train_scores_r2":train_scores_r2,
                        "test_scores_r2":test_scores_r2}
    # Saving the objects:
    f = open(Time_res_dir+'/best_model_lc_MGMT_'+MGMT+'.pckl', 'wb')
    pickle.dump(best_model, f)
    f.close()

def save_lc_results(Time_res_dir,MGMT):

  reader = open(Time_res_dir+'/best_model_lc_MGMT_'+MGMT+'.pckl', 'rb')
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
  plt.savefig(Time_res_dir+'/Figures/LC_r2_'+MGMT+'.png', dpi=300)
  #plt.show()

  with open(Time_res_dir+'/Resultat_MGMT_'+MGMT+'.txt', 'a') as f:
        f.write("\n\nReusult Learning Curve MGMT_"+MGMT+"\n")
        f.write("last_train_score_r2: " + str(last_train_score_r2))
        f.write("\nlast_test_score_r2: " + str(last_test_score_r2))
        f.write("\nLearning_curve_score_r2: " + str(learning_curve_score_r2))
        f.close()

def compute_feature_importances_MDI(regressor,feature_names,MGMT,Time_res_dir):
    # Feature importance based on mean decrease in impurity¶
    importances = regressor.feature_importances_
    # std = np.std([tree.feature_importances_ for tree in regressor.estimators_], axis=0)

    reg_importances = pd.Series(importances, index=feature_names)
    reg_importances_sorted=reg_importances.sort_values(ascending=True)

    f = open(Time_res_dir+'/FI_MDI_MGMT_'+MGMT+'.pckl', 'wb')
    pickle.dump(reg_importances_sorted, f)
    f.close()


def compute_feature_importances_SHAP(regressor,X_train,X_test,MGMT,Time_res_dir):
     # Step 5: SHAP for Variable Importance
     explainer = shap.Explainer(regressor, X_train)
     shap_values = explainer.shap_values(X_test)
     print(shap_values)
     f = open(Time_res_dir+'/FI_SH_MGMT_'+MGMT+'.pckl', 'wb')
     pickle.dump(shap_values, f)
     f.close()










