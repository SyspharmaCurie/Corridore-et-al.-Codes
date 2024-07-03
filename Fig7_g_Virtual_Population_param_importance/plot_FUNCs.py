import pandas as pd
import numpy as np

# -- visualisation
import matplotlib.pyplot as plt
import plotly.express as px
# -- feature importance
from sklearn.inspection import permutation_importance
import shap

# -- machine-learning
from sklearn import tree

# -- save python object
import pickle
# -- my functions
import utils as ut


def plot_feature_importances_MDI(forest_importances_sorted,treatNAME,Time_res_dir):
    color_plot=[0, 0.447058823529412, 0.698039215686274]
    fig, ax = plt.subplots()
    forest_importances_sorted.plot.barh(ax=ax,color=color_plot)
    ax.set_title("Feature importances using MDI),"+treatNAME)
    ax.set_ylabel("Mean decrease in impurity")
    fig.tight_layout()
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_MDI.png', dpi=300)
    # plt.show()


def plot_feature_importances_SHAP(shap_values,X_test,feature_names,treatNAMES,Time_res_dir):
    
    color_plot=[0, 0.447058823529412, 0.698039215686274]

    shap.summary_plot(shap_values, X_test, feature_names=feature_names, plot_type='bar',show=False,color=color_plot)
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_SH.png', dpi=300)

    font_size=18
    #same colors than MATLAB simulations
    [Tol_bright,Tol_muted,Tol_light,Okabe_Ito,BuRd,Iridescent]=color_pallets_def()
    color_drugMetabolism=Okabe_Ito[6]
    color_DNArepair=Tol_muted[1]
    color_DNAdamage=BuRd[5]
    color_ATRChk1=Tol_bright[2]
    color_cellcycle=Tol_bright[5]
    color_p53=Iridescent[15]
    color_apoptosis=Okabe_Ito[7]
    # color_DNArepair='#6AA999'
    # color_DNAdamage='#D6A98C'
    # color_ATRChk1='#679EBD'
    # color_cellcycle='#9D628D'
    # color_p53='#9595C2'
    # color_apoptosis='#4B4B4B'
    color_plot=np.array([color_p53,color_apoptosis,color_ATRChk1,color_p53,color_p53,color_apoptosis,color_apoptosis,color_ATRChk1,color_p53,color_ATRChk1,color_apoptosis,color_ATRChk1,color_DNArepair]) # from the bottom bar to the top
    fig , ax = plt.subplots(figsize=(13,10))
    feature_numb=len(feature_names)
    global_shap_values=np.abs(shap_values).mean(0)
    feature_order = np.argsort(global_shap_values)
    max_display= 13  #feature_numb
    feature_inds = feature_order[feature_numb-max_display:feature_numb]#Since the shapes values are sorted from the smaller to the bigger
    y_pos = np.arange(len(feature_inds))
    h=ax.barh(y_pos, global_shap_values[feature_inds], 0.6, align='center',color=color_plot[0:max_display])
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    plt.legend(h, ['P53 NETWORK','APOPTOSIS','ATR-CHK1 AXIS','_P53 NETWORK','_P53 NETWORK','_APOPTOSIS','_APOPTOSIS','_ATR-CHK1 AXIS','_P53 NETWORK','_ATR-CHK1 AXIS','_APOPTOSIS','_ATR-CHK1 AXIS','DNA REPAIR'],reverse=True,fontsize='xx-large')
    # plt.legend(h)
    plt.sca(ax)
    plt.yticks(y_pos, fontsize=font_size, weight='bold')
    plt.xticks(fontsize=font_size, weight='bold')
    plt.gca().set_yticklabels([feature_names[i] for i in feature_inds])

    ax.set_xlabel(xlabel='Shap Value', fontsize=font_size, weight='bold')
    ax.set_ylabel( ylabel='Parameters', fontsize=font_size, weight='bold')
    # Hide x labels and tick labels
    
    ax.label_outer()

    fig.tight_layout()
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_SH_'+treatNAMES+'.png', dpi=300)
    plt.savefig('Results/'+Time_res_dir+'/Figures/FI_SH_'+treatNAMES+'.svg', dpi=300)
    # plt.show()

