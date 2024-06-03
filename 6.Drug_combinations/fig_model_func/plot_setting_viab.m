function plot_setting_viab(Inhib_name_mat,inhib_indx_mat,TMZout0_surv,surv_curvm_MGMT_M_tot,surv_curvm_MGMT_P_tot)


inhib_comb_numb=size(inhib_indx_mat,1);%number of drug combinations to simulate
empl_inhib_numb=size(inhib_indx_mat,2);%number of drug composing the combination

survcurv_fignumb=3000;
for inhib_comb=1:inhib_comb_numb
    empl_inhib_indx=inhib_indx_mat(inhib_comb,:);
    if empl_inhib_numb==1
        drug_name1=Inhib_name_mat(empl_inhib_indx(1)+1);
        ttitle=strcat(drug_name1);
    else
        drug_name1=Inhib_name_mat(empl_inhib_indx(1)+1);
        drug_name2=Inhib_name_mat(empl_inhib_indx(2)+1);
        ttitle=strcat(drug_name1,'-',drug_name2);
    end
    
    surv_curvm_MGMT_M_mat=surv_curvm_MGMT_M_tot{inhib_comb};
    surv_curvm_MGMT_P_mat=surv_curvm_MGMT_P_tot{inhib_comb};
    for inhib_lev_i=1:size(surv_curvm_MGMT_M_mat,1)
        for inhib_lev_j=1:size(surv_curvm_MGMT_M_mat,2)
            surv_curvm_MGMT_M(:,inhib_lev_j)=surv_curvm_MGMT_M_mat{inhib_lev_i,inhib_lev_j};
            surv_curvm_MGMT_P(:,inhib_lev_j)=surv_curvm_MGMT_P_mat{inhib_lev_i,inhib_lev_j};

        end

        plot_viab(survcurv_fignumb,...figure control
        TMZout0_surv',surv_curvm_MGMT_M,surv_curvm_MGMT_P,ttitle)
    end
        survcurv_fignumb=survcurv_fignumb+1;
end
end

