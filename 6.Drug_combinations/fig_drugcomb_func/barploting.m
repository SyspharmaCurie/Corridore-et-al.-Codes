function barploting(plot_dir,Inhi_name_mat,inhib_indx_mat_MGMT_M,result_MGMT_M,inhib_indx_mat_MGMT_P,result_MGMT_P,ylabel_str)


inhib_comb_numb_MGMT_M=size(inhib_indx_mat_MGMT_M,1);%number of drug combinations to simulate
inhib_comb_numb_MGMT_P=size(inhib_indx_mat_MGMT_P,1);%number of drug combinations to simulate
empl_inhib_numb=size(inhib_indx_mat_MGMT_M,2);%number of drug composing the combination

MGMT_M_filename=strcat(plot_dir,"/Barplot_MGMT_M.fig");
MGMT_P_filename=strcat(plot_dir,"/Barplot_MGMT_P.fig");

[Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
color_MGMT_M=color_conv_an_rgb(Okabe_Ito{5});
color_MGMT_P=color_conv_an_rgb(Tol_light{4});

%%%Plot
figure
bar(result_MGMT_M,'FaceColor',color_MGMT_M);
if empl_inhib_numb==1
    set(gca,'xtick',1:inhib_comb_numb_MGMT_M,'xticklabel',Inhi_name_mat(inhib_indx_mat_MGMT_M+1),'XTickLabelRotation',75);
elseif empl_inhib_numb==2
    set(gca,'xtick',1:inhib_comb_numb_MGMT_M,'xticklabel',strcat(Inhi_name_mat(inhib_indx_mat_MGMT_M(:,1)+1),' + ',Inhi_name_mat(inhib_indx_mat_MGMT_M(:,2)+1)),'XTickLabelRotation',75);
end
title('MGMT -');
xlabel('Inhibitor of...');
ylabel(ylabel_str);
xlim([0,inhib_comb_numb_MGMT_M+1]);
ylim([0,25]);
set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
box off
savefig(gcf, MGMT_M_filename);

figure
bar(result_MGMT_P,'FaceColor',color_MGMT_P);
if empl_inhib_numb==1
    set(gca,'xtick',1:inhib_comb_numb_MGMT_P,'xticklabel',Inhi_name_mat(inhib_indx_mat_MGMT_P(:,1)+1),'XTickLabelRotation',75)
elseif empl_inhib_numb==2
    set(gca,'xtick',1:inhib_comb_numb_MGMT_P,'xticklabel',strcat(Inhi_name_mat(inhib_indx_mat_MGMT_P(:,1)+1),' + ',Inhi_name_mat(inhib_indx_mat_MGMT_P(:,2)+1)),'XTickLabelRotation',75,'FontSize', 16)
end
title('MGMT +');
xlabel('Inhibitor  of...')
ylabel(ylabel_str)
xlim([0,inhib_comb_numb_MGMT_P+1])
ylim([0,25]);
set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
box off
savefig(gcf, MGMT_P_filename);



end