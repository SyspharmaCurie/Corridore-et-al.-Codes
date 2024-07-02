function [TMZdata_surv_Jack_MGMT_M,surv_mean_Jack_MGMT_M,surv_stddev_Jack_MGMT_M,...
          TMZdata_nosurv_Jack_data,MGMT_Jack_MGMT_M_time,MGMT_Jack_MGMT_M,Chk1_Jack_MGMT_M_time,Chk1_Jack_MGMT_M,pChk1_Jack_MGMT_M_time,pChk1_Jack_MGMT_M,...
          TMZdata_surv_Jack_MGMT_P,surv_mean_Jack_MGMT_P,surv_stddev_Jack_MGMT_P,...
          MGMT_Jack_MGMT_P_time,MGMT_Jack_MGMT_P,Chk1_Jack_MGMT_P_time,Chk1_Jack_MGMT_P,pChk1_Jack_MGMT_P_time,pChk1_Jack_MGMT_P,...
          TMZdata_Jack_inhATR,VX_Jack2D,MGMT_Jack_inhATR_TMZVXcon_MGMT_M,MGMT_Jack_inhATR_VXcon_MGMT_M,MGMT_Jack_inhATR_MGMT_M,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_M,Chk1_Jack_inhATR_VXcon_MGMT_M,Chk1_Jack_inhATR_MGMT_M,...
          pChk1_Jack_inhATR_TMZVXcon_MGMT_M,pChk1_Jack_inhATR_VXcon_MGMT_M,pChk1_Jack_inhATR_MGMT_M,...
          MGMT_Jack_inhATR_TMZVXcon_MGMT_P,MGMT_Jack_inhATR_VXcon_MGMT_P,MGMT_Jack_inhATR_MGMT_P,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_P,Chk1_Jack_inhATR_VXcon_MGMT_P,Chk1_Jack_inhATR_MGMT_P,...
          pChk1_Jack_inhATR_TMZVXcon_MGMT_P,pChk1_Jack_inhATR_VXcon_MGMT_P,pChk1_Jack_inhATR_MGMT_P,...
          TMZdata_Aas,p53_Aas_time,p53_Aas,pChk1_Aas_time,pChk1_Aas,cdc25c_Aas_time,cdc25c_Aas,surv_Aas_25TMZ,...
          TMZdata_He_hd,p53_He_hdTMZ_MGMT_M_24h,p53_He_hdTMZ_MGMT_M_72h,p53ser46_He_hdTMZ_MGMT_M_24h,p53ser46_He_hdTMZ_MGMT_M_72h,...
          apop_mean_He_hdTMZ_MGMT_M_72h,apop_stddev_He_hdTMZ_MGMT_M_72h,apop_mean_He_hdTMZ_MGMT_M_96h,apop_stddev_He_hdTMZ_MGMT_M_96h,...
          apop_mean_He_hdTMZ_MGMT_M_120h,apop_stddev_He_hdTMZ_MGMT_M_120h,apop_mean_He_hdTMZ_MGMT_M_144h,apop_stddev_He_hdTMZ_MGMT_M_144h,...
          apop_mean_He_hdTMZ_MGMT_P_72h,apop_stddev_He_hdTMZ_MGMT_P_72h,apop_mean_He_hdTMZ_MGMT_P_96h,apop_stddev_He_hdTMZ_MGMT_P_96h,...
          apop_mean_He_hdTMZ_MGMT_P_120h,apop_stddev_He_hdTMZ_MGMT_P_120h,apop_mean_He_hdTMZ_MGMT_P_144h,apop_stddev_He_hdTMZ_MGMT_P_144h,...
          TMZdata_He_ld,DSB_He_ldTMZ_MGMT_M_72h,DSB_He_ldTMZ_MGMT_P_72h,p53_He_ldTMZ_MGMT_M_24h,p53_He_ldTMZ_MGMT_M_72h,p53ser46_He_ldTMZ_MGMT_M_24h,p53ser46_He_ldTMZ_MGMT_M_72h,...
          apop_mean_He_ldTMZ_MGMT_M_120h,apop_stddev_He_ldTMZ_MGMT_M_120h,apop_mean_He_ldTMZ_MGMT_P_120h,apop_stddev_He_ldTMZ_MGMT_P_120h,...
          O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time,O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A,...
          TMZdata_O6Meg_Ka_3h_MGMT_M,O6Meg_Ka_3h_MGMT_M,TMZdata_O6Meg_Ka_3h_MGMT_P,O6Meg_Ka_3h_MGMT_P] = data_reader()

