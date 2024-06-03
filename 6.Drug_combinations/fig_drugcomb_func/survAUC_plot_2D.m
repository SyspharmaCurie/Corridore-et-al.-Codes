function survAUC_plot_2D(plot_dir,Inhi_name_mat,inhib_indx_mat,coeff1_mat,coeff2_mat,result_MGMT_M_cell,result_MGMT_P_cell,zlabeltext)

inhib_comb_numb=size(inhib_indx_mat,1);%number of drug combinations to simulate

for inhib_comb=1:inhib_comb_numb
   empl_inhib_indx=inhib_indx_mat(inhib_comb,:);
    drug_name1=Inhi_name_mat(empl_inhib_indx(1)+1);
    drug_name2=Inhi_name_mat(empl_inhib_indx(2)+1);
    if empl_inhib_indx==[0 0]
        xlabeltext=drug_name1;
        ylabeltext=drug_name2;
        MGMT_M_filename=strcat(plot_dir,'/',string(drug_name1),'_MGMT_M.fig');
        MGMT_P_filename=strcat(plot_dir,'/',string(drug_name1),'_MGMT_P.fig');
    else
        xlabeltext=strcat(drug_name1,' inhib.');
        ylabeltext=strcat(drug_name2,' inhib.');
        MGMT_M_filename=strcat(plot_dir,'/',string(drug_name1),'_',string(drug_name2),'_inhib_MGMT_M.fig');
        MGMT_P_filename=strcat(plot_dir,'/',string(drug_name1),'_',string(drug_name2),'_inhib_MGMT_P.fig');
    end

    survAUC_MGMT_M_mat=result_MGMT_M_cell{inhib_comb};
    survAUC_MGMT_P_mat=result_MGMT_P_cell{inhib_comb};
    
%     figure('Position',[10,10,1000,1000])
%     clf
%     colormap(flipud(winter))
%     surf(coeff1_mat,coeff2_mat,survAUC_MGMT_M_mat);
%     set(gca,'fontweight','bold','FontSize', 40,'LineWidth',4)
%     title('MGMT-')
%     xlabel(xlabeltext)
%     ylabel(ylabeltext)
%     zlabel(zlabeltext)
%     xticks([0.25 0.75 1])
%     xticklabels({'25%','75%','100%'})
%     yticks([0.25 0.75 1])
%     yticklabels({'25%','75%','100%'})
% %     zlim([0 IC50_max])
% %     zticks([0 3956 2*3956])
% %     zticklabels({'0','1','2'})
%     set(gcf,'PaperPositionMode','auto','Visible','on');
%     savefig(gcf, MGMT_M_filename);
    
%     figure('Position',[10,10,1000,1000])
%     clf
%     colormap (flipud(autumn))
%     surf(coeff1_mat,coeff2_mat,survAUC_MGMT_P_mat);
%     set(gca,'fontweight','bold','FontSize', 40,'LineWidth',4)
%     title('MGMT+')
%     xlabel(xlabeltext)
%     ylabel(ylabeltext)
%     zlabel(zlabeltext)
%     xticks([0.25 0.75 1])
%     xticklabels({'25%','75%','100%'})
%     yticks([0.25 0.75 1])
%     yticklabels({'25%','75%','100%'})
% %     zlim([0 IC50_max])
% %     zticks([0 3956 2*3956])
% %     zticklabels({'0','1','2'})
%     set(gcf,'PaperPositionMode','auto','Visible','on');
%     savefig(gcf, MGMT_P_filename);


 figure('Position',[10,10,1000,1000])
    clf
    colormap(flipud(summer))
    surf(coeff1_mat,coeff2_mat,survAUC_MGMT_M_mat);
    hold on
    surf(coeff1_mat,coeff2_mat,survAUC_MGMT_P_mat);
    set(gca,'fontweight','bold','FontSize', 40,'LineWidth',4)
    xlabel(xlabeltext)
    ylabel(ylabeltext)
    zlabel(zlabeltext)
    xticks([0.25 0.75 1])
    xticklabels({'25%','75%','100%'})
    yticks([0.25 0.75 1])
    yticklabels({'25%','75%','100%'})
%     zlim([0 IC50_max])
%     zticks([0 3956 2*3956])
%     zticklabels({'0','1','2'})
    colorbar
    set(gcf,'PaperPositionMode','auto','Visible','on');
    savefig(gcf, MGMT_M_filename);
%     
    
    
end

end

