function plot_setting_cellpop(plot_dir,Inhib_name_mat_plot,inhib_indx_mat,coeff1_mat,TMZout0_surv,tm_cell_tot,um_cell_tot,tcellpopm_cell_tot,cellpopm_cell_tot)

numb_comptime1=5;
n_p53int=2;
upAsy=0.5356755029;
sness=0.0068128158;
tED50=274.1082210044;

TMZout0_surv_size=length(TMZout0_surv);
inhib_comb_numb=size(inhib_indx_mat,1);%number of drug combinations to simulate
fig_numb=1000;
for inhib_comb=1:inhib_comb_numb
    empl_inhib_indx=inhib_indx_mat(inhib_comb,:);
    empl_inhib_name=Inhib_name_mat_plot(empl_inhib_indx+1)';
    
    tm_cell_mat=tm_cell_tot{inhib_comb};
    um_cell_mat=um_cell_tot{inhib_comb};
    tcellpopm_cell_mat=tcellpopm_cell_tot{inhib_comb};
    cellpopm_cell_mat=cellpopm_cell_tot{inhib_comb};
    
    for i=1:size(tm_cell_mat,1)
        for j=1:size(um_cell_mat,2)
            inhib_level=coeff1_mat(i,j);
            tm_cell=tm_cell_mat{i,j};
            um_cell=um_cell_mat{i,j};
            tcellpopm_cell=tcellpopm_cell_mat{i,j};
            cellpopm_cell=cellpopm_cell_mat{i,j};
            for index=1:TMZout0_surv_size
                plot_cell_pop(plot_dir,empl_inhib_name,inhib_level,144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,index,TMZout0_surv(index),'m',0,fig_numb)
            end
            fig_numb=fig_numb+1;
            for index=TMZout0_surv_size+1:2*TMZout0_surv_size
                plot_cell_pop(plot_dir,empl_inhib_name,inhib_level,144,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,1024,n_p53int,upAsy,sness,tED50,index,TMZout0_surv(index-TMZout0_surv_size),'p',0,fig_numb)
            end
            fig_numb=fig_numb+1;

        end
    end
end



end

