function [int_cond_mat]= initial_cond_func(TMZout0_surv,...
    TMZin0,MTICout0,MTICin0,AICout0,AICin0,Cat0,...
    MGMT0,mO60,GT0,SSB0,mN370,DSB0,ATR0,pATR0,Chk10,pChk10,Cdc250,p530,p53_ser460,RNA_Mdm20,Mdm20)

global sn_surv_0TMZ_144h sn_surv_1TMZ_144h sn_surv_2TMZ_144h sn_surv_4TMZ_144h sn_surv_8TMZ_144h sn_surv_16TMZ_144h sn_surv_32TMZ_144h ...
    sn_surv_64TMZ_144h sn_surv_128TMZ_144h sn_surv_256TMZ_144h sn_surv_512TMZ_144h sn_surv_1024TMZ_144h sn_surv_3000TMZ_144h...
    sim_number
int_cond_mat=zeros(22,sim_number);

%% Cell TMZ-survival
for index=1:sn_surv_3000TMZ_144h-sn_surv_0TMZ_144h+1
    int_cond_mat(:,sn_surv_0TMZ_144h+index-1)=[TMZout0_surv(index);TMZin0;MTICout0;MTICin0;AICout0;AICin0;Cat0;mO60;MGMT0;GT0;SSB0;mN370;DSB0;...
    ATR0;pATR0;Chk10;pChk10;Cdc250;p530;p53_ser460;RNA_Mdm20;Mdm20];
end




end