data_fold='Data/1_LN229_commercial_cell_line/';


%% Jackson 2019
Jack_data_fold='Jackson2019/Data_Jackson2019/';

data_surv_Jack_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'Viability_MGMT_M.csv'));
TMZdata_surv_Jack_MGMT_M=data_surv_Jack_MGMT_M(:,1);
surv_mean_Jack_MGMT_M=data_surv_Jack_MGMT_M(:,2);
data_surv_inf_Jack_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'Viability_MGMT_M_inf.csv'));
surv_inf_Jack_MGMT_M=data_surv_inf_Jack_MGMT_M(:,2);
data_surv_sup_Jack_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'Viability_MGMT_M_sup.csv'));
surv_sup_Jack_MGMT_M=data_surv_sup_Jack_MGMT_M(:,2);
surv_stddev_Jack_MGMT_M=(surv_sup_Jack_MGMT_M-surv_inf_Jack_MGMT_M)/2;

TMZdata_nosurv_Jack_data=12.5;
MGMT_Jack_MGMT_M_time=csvread(strcat(data_fold,Jack_data_fold,'time_Jack_Fig2A.csv'));
MGMT_Jack_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'MGMT_Jack_MGMT_M_Fig2A.csv'));
Chk1_Jack_MGMT_M_time=csvread(strcat(data_fold,Jack_data_fold,'time_Jack_Fig2A.csv'));
Chk1_Jack_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'Chk1_Jack_MGMT_M_Fig2A.csv'));
pChk1_Jack_MGMT_M_time=csvread(strcat(data_fold,Jack_data_fold,'time_Jack_Fig2A.csv'));
pChk1_Jack_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'pChk1_Jack_MGMT_M_Fig2A.csv'));

data_surv_Jack_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'Viability_MGMT_P.csv'));
TMZdata_surv_Jack_MGMT_P=data_surv_Jack_MGMT_P(:,1);
surv_mean_Jack_MGMT_P=data_surv_Jack_MGMT_P(:,2);
data_surv_inf_Jack_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'Viability_MGMT_P_inf.csv'));
surv_inf_Jack_MGMT_P=data_surv_inf_Jack_MGMT_P(:,2);
data_surv_sup_Jack_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'Viability_MGMT_P_sup.csv'));
surv_sup_Jack_MGMT_P=data_surv_sup_Jack_MGMT_P(:,2);
surv_stddev_Jack_MGMT_P=(surv_sup_Jack_MGMT_P-surv_inf_Jack_MGMT_P)/2;

MGMT_Jack_MGMT_P_time=csvread(strcat(data_fold,Jack_data_fold,'time_Jack_Fig2A.csv'));
MGMT_Jack_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'MGMT_Jack_MGMT_P_Fig2A.csv'));
Chk1_Jack_MGMT_P_time=csvread(strcat(data_fold,Jack_data_fold,'time_Jack_Fig2A.csv'));
Chk1_Jack_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'Chk1_Jack_MGMT_P_Fig2A.csv'));
pChk1_Jack_MGMT_P_time=csvread(strcat(data_fold,Jack_data_fold,'time_Jack_Fig2A.csv'));
pChk1_Jack_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'pChk1_Jack_MGMT_P_Fig2A.csv'));

