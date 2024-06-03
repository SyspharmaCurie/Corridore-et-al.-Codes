function plot_setting_PKPD(plot_dir,Inhib_name_mat_plot,inhib_indx_mat,coeff1_mat,tm_cell_tot,um_cell_tot,TMZout0_surv)


inhib_comb_numb=size(inhib_indx_mat,1);%number of drug combinations to simulate

TMZout0_surv_size=length(TMZout0_surv);
for n=1:TMZout0_surv_size
    surv_MGMT_M(n)='m';
    surv_MGMT_P(n)='p';
end

for inhib_comb=1:inhib_comb_numb
    empl_inhib_indx=inhib_indx_mat(inhib_comb,:);
    empl_inhib_name=Inhib_name_mat_plot(empl_inhib_indx+1)';
    
    tm_cell_mat=tm_cell_tot{inhib_comb};
    um_cell_mat=um_cell_tot{inhib_comb};
    
    for i=1:size(tm_cell_mat,1)
        for j=1:size(um_cell_mat,2)
            inhib_level=coeff1_mat(i,j);
            tm_cell=tm_cell_mat{i,j};
            um_cell=um_cell_mat{i,j};
            tm_cell_MGMT_M=tm_cell(1:TMZout0_surv_size);
            um_cell_MGMT_M=um_cell(1:TMZout0_surv_size);
            tm_cell_MGMT_P=tm_cell(TMZout0_surv_size+1:end);
            um_cell_MGMT_P=um_cell(TMZout0_surv_size+1:end);

            plot_PK(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_M,um_cell_MGMT_M,surv_MGMT_M,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'M')
            plot_PD_adducts(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_M,um_cell_MGMT_M,surv_MGMT_M,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'M')
            plot_PD_ATRChk1Cellcycle(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_M,um_cell_MGMT_M,surv_MGMT_M,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'M') 
            plot_PD_p53Mdm2(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_M,um_cell_MGMT_M,surv_MGMT_M,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'M')

            plot_PK(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_P,um_cell_MGMT_P,surv_MGMT_P,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'P')
            plot_PD_adducts(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_P,um_cell_MGMT_P,surv_MGMT_P,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'P')
            plot_PD_ATRChk1Cellcycle(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_P,um_cell_MGMT_P,surv_MGMT_P,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'P') 
            plot_PD_p53Mdm2(1,plot_dir,empl_inhib_name,inhib_level,tm_cell_MGMT_P,um_cell_MGMT_P,surv_MGMT_P,TMZout0_surv,max(TMZout0_surv),zeros(1,TMZout0_surv_size),'P')

        end
    end
end
end

