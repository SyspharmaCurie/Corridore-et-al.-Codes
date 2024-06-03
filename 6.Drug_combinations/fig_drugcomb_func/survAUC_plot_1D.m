function survAUC_plot_1D(plot_dir,Inhi_name_mat,inhib_indx_mat,coeff1_mat,survAUC_MGMT_M_cell,survAUC_MGMT_P_cell,ylabeltext)


inhib_comb_numb=size(inhib_indx_mat,1);%number of drug combinations to simulate

[Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
color_MGMT_M=[color_conv_an_rgb(Okabe_Ito{2});
              color_conv_an_rgb(Okabe_Ito{3});
              color_conv_an_rgb(Okabe_Ito{5});
              color_conv_an_rgb(Okabe_Ito{8});
              color_conv_an_rgb(Tol_bright{2});
              color_conv_an_rgb(Tol_bright{5});
              color_conv_an_rgb(Tol_muted{4});
              color_conv_an_rgb(Okabe_Ito{2});
              color_conv_an_rgb(Okabe_Ito{3});
              color_conv_an_rgb(Okabe_Ito{5});
              color_conv_an_rgb(Okabe_Ito{8});
              color_conv_an_rgb(Tol_bright{2});
              color_conv_an_rgb(Tol_bright{5});
              color_conv_an_rgb(Tol_muted{4});
              color_conv_an_rgb(Okabe_Ito{2});
              color_conv_an_rgb(Okabe_Ito{3});];
          
color_MGMT_P=[color_conv_an_rgb(Okabe_Ito{1});
              color_conv_an_rgb(Okabe_Ito{4});
              color_conv_an_rgb(Okabe_Ito{6});
              color_conv_an_rgb(Okabe_Ito{7});
              color_conv_an_rgb(Tol_bright{6});
              color_conv_an_rgb(Tol_bright{4});
              color_conv_an_rgb(Tol_bright{1});
              color_conv_an_rgb(Okabe_Ito{1});
              color_conv_an_rgb(Okabe_Ito{4});
              color_conv_an_rgb(Okabe_Ito{6});
              color_conv_an_rgb(Okabe_Ito{7});
              color_conv_an_rgb(Tol_bright{6});
              color_conv_an_rgb(Tol_bright{4});
              color_conv_an_rgb(Tol_bright{1});
              color_conv_an_rgb(Okabe_Ito{1});
              color_conv_an_rgb(Okabe_Ito{4});];


figure('Position',[10,10,1000,1000])
for inhib_comb=1:inhib_comb_numb
    empl_inhib_indx=inhib_indx_mat(inhib_comb,:);
    empl_inhib_name=string(Inhi_name_mat(empl_inhib_indx+1)');
    
    survAUC_MGMT_M_mat=survAUC_MGMT_M_cell{inhib_comb};
    survAUC_MGMT_P_mat=survAUC_MGMT_P_cell{inhib_comb};

    plot(coeff1_mat,survAUC_MGMT_M_mat,'-','Color',color_MGMT_M(inhib_comb,:),'LineWidth',6,'DisplayName', strcat(empl_inhib_name,' (MGMT-)'));
    hold on
    plot(coeff1_mat,survAUC_MGMT_P_mat,'-','Color',color_MGMT_P(inhib_comb,:),'LineWidth',6,'DisplayName', strcat(empl_inhib_name,' (MGMT+)'));
    set(gca,'fontweight','bold','FontSize', 45,'LineWidth',4)
end    
    xlabel('Inhibition level')
    ylabel(ylabeltext)
    xlim([0 1.02])
    xticks([0.25 0.5 0.75 1])
    xticklabels({'25%','50%','75%','100%'})
    box off
%     strcat(legend_text,'MGMT-'),strcat(legend_text,'MGMT+')
    legend('FontSize',20);
    set(gcf,'PaperPositionMode','auto','Visible','on');



    filename=strcat(plot_dir,'/','inhib_lev.png');
    saveas(gcf, filename);

end