%% Jackson 2019 Inhibited ATR
TMZdata_Jack_inhATR=[0 100 100 100 100 100]';
VX_Jack2D=csvread(strcat(data_fold,Jack_data_fold,'VX_nM_Jack_Fig2D.csv'));%data in nM 
VX_Jack2D=1e-3*VX_Jack2D;%in microM

MGMT_Jack2D_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'MGMT_Jack_MGMT_M_Fig2D_Sergio.csv'));
MGMT_Jack_inhATR_TMZVXcon_MGMT_M=MGMT_Jack2D_MGMT_M(1);
MGMT_Jack_inhATR_VXcon_MGMT_M=MGMT_Jack2D_MGMT_M(2);
MGMT_Jack_inhATR_MGMT_M=MGMT_Jack2D_MGMT_M(3:end);

Chk1_Jack2D_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'Chk1_Jack_MGMT_M_Fig2D_Sergio.csv'));
Chk1_Jack_inhATR_TMZVXcon_MGMT_M=Chk1_Jack2D_MGMT_M(1);
Chk1_Jack_inhATR_VXcon_MGMT_M=Chk1_Jack2D_MGMT_M(2);
Chk1_Jack_inhATR_MGMT_M=Chk1_Jack2D_MGMT_M(3:end);

pChk1_Jack2D_MGMT_M=csvread(strcat(data_fold,Jack_data_fold,'pChk1_Jack_MGMT_M_Fig2D_Sergio.csv'));
pChk1_Jack_inhATR_TMZVXcon_MGMT_M=pChk1_Jack2D_MGMT_M(1);
pChk1_Jack_inhATR_VXcon_MGMT_M=pChk1_Jack2D_MGMT_M(2);
pChk1_Jack_inhATR_MGMT_M=pChk1_Jack2D_MGMT_M(3:end);

MGMT_Jack2D_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'MGMT_Jack_MGMT_P_Fig2D_Sergio.csv'));
MGMT_Jack_inhATR_TMZVXcon_MGMT_P=MGMT_Jack2D_MGMT_P(1);
MGMT_Jack_inhATR_VXcon_MGMT_P=MGMT_Jack2D_MGMT_P(2);
MGMT_Jack_inhATR_MGMT_P=MGMT_Jack2D_MGMT_P(3:end);

Chk1_Jack2D_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'Chk1_Jack_MGMT_P_Fig2D_Sergio.csv'));
Chk1_Jack_inhATR_TMZVXcon_MGMT_P=Chk1_Jack2D_MGMT_P(1);
Chk1_Jack_inhATR_VXcon_MGMT_P=Chk1_Jack2D_MGMT_P(2);
Chk1_Jack_inhATR_MGMT_P=Chk1_Jack2D_MGMT_P(3:end);

pChk1_Jack2D_MGMT_P=csvread(strcat(data_fold,Jack_data_fold,'pChk1_Jack_MGMT_P_Fig2D_Sergio.csv'));
pChk1_Jack_inhATR_TMZVXcon_MGMT_P=pChk1_Jack2D_MGMT_P(1);
pChk1_Jack_inhATR_VXcon_MGMT_P=pChk1_Jack2D_MGMT_P(2);
pChk1_Jack_inhATR_MGMT_P=pChk1_Jack2D_MGMT_P(3:end);


%% Aasland  2020
TMZdata_Aas=100;
Aas_data_fold='Aasland2020/Data_Aasland2020/';

p53_Aas=csvread(strcat(data_fold,Aas_data_fold,'p53_Aas_Fig2B.csv'));
p53_Aas_time=csvread(strcat(data_fold,Aas_data_fold,'time_Aas_Fig2B.csv'));

data_pChk1_Aas_Fig3A=csvread(strcat(data_fold,Aas_data_fold,'pChk1_Aas_Fig3A.csv'));
pChk1_Aas_time=csvread(strcat(data_fold,Aas_data_fold,'time_Aas_Fig3A.csv'));
pChk1_Aas=[ mean(data_pChk1_Aas_Fig3A(1:2:end)) data_pChk1_Aas_Fig3A(2:2:end) ];

