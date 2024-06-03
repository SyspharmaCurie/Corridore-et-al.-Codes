function print_fincostfun(Results_dir,cost_Chk1_Jack_MGMT_M,cost_pChk1_Jack_MGMT_M,...
    cost_MGMT_Jack_MGMT_P,cost_Chk1_Jack_MGMT_P,cost_pChk1_Jack_MGMT_P,...
    cost_Chk1_Jack_inhATR_MGMT_M,cost_pChk1_Jack_inhATR_MGMT_M,...
    cost_Chk1_Jack_inhATR_MGMT_P,cost_pChk1_Jack_inhATR_MGMT_P,...
    cost_pChk1_Aas,cost_cdc25c_Aas,cost_p53_Aas,...
    cost_DSB_He_ldTMZ_MGMT_M_72h,cost_DSB_He_ldTMZ_MGMT_P_72h,...
    cost_p53_He_ldTMZ_MGMT_M_24h,cost_p53_He_ldTMZ_MGMT_M_72h,cost_p53ser46_He_ldTMZ_MGMT_M_24h,cost_p53ser46_He_ldTMZ_MGMT_M_72h,...
    cost_p53_He_hdTMZ_MGMT_M_24h,cost_p53_He_hdTMZ_MGMT_M_72h,cost_p53ser46_He_hdTMZ_MGMT_M_24h,cost_p53ser46_He_hdTMZ_MGMT_M_72h,...
    cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A,cost_O6MeG_Ka_3h_MGMT_M,...
    cost_O6MeG_Ka_3h_MGMT_P,...
    cost_surv_Jack_MGMT_M,cost_surv_Jack_MGMT_P,...
    cost_apop_He_ld_MGMT_M_120h,cost_apop_He_hd_MGMT_M_72h,cost_apop_He_hd_MGMT_M_96h,cost_apop_He_hd_MGMT_M_120h,cost_apop_He_hd_MGMT_M_144h,...
    cost_apop_He_ld_MGMT_P_120h,cost_apop_He_hd_MGMT_P_72h,cost_apop_He_hd_MGMT_P_96h,cost_apop_He_hd_MGMT_P_120h,cost_apop_He_hd_MGMT_P_144h,...
    cost)

% costFunc_fold_name=strcat(Results_dir,'/Cost_func/');
% if ~exist(costFunc_fold_name,'dir')
%     mkdir(costFunc_fold_name);
% end

filename=strcat(Results_dir,'/Cost_func.txt');
fileID = fopen(filename,'a');

formatSpec1 = '%s: ';
formatSpec2 = '%.10f ';
interspace=';\n\n%%%%%%%%%%%%%%%%%%\n\n';

fprintf(fileID,formatSpec1,'cost_Chk1_Jack_MGMT_M');
fprintf(fileID,formatSpec2,cost_Chk1_Jack_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_pChk1_Jack_MGMT_M');
fprintf(fileID,formatSpec2,cost_pChk1_Jack_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_MGMT_Jack_MGMT_P');
fprintf(fileID,formatSpec2,cost_MGMT_Jack_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_Chk1_Jack_MGMT_P');
fprintf(fileID,formatSpec2,cost_Chk1_Jack_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_pChk1_Jack_MGMT_P');
fprintf(fileID,formatSpec2,cost_pChk1_Jack_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_Chk1_Jack_inhATR_MGMT_M');
fprintf(fileID,formatSpec2,cost_Chk1_Jack_inhATR_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_pChk1_Jack_inhATR_MGMT_M');
fprintf(fileID,formatSpec2,cost_pChk1_Jack_inhATR_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_Chk1_Jack_inhATR_MGMT_P');
fprintf(fileID,formatSpec2,cost_Chk1_Jack_inhATR_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_pChk1_Jack_inhATR_MGMT_P');
fprintf(fileID,formatSpec2,cost_pChk1_Jack_inhATR_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_pChk1_Aas');
fprintf(fileID,formatSpec2,cost_pChk1_Aas);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_cdc25c_Aas');
fprintf(fileID,formatSpec2,cost_cdc25c_Aas);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53_Aas');
fprintf(fileID,formatSpec2,cost_p53_Aas);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_DSB_He_ldTMZ_MGMT_M_72h');
fprintf(fileID,formatSpec2,cost_DSB_He_ldTMZ_MGMT_M_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53_He_ldTMZ_MGMT_M_24h');
fprintf(fileID,formatSpec2,cost_p53_He_ldTMZ_MGMT_M_24h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_DSB_He_ldTMZ_MGMT_P_72h');
fprintf(fileID,formatSpec2,cost_DSB_He_ldTMZ_MGMT_P_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53_He_ldTMZ_MGMT_M_72h');
fprintf(fileID,formatSpec2,cost_p53_He_ldTMZ_MGMT_M_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53ser46_He_ldTMZ_MGMT_M_24h');
fprintf(fileID,formatSpec2,cost_p53ser46_He_ldTMZ_MGMT_M_24h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53ser46_He_ldTMZ_MGMT_M_72h');
fprintf(fileID,formatSpec2,cost_p53ser46_He_ldTMZ_MGMT_M_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53_He_hdTMZ_MGMT_M_24h');
fprintf(fileID,formatSpec2,cost_p53_He_hdTMZ_MGMT_M_24h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53_He_hdTMZ_MGMT_M_72h');
fprintf(fileID,formatSpec2,cost_p53_He_hdTMZ_MGMT_M_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53ser46_He_hdTMZ_MGMT_M_24h');
fprintf(fileID,formatSpec2,cost_p53ser46_He_hdTMZ_MGMT_M_24h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_p53ser46_He_hdTMZ_MGMT_M_72h');
fprintf(fileID,formatSpec2,cost_p53ser46_He_hdTMZ_MGMT_M_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A');
fprintf(fileID,formatSpec2,cost_O6MeG_Ka_MGMT_M_50TMZ_temp_Fig1A);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_O6MeG_Ka_3h_MGMT_M');
fprintf(fileID,formatSpec2,cost_O6MeG_Ka_3h_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_O6MeG_Ka_3h_MGMT_P');
fprintf(fileID,formatSpec2,cost_O6MeG_Ka_3h_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Jack_MGMT_M');
fprintf(fileID,formatSpec2,cost_surv_Jack_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Jack_MGMT_P');
fprintf(fileID,formatSpec2,cost_surv_Jack_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_ld_MGMT_M_120h');
fprintf(fileID,formatSpec2,cost_apop_He_ld_MGMT_M_120h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_M_72h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_M_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_M_96h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_M_96h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_M_120h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_M_120h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_M_144h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_M_144h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_ld_MGMT_P_120h');
fprintf(fileID,formatSpec2,cost_apop_He_ld_MGMT_P_120h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_P_72h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_P_72h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_P_96h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_P_96h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_P_120h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_P_120h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_apop_He_hd_MGMT_P_144h');
fprintf(fileID,formatSpec2,cost_apop_He_hd_MGMT_P_144h);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost');
fprintf(fileID,formatSpec2,cost);
fprintf(fileID,interspace);
fclose(fileID);

end

