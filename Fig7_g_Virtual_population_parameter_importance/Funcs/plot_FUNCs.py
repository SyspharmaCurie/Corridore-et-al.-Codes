
import numpy as np

# -- visualisation
import matplotlib.pyplot as plt


def plot_feature_importances_SHAP(shap_values,feature_names):
    
    color_plot=[0, 0.447058823529412, 0.698039215686274]

    font_size=18
    #same colors than MATLAB simulations
    [Tol_bright,Tol_muted,Tol_light,Okabe_Ito,BuRd,Iridescent]=color_pallets_def()
    color_DNArepair=Tol_muted[1]
    color_ATRChk1=Tol_bright[2]
    color_p53=Iridescent[15]
    color_apoptosis=Okabe_Ito[7]

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
    plt.sca(ax)
    plt.yticks(y_pos, fontsize=font_size, weight='bold')
    plt.xticks(fontsize=font_size, weight='bold')
    plt.gca().set_yticklabels([feature_names[i] for i in feature_inds])

    ax.set_xlabel(xlabel='Shap Value', fontsize=font_size, weight='bold')
    ax.set_ylabel( ylabel='Parameters', fontsize=font_size, weight='bold')
    # Hide x labels and tick labels
    
    ax.label_outer()

    fig.tight_layout()
    plt.show()



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