data_cdc25c_Aas_Fig3A=csvread(strcat(data_fold,Aas_data_fold,'cdc25C_Aas_Fig3A.csv'));
cdc25c_Aas_time=csvread(strcat(data_fold,Aas_data_fold,'time_Aas_Fig3A.csv'));
cdc25c_Aas=[ mean(data_cdc25c_Aas_Fig3A(1:2:end)) data_cdc25c_Aas_Fig3A(2:2:end) ];

apop_Aas_25TMZ=csvread(strcat(data_fold,Aas_data_fold,'apop_25TMZ_Fig1H.csv'));
surv_Aas_25TMZ=[apop_Aas_25TMZ(:,1) 100-apop_Aas_25TMZ(:,2)];

%% He 2019
% High doses
He_data_fold='He2019/Data_He2019/';
p53_data_He_hdTMZ_MGMT_M_24h=csvread(strcat(data_fold,He_data_fold,'High_doses/p53_He_hdTMZ_MGMT_M_24h.csv'));
TMZdata_He_hd=p53_data_He_hdTMZ_MGMT_M_24h(:,1);
p53_He_hdTMZ_MGMT_M_24h=p53_data_He_hdTMZ_MGMT_M_24h(:,2);
p53_data_He_hdTMZ_MGMT_M_72h=csvread(strcat(data_fold,He_data_fold,'High_doses/p53_He_hdTMZ_MGMT_M_72h.csv'));
p53_He_hdTMZ_MGMT_M_72h=p53_data_He_hdTMZ_MGMT_M_72h(:,2);
p53ser46_data_He_hdTMZ_MGMT_M_24h=csvread(strcat(data_fold,He_data_fold,'High_doses/p53ser46_He_hdTMZ_MGMT_M_24h.csv'));
p53ser46_He_hdTMZ_MGMT_M_24h=p53ser46_data_He_hdTMZ_MGMT_M_24h(:,2);
p53ser46_data_He_hdTMZ_MGMT_M_72h=csvread(strcat(data_fold,He_data_fold,'High_doses/p53ser46_He_hdTMZ_MGMT_M_72h.csv'));
p53ser46_He_hdTMZ_MGMT_M_72h=p53ser46_data_He_hdTMZ_MGMT_M_72h(:,2);

apop_mean_He_hdTMZ_MGMT_M_72h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_M_72h.csv'));
apop_mean_He_hdTMZ_MGMT_M_72h=apop_mean_He_hdTMZ_MGMT_M_72h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_M_72h=zeros(size(apop_mean_He_hdTMZ_MGMT_M_72h));

apop_mean_He_hdTMZ_MGMT_M_96h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_M_96h.csv'));
apop_mean_He_hdTMZ_MGMT_M_96h=apop_mean_He_hdTMZ_MGMT_M_96h_data(:,2);
apop_inf_He_hdTMZ_MGMT_M_96h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_inf_He_hdTMZ_MGMT_M_96h.csv'));
apop_inf_He_hdTMZ_MGMT_M_96h=apop_inf_He_hdTMZ_MGMT_M_96h_data(:,2);
apop_sup_He_hdTMZ_MGMT_M_96h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_sup_He_hdTMZ_MGMT_M_96h.csv'));
apop_sup_He_hdTMZ_MGMT_M_96h=apop_sup_He_hdTMZ_MGMT_M_96h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_M_96h=(apop_sup_He_hdTMZ_MGMT_M_96h-apop_inf_He_hdTMZ_MGMT_M_96h)/2;

