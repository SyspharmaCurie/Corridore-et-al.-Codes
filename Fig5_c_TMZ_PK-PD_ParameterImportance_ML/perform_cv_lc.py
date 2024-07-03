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

def perform_cv_lc(X_train,Y_train,param_grid,cv,Time_res_dir,MGMT):
    rf = RandomForestRegressor()
    scoring = {"NMSE": "neg_mean_squared_error", "r2": "r2"}

   
    grid_search = GridSearchCV(estimator=rf, param_grid=param_grid, cv=cv, scoring=scoring, refit="NMSE", return_train_score=True, n_jobs=-1 )
    grid_search.fit(X_train, Y_train)
    best_rf = grid_search.best_estimator_
    best_rf.fit(X_train, Y_train)
    train_sizes_NMSE, train_scores_NMSE, test_scores_NMSE = learning_curve(best_rf, X_train, Y_train,scoring='neg_mean_squared_error')
    train_sizes_r2, train_scores_r2, test_scores_r2 = learning_curve(best_rf, X_train, Y_train,scoring='r2')

    best_model = {"grid_search":grid_search,
                        "best_rf":best_rf,
                        "train_sizes_NMSE":train_sizes_NMSE,
                        "train_scores_NMSE":train_scores_NMSE,
                        "test_scores_NMSE":test_scores_NMSE,
                        "train_sizes_r2":train_sizes_r2,
                        "train_scores_r2":train_scores_r2,
                        "test_scores_r2":test_scores_r2}
    # Saving the objects:
    f = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'wb')
    pickle.dump(best_model, f)
    f.close()
    return best_rf