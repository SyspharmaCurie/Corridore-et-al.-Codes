function cell_pop_AUC_IC5O_sim(patient_num,dataset,MGMT,Results_dir,...
    inhib_factor_BER_Nip,inhib_factor_HR_RI1,...
    plot_surv_figcon,plot_surv_fignumb)

IC50_vec=zeros(patient_num,1);
survcurv_AUC_vec=zeros(patient_num,1);

TMZout0_surv_mat=zeros(13,patient_num);
surv_curvm_mat=zeros(13,patient_num);
parfor patient_indx=1:patient_num
    patX_param=dataset(patient_indx,:);

    %% population simulation
    [TMZout0_surv,surv_curvm] = TMZ_PK_PD_est_V29_2ndstep_p53_IC50_0(patient_indx,patX_param,inhib_factor_BER_Nip,inhib_factor_HR_RI1);
    TMZout0_surv_mat(:,patient_indx)=TMZout0_surv;
    surv_curvm_mat(:,patient_indx)=surv_curvm;
    %% AUC and IC50
    IC50_vec(patient_indx) = compute_survcurv_IC50(TMZout0_surv,surv_curvm);
    survcurv_AUC_vec(patient_indx) = compute_survcurv_AUC(TMZout0_surv,surv_curvm);
end

%% Plot
if plot_surv_figcon==1
    for patient_indx=1:patient_num
        plot_setting_viab(TMZout0_surv_mat(:,patient_indx),surv_curvm_mat(:,patient_indx),...simulations
            MGMT,1,plot_surv_fignumb,0 ...figure control
            )
    end

end

if MGMT=='m'
    fMGMT='M';
elseif MGMT=='p'
    fMGMT='P';
end

% NumBins= 60;
% orig_bin=1;
% if ist_IC50_figcon==1
%     figure(ist_IC50_fignumb)
%     clf
%     h =histogram(IC50_vec,NumBins);
%     for i=1:NumBins %find the bin of original patient
%         if orig_IC50>h.BinEdges(i) && orig_IC50<h.BinEdges(i+1)
%             orig_bin=i;
%         end
%     end
%     b = bar(1:NumBins,h.Values);%color the original patient bin differently
%     b.FaceColor = 'flat';
%     b.CData(orig_bin,:) = [.5 0 .5];
%     title(strcat('IC50 MGMT\_ ',fMGMT))
% end
% if ist_survcurv_AUC_figcon==1
%     figure(ist_survcurv_AUC_fignumb)
%     clf
%     h =histogram(survcurv_AUC_vec,NumBins);
%     for i=1:NumBins %find the bin of original patient
%         if origi_survcurv_AUC>h.BinEdges(i) && origi_survcurv_AUC<h.BinEdges(i+1)
%             orig_bin=i;
%         end
%     end
%     b = bar(1:NumBins,h.Values);%color the original patient bin differently
%     b.FaceColor = 'flat';
%     b.CData(orig_bin,:) = [.5 0 .5];
%     title(strcat('Surv. AUC MGMT\_ ',fMGMT))
% end



VariableNames_dataset={'pT','pT2','k_addO','k_addN','k_CyA','K_cdc25','MGMT0','k_BER','k_MMR','k_DSBO','k_DSBN','k_HR','kf_ATR','k_ATR','K_add','kf_Chk1','k_Chk1','kd_pChk1','Cdc250','k_cdc25','kf_p53','k_p53','kf_Mdm2','K_p53','k_apop','upAsy','tED50','sness'};
dataset_tab=array2table(dataset,'VariableNames',VariableNames_dataset);
writetable(dataset_tab,strcat(Results_dir,'/dataset_MGMT_',fMGMT,'.csv'));

surv_curvm_tab=array2table(surv_curvm_mat);
writetable(surv_curvm_tab,strcat(Results_dir,'/surv_curvm_mat_MGMT_',fMGMT,'.csv'));

survcurv_AUC_tab=array2table(survcurv_AUC_vec,'VariableNames',{'surv curv AUC'});
writetable(survcurv_AUC_tab,strcat(Results_dir,'/survcurv_AUC_vec_MGMT_',fMGMT,'.csv'));

end