apop_mean_He_hdTMZ_MGMT_M_120h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_M_120h.csv'));
apop_mean_He_hdTMZ_MGMT_M_120h=apop_mean_He_hdTMZ_MGMT_M_120h_data(:,2);
apop_inf_He_hdTMZ_MGMT_M_120h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_inf_He_hdTMZ_MGMT_M_120h.csv'));
apop_inf_He_hdTMZ_MGMT_M_120h=apop_inf_He_hdTMZ_MGMT_M_120h_data(:,2);
apop_sup_He_hdTMZ_MGMT_M_120h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_sup_He_hdTMZ_MGMT_M_120h.csv'));
apop_sup_He_hdTMZ_MGMT_M_120h=apop_sup_He_hdTMZ_MGMT_M_120h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_M_120h=(apop_sup_He_hdTMZ_MGMT_M_120h-apop_inf_He_hdTMZ_MGMT_M_120h)/2;

apop_mean_He_hdTMZ_MGMT_M_144h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_M_144h.csv'));
apop_mean_He_hdTMZ_MGMT_M_144h=apop_mean_He_hdTMZ_MGMT_M_144h_data(:,2);
apop_inf_He_hdTMZ_MGMT_M_144h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_inf_He_hdTMZ_MGMT_M_144h.csv'));
apop_inf_He_hdTMZ_MGMT_M_144h=apop_inf_He_hdTMZ_MGMT_M_144h_data(:,2);
apop_sup_He_hdTMZ_MGMT_M_144h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_sup_He_hdTMZ_MGMT_M_144h.csv'));
apop_sup_He_hdTMZ_MGMT_M_144h=apop_sup_He_hdTMZ_MGMT_M_144h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_M_144h=(apop_sup_He_hdTMZ_MGMT_M_144h-apop_inf_He_hdTMZ_MGMT_M_144h)/2;

apop_mean_He_hdTMZ_MGMT_P_72h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_P_72h.csv'));
apop_mean_He_hdTMZ_MGMT_P_72h=apop_mean_He_hdTMZ_MGMT_P_72h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_P_72h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_72h));

apop_mean_He_hdTMZ_MGMT_P_96h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_P_96h.csv'));
apop_mean_He_hdTMZ_MGMT_P_96h=apop_mean_He_hdTMZ_MGMT_P_96h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_P_96h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_96h));

apop_mean_He_hdTMZ_MGMT_P_120h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_P_120h.csv'));
apop_mean_He_hdTMZ_MGMT_P_120h=apop_mean_He_hdTMZ_MGMT_P_120h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_P_120h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_120h));

apop_mean_He_hdTMZ_MGMT_P_144h_data=csvread(strcat(data_fold,He_data_fold,'High_doses/Apop_He_hdTMZ_MGMT_P_144h.csv'));
apop_mean_He_hdTMZ_MGMT_P_144h=apop_mean_He_hdTMZ_MGMT_P_144h_data(:,2);
apop_stddev_He_hdTMZ_MGMT_P_144h=zeros(size(apop_mean_He_hdTMZ_MGMT_P_144h));

% Low doses
DSB_data_He_ldTMZ_72h=csvread(strcat(data_fold,He_data_fold,'Low_doses/DSB_He_ldTMZ_72h.csv'));
TMZdata_He_ld=DSB_data_He_ldTMZ_72h(:,1);
DSB_He_ldTMZ_MGMT_M_72h=DSB_data_He_ldTMZ_72h(:,2);
DSB_He_ldTMZ_MGMT_P_72h=DSB_data_He_ldTMZ_72h(:,3);
p53_data_He_ldTMZ_MGMT_M_24h=csvread(strcat(data_fold,He_data_fold,'Low_doses/p53_He_ldTMZ_MGMT_M_24h.csv'));
p53_He_ldTMZ_MGMT_M_24h=p53_data_He_ldTMZ_MGMT_M_24h(:,2);
p53_data_He_ldTMZ_MGMT_M_72h=csvread(strcat(data_fold,He_data_fold,'Low_doses/p53_He_ldTMZ_MGMT_M_72h.csv'));
p53_He_ldTMZ_MGMT_M_72h=p53_data_He_ldTMZ_MGMT_M_72h(:,2);
p53ser46_data_He_ldTMZ_MGMT_M_24h=csvread(strcat(data_fold,He_data_fold,'Low_doses/p53ser46_He_ldTMZ_MGMT_M_24h.csv'));
p53ser46_He_ldTMZ_MGMT_M_24h=p53ser46_data_He_ldTMZ_MGMT_M_24h(:,2);
p53ser46_data_He_ldTMZ_MGMT_M_72h=csvread(strcat(data_fold,He_data_fold,'Low_doses/p53ser46_He_ldTMZ_MGMT_M_72h.csv'));
p53ser46_He_ldTMZ_MGMT_M_72h=p53ser46_data_He_ldTMZ_MGMT_M_72h(:,2);

