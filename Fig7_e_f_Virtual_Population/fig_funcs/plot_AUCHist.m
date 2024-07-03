function plot_AUCHist(output_vec,origi_output,MGMT,output_type,ist_figcon,ist_fignumb,plot_tit)
if ist_figcon==1
    [Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
    figure(ist_fignumb)
    clf
    NumBins= 60;
    hold on
    
    if MGMT=='m'
        fMGMT=' MGMT\_M';
        colr=color_paper_temDyn(1,'m',12.5);
    elseif MGMT=='p'
        fMGMT=' MGMT\_P';
        colr=color_paper_temDyn(1,'p',100);
    elseif MGMT=='a'
        fMGMT=' all patients';
        colr=Tol_light{8};
    end
    if output_type=='A'
        foutput_type='Surv. AUC ';
    elseif output_type=='I'
        foutput_type='IC50 ';
    end
    h =histogram(output_vec,NumBins,'FaceColor',colr);
    set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
    title(strcat(foutput_type,',',plot_tit,fMGMT))
    ylim([0,6500])
    xlabel('diff(TMZ AUC, TMZ+RI1+Nirap AUC)')
    box off
    
end
end

