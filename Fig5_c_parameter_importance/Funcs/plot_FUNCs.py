
import numpy as np

# -- visualisation
import matplotlib.pyplot as plt

def plot_feature_importances_SHAP_MGMT_sametreat(shap_values_bothtreat,feature_names):
    
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
    plt.show()