apop_mean_He_ldTMZ_MGMT_M_120h_data=csvread(strcat(data_fold,He_data_fold,'Low_doses/Apop_He_ldTMZ_MGMT_M_120h.csv'));
apop_mean_He_ldTMZ_MGMT_M_120h=apop_mean_He_ldTMZ_MGMT_M_120h_data(:,2);
apop_inf_He_ldTMZ_MGMT_M_120h_data=csvread(strcat(data_fold,He_data_fold,'Low_doses/Apop_inf_He_ldTMZ_MGMT_M_120h.csv'));
apop_inf_He_ldTMZ_MGMT_M_120h=apop_inf_He_ldTMZ_MGMT_M_120h_data(:,2);
apop_sup_He_ldTMZ_MGMT_M_120h_data=csvread(strcat(data_fold,He_data_fold,'Low_doses/Apop_sup_He_ldTMZ_MGMT_M_120h.csv'));
apop_sup_He_ldTMZ_MGMT_M_120h=apop_sup_He_ldTMZ_MGMT_M_120h_data(:,2);
apop_stddev_He_ldTMZ_MGMT_M_120h=(apop_sup_He_ldTMZ_MGMT_M_120h-apop_inf_He_ldTMZ_MGMT_M_120h)/2;

apop_mean_He_ldTMZ_MGMT_P_120h_data=csvread(strcat(data_fold,He_data_fold,'Low_doses/Apop_He_ldTMZ_MGMT_P_120h.csv'));
apop_mean_He_ldTMZ_MGMT_P_120h=apop_mean_He_ldTMZ_MGMT_P_120h_data(:,2);
apop_stddev_He_ldTMZ_MGMT_P_120h=zeros(size(apop_mean_He_ldTMZ_MGMT_P_120h));



%% Kaina 2021
Ka_data_fold='Kaina2021/Data_Kaina2021/';
Fig1A_O6Meg_LN229_MGMT_M_50TMZ_temp=csvread(strcat(data_fold,Ka_data_fold,'Fig1A_O6Meg_LN229_MGMT_M_50TMZ_temp.csv'));
O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A_time=Fig1A_O6Meg_LN229_MGMT_M_50TMZ_temp(:,1);
O6Meg_Ka_MGMT_M_50TMZ_temp_Fig1A=Fig1A_O6Meg_LN229_MGMT_M_50TMZ_temp(:,2);

Fig1D_O6Meg_LN229_3h_MGMT_M=csvread(strcat(data_fold,Ka_data_fold,'Fig1D_O6Meg_LN229_3h_MGMT_M.csv'));
TMZdata_O6Meg_Ka_3h_MGMT_M=Fig1D_O6Meg_LN229_3h_MGMT_M(:,1);
O6Meg_Ka_3h_MGMT_M=Fig1D_O6Meg_LN229_3h_MGMT_M(:,2);
Fig1D_O6Meg_LN229_3h_MGMT_P=csvread(strcat(data_fold,Ka_data_fold,'Fig1D_O6Meg_LN229_3h_MGMT_P.csv'));
TMZdata_O6Meg_Ka_3h_MGMT_P=Fig1D_O6Meg_LN229_3h_MGMT_P(:,1);
O6Meg_Ka_3h_MGMT_P=Fig1D_O6Meg_LN229_3h_MGMT_P(:,2);



end

