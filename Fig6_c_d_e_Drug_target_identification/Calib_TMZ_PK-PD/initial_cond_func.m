function [int_cond_mat]= initial_cond_func(TMZout0_surv,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    mO60,RNA_MGMT0,GT0,SSB0,mN370,DSB0,Cdc250,RNA_Mdm20,Mdm20,...
    MGMT0_U87_LN229,MGMT_P0,...
    ATR0_MGMT_M,ATR0_MGMT_P,...
    pATR0_MGMT_M,pATR0_MGMT_P,...
    Chk10_MGMT_M,Chk10_MGMT_P,...
    pChk10_MGMT_M,pChk10_MGMT_P,...
    p530_MGMT_M,p530_MGMT_P,...
    p53_ser460_MGMT_M,p53_ser460_MGMT_P)

global sn_MGMT_M_vec sn_MGMT_P_vec...
       sim_num
int_cond_mat=zeros(23,sim_num);


%% Cell TMZ survival
%%% MGMT- 
for index=1:length(sn_MGMT_M_vec)
    int_cond_mat(:,sn_MGMT_M_vec(index))=[TMZout0_surv(index);TMZin0;MTICout0;MTICin0;AICout0;AICin0;Cat0;mO60;RNA_MGMT0;MGMT0_U87_LN229;GT0;SSB0;mN370;DSB0;...
    ATR0_MGMT_M;pATR0_MGMT_M;Chk10_MGMT_M;pChk10_MGMT_M;Cdc250;p530_MGMT_M;p53_ser460_MGMT_M;RNA_Mdm20;Mdm20];
end

%%% MGMT+ 
for index=1:length(sn_MGMT_P_vec)
    int_cond_mat(:,sn_MGMT_P_vec(index))=[TMZout0_surv(index);TMZin0;MTICout0;MTICin0;AICout0;AICin0;Cat0;mO60;RNA_MGMT0;MGMT_P0;GT0;SSB0;mN370;DSB0;...
    ATR0_MGMT_P;pATR0_MGMT_P;Chk10_MGMT_P;pChk10_MGMT_P;Cdc250;p530_MGMT_P;p53_ser460_MGMT_P;RNA_Mdm20;Mdm20];
end




end
