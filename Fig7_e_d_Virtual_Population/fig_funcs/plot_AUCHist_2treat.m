function plot_AUCHist_2treat(output1_vec,output2_vec,origi_output1_MGMT_M,origi_output1_MGMT_P,MGMT,output_type,treat_numb,ist_figcon,ist_fignumb)
if ist_figcon==1
    [Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
    if MGMT=='m'
        fMGMT=' MGMT\_M';
    elseif MGMT=='p'
        fMGMT=' MGMT\_P';
    elseif MGMT=='a'
        fMGMT='all patients';
    end
    if output_type=='A'
        foutput_type='Surv. AUC';
    elseif output_type=='I'
        foutput_type='IC50';
    end

    orig_color_MGMT_M=color_conv_an_rgb(Okabe_Ito{2});%[0, 0.447058823529412, 0.698039215686274];
    fMGMT_orig_MGMT_M=' MGMT\_M';

    orig_color_MGMT_P=[0.933333333333333,   0.400000000000000,   0.466666666666667];
    fMGMT_orig_MGMT_P=' MGMT\_P';

    
    TMZ_alone_color=[0 0 0];
    TMZ_treat_color=color_conv_an_rgb(Tol_bright{2});
    
    if treat_numb==1 % BER inh.
        TMZ_treat_color=color_conv_an_rgb(Okabe_Ito{6});
        treat_legend='TMZ+Nip';
    elseif treat_numb==2 % HR inh.
        TMZ_treat_color=color_conv_an_rgb(Okabe_Ito{2});
        treat_legend='TMZ+RI1';
    elseif treat_numb==3 % HE & BER inh.
        TMZ_treat_color=color_conv_an_rgb(Tol_bright{2});
        treat_legend='TMZ+RI1+Nip';
    end
    NumBins= 60;
    
    figure(ist_fignumb)
    clf
    h_TMZalone = histogram(output1_vec,NumBins);
    hold on
    h_treat = histogram(output2_vec,NumBins);
    
    h_TMZalone.FaceColor = TMZ_alone_color;
    h_treat.FaceColor = TMZ_treat_color;
    ylimm=3.7e4;
    origi_output_MGMT_M_x=origi_output1_MGMT_M*ones(1,100);
    origi_output_MGMT_P_x=origi_output1_MGMT_P*ones(1,100);
    origi_output_y=linspace(0,ylimm*1.1,100);
    plot(origi_output_MGMT_M_x,origi_output_y,'--','color',orig_color_MGMT_M,'LineWidth',3);
    plot(origi_output_MGMT_P_x,origi_output_y,'--','color',orig_color_MGMT_P,'LineWidth',3);
    ylim([0,ylimm])
    title(strcat(foutput_type,fMGMT))
    set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
    legend('TMZ',treat_legend,strcat('Orig TMZ',fMGMT_orig_MGMT_M),strcat('Orig TMZ',fMGMT_orig_MGMT_P))
    xlabel('Cell Survival AUC')
    ylabel('# of patients')
    box off
end
end

