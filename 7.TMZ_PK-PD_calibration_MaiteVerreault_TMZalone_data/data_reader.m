function [DSB_He_ldTMZ_MGMT_M_72h,DSB_He_ldTMZ_MGMT_P_72h,...
          TMZ_surv_Verre_TMZalone_MGMT_M,surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...
          TMZ_surv_Verre_TMZalone_MGMT_P,surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P] = data_reader()
      
data_fold='Data/1_LN229_commercial_cell_line/';

%% He 2019 High doses
He_data_fold='He2019/Data_He2019/';

%% He 2019 Low doses
DSB_data_He_ldTMZ_72h=csvread(strcat(data_fold,He_data_fold,'Low_doses/DSB_He_ldTMZ_72h.csv'));
DSB_He_ldTMZ_MGMT_M_72h=DSB_data_He_ldTMZ_72h(:,2);
DSB_He_ldTMZ_MGMT_P_72h=DSB_data_He_ldTMZ_72h(:,3);

%% Maite Verreault
Verr_data_fold='MaiteVerreault/Data_MaiteVerreault/';

data_surv_TMZalone_Verr_MGMT_M=csvread(strcat(data_fold,Verr_data_fold,'surv_TMZalone_MGMT_M.csv'));
TMZ_surv_Verre_TMZalone_MGMT_M=data_surv_TMZalone_Verr_MGMT_M(:,1);
surv_mean_Verre_TMZalone_MGMT_M=mean(data_surv_TMZalone_Verr_MGMT_M(:,2:4),2);
surv_inf_Verre_TMZalone_MGMT_M=min(data_surv_TMZalone_Verr_MGMT_M(:,2:4),[],2);
surv_sup_Verre_TMZalone_MGMT_M=max(data_surv_TMZalone_Verr_MGMT_M(:,2:4),[],2);
surv_stddev_Verre_TMZalone_MGMT_M=(surv_sup_Verre_TMZalone_MGMT_M-surv_inf_Verre_TMZalone_MGMT_M)/2;

data_surv_TMZalone_Verre_MGMT_P=csvread(strcat(data_fold,Verr_data_fold,'surv_TMZalone_MGMT_P.csv'));
TMZ_surv_Verre_TMZalone_MGMT_P=data_surv_TMZalone_Verre_MGMT_P(:,1);
surv_mean_Verre_TMZalone_MGMT_P=mean(data_surv_TMZalone_Verre_MGMT_P(:,2:4),2);
surv_inf_Verre_TMZalone_MGMT_P=min(data_surv_TMZalone_Verre_MGMT_P(:,2:4),[],2);
surv_sup_Verre_TMZalone_MGMT_P=max(data_surv_TMZalone_Verre_MGMT_P(:,2:4),[],2);
surv_stddev_Verre_TMZalone_MGMT_P=(surv_sup_Verre_TMZalone_MGMT_P-surv_inf_Verre_TMZalone_MGMT_P)/2;




end

