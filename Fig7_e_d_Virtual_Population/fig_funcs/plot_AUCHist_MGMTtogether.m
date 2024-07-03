function plot_AUCHist_MGMTtogether(output_vec_MGMT_M,output_vec_MGMT_P,output_vec_allpat,output_type,ist_figcon,ist_fignumb,plot_tit)
if ist_figcon==1
    [Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
    figure(ist_fignumb)
    clf
    NumBins= 60;
    h_MGMT_allpat =histogram(output_vec_allpat,NumBins,'FaceColor',Tol_light{8});
    hold on
    h_MGMT_M =histogram(output_vec_MGMT_M,NumBins,'FaceColor',color_paper_temDyn(1,'m',12.5));
    h_MGMT_P =histogram(output_vec_MGMT_P,NumBins,'FaceColor',color_paper_temDyn(1,'p',100));
    
    if output_type=='A'
        foutput_type='Surv. AUC ';
    elseif output_type=='I'
        foutput_type='IC50 ';
    end
    set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
    title(strcat(foutput_type,',',plot_tit))
    ylim([0,6500])
    xlabel('AUC Difference')
    ylabel('# of patients')
    legend('all patients','MGMT-','MGMT+')
    box off
    
end
end

