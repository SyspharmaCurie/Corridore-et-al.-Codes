import pandas as pd
import numpy as np

# -- visualisation
import matplotlib.pyplot as plt
# -- feature importance
from sklearn.inspection import permutation_importance
import shap

# -- machine-learning
from sklearn import tree

# -- save python object
import pickle
# -- my functions
import utils as ut


def plot_feature_importances_MDI(forest_importances_sorted,MGMT,treatNAME,Time_res_dir):
    if MGMT=='M': #same colors than MATLAB simulations
        color_plot=[0, 0.447058823529412, 0.698039215686274]
    else:
        color_plot=[0.933333333333333,   0.400000000000000,   0.466666666666667]

    fig, ax = plt.subplots()
    forest_importances_sorted.plot.barh(ax=ax,color=color_plot)
    ax.set_title("Feature importances using MDI (MGMT_"+MGMT+"),"+treatNAME)
    ax.set_ylabel("Mean decrease in impurity")
    fig.tight_layout()
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_MDI_'+MGMT+'.png', dpi=300)
    # plt.show()


def plot_feature_importances_SHAP(shap_values,X_test,feature_names,MGMT,Time_res_dir):
    
    if MGMT=='M': #same colors than MATLAB simulations
        color_plot=[0, 0.447058823529412, 0.698039215686274]
    else:
        color_plot=[0.933333333333333,   0.400000000000000,   0.466666666666667]

    shap.summary_plot(shap_values, X_test, feature_names=feature_names, plot_type='bar',show=False,color=color_plot)
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_SH_'+MGMT+'.png', dpi=300)

def plot_feature_importances_SHAP_MGMT_sametreat(shap_values_bothtreat,feature_names,Time_res_dir,treatNAMES):
    
    font_size=15
     #same colors than MATLAB simulations
    color_plot_MGMT_M=[0, 0.447058823529412, 0.698039215686274]
    color_plot_MGMT_P=[0.933333333333333,   0.400000000000000,   0.466666666666667]
    color_plot_both=[color_plot_MGMT_M, color_plot_MGMT_P]
    cell_lines_title=['MGMT-','MGMT+']
    fig , axs = plt.subplots(ncols=2,figsize=(13,10))

    feature_numb=len(feature_names)
    shap_values_MGMT_M=np.array(shap_values_bothtreat[0])
    global_shap_values_MGMT_M=np.abs(shap_values_MGMT_M).mean(0)
    feature_order = np.argsort(global_shap_values_MGMT_M)
    max_display=feature_numb
    feature_inds = feature_order[feature_numb-max_display:feature_numb]#Since the shapes values are sorted from the smaller to the bigger
    y_pos = np.arange(len(feature_inds))
    for n, shap_values in zip(range(len(shap_values_bothtreat)), shap_values_bothtreat):
        shap_values_arr=np.array(shap_values)
        global_shap_values=np.abs(shap_values_arr).mean(0)
        axs[n].barh(y_pos, global_shap_values[feature_inds], 0.6, align='center',color=color_plot_both[n])
        axs[n].spines['top'].set_visible(False)
        axs[n].spines['right'].set_visible(False)
        axs[n].set_title(cell_lines_title[n])
        plt.sca(axs[n])
        plt.yticks(y_pos, fontsize=font_size)
        plt.xticks(fontsize=font_size)
        plt.gca().set_yticklabels([feature_names[i] for i in feature_inds])

    for ax in axs.flat:
        # ax.set(xlabel='Shap Value', ylabel='Parameters', fontsize=font_size)
        ax.set_xlabel(xlabel='Shap Value', fontsize=font_size)
        ax.set_ylabel( ylabel='Parameters', fontsize=font_size)
    # Hide x labels and tick labels
    for ax in axs.flat:
        ax.label_outer()

    fig.tight_layout()
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_SH_'+treatNAMES+'.png', dpi=300)
    # plt.show()

def plot_feature_importances_SH_alltreat(shap_values_alltreat,feature_names,MGMT,treatNAMES):
    # Feature importance based on mean decrease in impurity¶
    print("\n\nResultFeature importance MGMT_"+MGMT)
    font_size=15
    if MGMT=='M':
        color_plot=[0, 0.447058823529412, 0.698039215686274]
    else:
        color_plot=[0.933333333333333,   0.400000000000000,   0.466666666666667]

    fig , axs = plt.subplots(ncols=4,figsize=(10,8))
    fig.suptitle('MGMT '+MGMT)
    feature_numb=len(feature_names)
    feature_order = np.argsort(np.sum(np.abs(shap_values_alltreat[0]), axis=0))
    max_display=10
    feature_inds = feature_order[feature_numb-max_display:feature_numb]#Since the shapes values are sorted from the smaller to the bigger
    y_pos = np.arange(len(feature_inds))
    for n, shap_values in zip(range(len(shap_values_alltreat)), shap_values_alltreat):
        shap_values_arr=np.array(shap_values)
        global_shap_values=np.abs(shap_values_arr).mean(0)
        axs[n].barh(y_pos, global_shap_values[feature_inds], 0.6, align='center',color=color_plot)
        axs[n].spines['top'].set_visible(False)
        axs[n].spines['right'].set_visible(False)
        axs[n].set_title(treatNAMES[n])
        plt.sca(axs[n])
        plt.yticks(y_pos, fontsize=font_size)
        plt.xticks(fontsize=font_size)
        plt.gca().set_yticklabels([feature_names[i] for i in feature_inds])

    for ax in axs.flat:
        # ax.set(xlabel='Shap Value', ylabel='Parameters', fontsize=font_size)
        ax.set_xlabel(xlabel='Shap Value', fontsize=font_size)
        ax.set_ylabel( ylabel='Parameters', fontsize=font_size)
    # Hide x labels and tick labels
    for ax in axs.flat:
        ax.label_outer()

    fig.tight_layout()
    plt.savefig('Results/All treament SHAP figures/FI_SH_alltreat_'+MGMT+'.png', dpi=300)
    # plt.show()

def plot_dectree(Time_res_dir,MGMT,feature_names):

    reader = open(Time_res_dir+'/best_model_NOnested_MGMT_'+MGMT+'.pckl', 'rb')
    best_model = pickle.load(reader)
    reader.close()
    tree_calib=best_model["best_est"]
    fig = plt.figure(figsize = (50,3))
    tree.plot_tree(tree_calib, feature_names = feature_names,
              class_names = ['AUC'], filled = True)
    plt.savefig(Time_res_dir+'/Figures/DecisionTree_'+MGMT+'.png',dpi=600)