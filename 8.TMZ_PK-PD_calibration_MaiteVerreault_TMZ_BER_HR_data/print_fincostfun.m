function print_fincostfun(Results_dir,cost_surv_Verre_TMZalone_MGMT_M,cost_surv_Verre_TMZalone_MGMT_P,...
    cost_surv_Verre_TMZNip_MGMT_M,cost_surv_Verre_TMZNip_MGMT_P,...
    cost_surv_Verre_TMZRI1_MGMT_M,cost_surv_Verre_TMZRI1_MGMT_P,...
    cost_surv_Verre_TMZRI1Nip_MGMT_M,cost_surv_Verre_TMZRI1Nip_MGMT_P,...
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

fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZalone_MGMT_M');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZalone_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZalone_MGMT_P');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZalone_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZNip_MGMT_M');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZNip_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZNip_MGMT_P');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZNip_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZRI1_MGMT_M');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZRI1_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZRI1_MGMT_P');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZRI1_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZRI1Nip_MGMT_M');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZRI1Nip_MGMT_M);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost_surv_Verre_TMZRI1Nip_MGMT_P');
fprintf(fileID,formatSpec2,cost_surv_Verre_TMZRI1Nip_MGMT_P);
fprintf(fileID,interspace);
fprintf(fileID,formatSpec1,'cost');
fprintf(fileID,formatSpec2,cost);
fprintf(fileID,interspace);
fclose(fileID);

end