def plot_feature_importances_SH_alltreat(shap_values_alltreat,feature_names,treatNAMES):
    # Feature importance based on mean decrease in impurity¶
    print("\n\nResultFeature importance Shape")
    font_size=15
    color_plot=[0, 0.447058823529412, 0.698039215686274]

    fig , axs = plt.subplots(ncols=3,figsize=(10,8))
    feature_numb=len(feature_names)
    feature_order = np.argsort(np.sum(np.abs(shap_values_alltreat[0]), axis=0))
    max_display=20
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
    plt.savefig('Results/All treament SHAP figures/FI_SH_alltreat.png', dpi=300)
    # plt.show()

def plot_dectree(Time_res_dir,feature_names):

    reader = open(Time_res_dir+'/best_model_NOnested.pckl', 'rb')
    best_model = pickle.load(reader)
    reader.close()
    tree_calib=best_model["best_est"]
    fig = plt.figure(figsize = (50,3))
    tree.plot_tree(tree_calib, feature_names = feature_names,
              class_names = ['AUC'], filled = True)
    plt.savefig(Time_res_dir+'/Figures/DecisionTree.svg',dpi=100)


def  color_pallets_def():
    #R script from https://zenodo.org/record/3381072

    #From Paul Tol: https://personal.sron.nl/~pault/
    Tol_bright =['#EE6677', '#228833', '#4477AA', '#CCBB44', '#66CCEE', '#AA3377', '#BBBBBB']

    Tol_muted =['#88CCEE', '#44AA99', '#117733', '#332288', '#DDCC77', '#999933','#CC6677', '#882255', '#AA4499', '#DDDDDD']

    Tol_light =['#BBCC33', '#AAAA00', '#77AADD', '#EE8866', '#EEDD88', '#FFAABB', '#99DDFF', '#44BB99', '#DDDDDD']

    #From Color Universal Design (CUD): https://jfly.uni-koeln.de/color/
    Okabe_Ito =['#E69F00', '#56B4E9', '#009E73', '#F0E442', '#0072B2', '#D55E00', '#CC79A7', '#000000']

    BuRd=['#2166AC', '#4393C3', '#92C5DE', '#D1E5F0', '#F7F7F7', '#FDDBC7', '#F4A582', '#D6604D', '#B2182B']

    Iridescent=['#FEFBE9', '#FCF7D5', '#F5F3C1', '#EAF0B5', '#DDECBF', '#D0E7CA', '#C2E3D2', '#B5DDD8', '#A8D8DC', '#9BD2E1', '#8DCBE4', '#81C4E7', '#7BBCE7', '#7EB2E4', '#88A5DD', '#9398D2', '#9B8AC4', '#9D7DB2', '#9A709E', '#906388', '#805770', '#684957', '#46353A']


    return [Tol_bright,Tol_muted,Tol_light,Okabe_Ito,BuRd,Iridescent]

def plot_param_vs_output(param_vec,output_vec,param_name,Time_res_dir):
    font_size=18
    plt.scatter(param_vec,output_vec)
    plt.xlabel(xlabel=param_name, fontsize=font_size, weight='bold')
    plt.ylabel( ylabel='surv. curve AUC', fontsize=font_size, weight='bold')
    plt.savefig(Time_res_dir+'/Figures/'+param_name+'.png',dpi=600)
    plt.close()

def plot_param_vs_output_3d(param_vec1,param_vec2,output_vec,param_name1,param_name2,Time_res_dir):
    
    data = {
    'x': param_vec1,
    'y': param_vec2,
    'z': output_vec[0:,0],
    }

    df = pd.DataFrame(data)

    fig = px.scatter_3d(df,
                        x='x',
                        y='y',
                        z='z',
                        title='plotly',
                        opacity=0.8,
                        color_continuous_scale='viridis',
                        )

    fig.update_layout(margin=dict(l=0, r=0, b=0, t=50))

    fig.write_html(Time_res_dir+'/Figures/'+param_name1+'_'+param_name2+'.html')

    # fig.show()


def plot_param_vs_hist(param_vec,param_name,Time_res_dir):
    font_size=18
    plt.hist(param_vec,bins=100)
    plt.xlabel(xlabel=param_name, fontsize=font_size, weight='bold')
    plt.savefig(Time_res_dir+'/Figures/Hist_'+param_name+'.png',dpi=600)
    plt.close()