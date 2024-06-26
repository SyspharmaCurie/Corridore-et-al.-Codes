function plot_setting_viab(TMZ_surv_Verre_TMZalone_MGMT_M,surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...data
    TMZ_surv_Verre_TMZalone_MGMT_P,surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    TMZ_surv_Verre_TMZNip_MGMT_M,surv_mean_Verre_TMZNip_MGMT_M,surv_stddev_Verre_TMZNip_MGMT_M,...
    TMZ_surv_Verre_TMZNip_MGMT_P,surv_mean_Verre_TMZNip_MGMT_P,surv_stddev_Verre_TMZNip_MGMT_P,...
    TMZ_surv_Verre_TMZRI1_MGMT_M,surv_mean_Verre_TMZRI1_MGMT_M,surv_stddev_Verre_TMZRI1_MGMT_M,...
    TMZ_surv_Verre_TMZRI1_MGMT_P,surv_mean_Verre_TMZRI1_MGMT_P,surv_stddev_Verre_TMZRI1_MGMT_P,...
    TMZ_surv_Verre_TMZRI1Nip_MGMT_M,surv_mean_Verre_TMZRI1Nip_MGMT_M,surv_stddev_Verre_TMZRI1Nip_MGMT_M,...
    TMZ_surv_Verre_TMZRI1Nip_MGMT_P,surv_mean_Verre_TMZRI1Nip_MGMT_P,surv_stddev_Verre_TMZRI1Nip_MGMT_P,...
    TMZout0_surv_Verre_MGMT_M,TMZalone_surv_curvm_MGMT_M,TMZNip_surv_curvm_MGMT_M,TMZRI1_surv_curvm_MGMT_M,TMZRI1Nip_surv_curvm_MGMT_M,...simulations
    TMZout0_surv_Verre_MGMT_P,TMZalone_surv_curvm_MGMT_P,TMZNip_surv_curvm_MGMT_P,TMZRI1_surv_curvm_MGMT_P,TMZRI1Nip_surv_curvm_MGMT_P,...
    Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb,...figure control
    Verre_surv_TMZNip_survcurv_fig,Verre_surv_TMZNip_survcurv_fignumb,...
    Verre_surv_TMZRI1_survcurv_fig,Verre_surv_TMZRI1_survcurv_fignumb,...
    Verre_surv_TMZRI1Nip_survcurv_fig,Verre_surv_TMZRI1Nip_survcurv_fignumb,...
    Verre_surv_survcurv_fig,Verre_surv_survcurv_fignumb...
    )

%% Maite Verreault Simulations Cell TMZ survival (TMZ alone)
TMZalone_surv_curvm=[TMZalone_surv_curvm_MGMT_M TMZalone_surv_curvm_MGMT_P];
TMZout0_surv_Verre=[TMZout0_surv_Verre_MGMT_M' TMZout0_surv_Verre_MGMT_P'];

TMZdata_surv_Verre_TMZalone=[TMZ_surv_Verre_TMZalone_MGMT_M' TMZ_surv_Verre_TMZalone_MGMT_P'];
surv_mean_Verre_TMZalone=[surv_mean_Verre_TMZalone_MGMT_M' surv_mean_Verre_TMZalone_MGMT_P'];
surv_stddev_Verre_TMZalone=[surv_stddev_Verre_TMZalone_MGMT_M' surv_stddev_Verre_TMZalone_MGMT_P'];
surv_time_Verre=[144 144];

plot_viab(Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb,...figure control
    TMZout0_surv_Verre,TMZalone_surv_curvm,surv_time_Verre,'mp',...simulations
    's')
plot_viab_data(Verre_surv_TMZalone_survcurv_fig,Verre_surv_TMZalone_survcurv_fignumb,...figure control
    TMZdata_surv_Verre_TMZalone,surv_mean_Verre_TMZalone,surv_stddev_Verre_TMZalone,surv_time_Verre,'mp'...data
    )

%% Maite Verreault Simulations Cell TMZ survival (TMZ + Nip)
TMZNip_surv_curvm=[TMZNip_surv_curvm_MGMT_M TMZNip_surv_curvm_MGMT_P];
TMZout0_surv_Verre=[TMZout0_surv_Verre_MGMT_M' TMZout0_surv_Verre_MGMT_P'];
 
TMZdata_surv_Verre_TMZNip=[TMZ_surv_Verre_TMZNip_MGMT_M' TMZ_surv_Verre_TMZNip_MGMT_P'];
surv_mean_Verre_TMZNip=[surv_mean_Verre_TMZNip_MGMT_M' surv_mean_Verre_TMZNip_MGMT_P'];
surv_stddev_Verre_TMZNip=[surv_stddev_Verre_TMZNip_MGMT_M' surv_stddev_Verre_TMZNip_MGMT_P'];
surv_time_Verre=[144 144];
 
plot_viab(Verre_surv_TMZNip_survcurv_fig,Verre_surv_TMZNip_survcurv_fignumb,...figure control
    TMZout0_surv_Verre,TMZNip_surv_curvm,surv_time_Verre,'mp',...simulations
    's')
plot_viab_data(Verre_surv_TMZNip_survcurv_fig,Verre_surv_TMZNip_survcurv_fignumb,...figure control
    TMZdata_surv_Verre_TMZNip,surv_mean_Verre_TMZNip,surv_stddev_Verre_TMZNip,surv_time_Verre,'mp'...data
    )

%% Maite Verreault Simulations Cell TMZ survival (TMZ + RI1)
TMZRI1_surv_curvm=[TMZRI1_surv_curvm_MGMT_M TMZRI1_surv_curvm_MGMT_P];
TMZout0_surv_Verre=[TMZout0_surv_Verre_MGMT_M' TMZout0_surv_Verre_MGMT_P'];
 
TMZdata_surv_Verre_TMZRI1=[TMZ_surv_Verre_TMZRI1_MGMT_M' TMZ_surv_Verre_TMZRI1_MGMT_P'];
surv_mean_Verre_TMZRI1=[surv_mean_Verre_TMZRI1_MGMT_M' surv_mean_Verre_TMZRI1_MGMT_P'];
surv_stddev_Verre_TMZRI1=[surv_stddev_Verre_TMZRI1_MGMT_M' surv_stddev_Verre_TMZRI1_MGMT_P'];
surv_time_Verre=[144 144];
 
plot_viab(Verre_surv_TMZRI1_survcurv_fig,Verre_surv_TMZRI1_survcurv_fignumb,...figure control
    TMZout0_surv_Verre,TMZRI1_surv_curvm,surv_time_Verre,'mp',...simulations
    's')
plot_viab_data(Verre_surv_TMZRI1_survcurv_fig,Verre_surv_TMZRI1_survcurv_fignumb,...figure control
    TMZdata_surv_Verre_TMZRI1,surv_mean_Verre_TMZRI1,surv_stddev_Verre_TMZRI1,surv_time_Verre,'mp'...data
    )

%% Maite Verreault Simulations Cell TMZ survival (TMZ + RI1 + Nip)
TMZRI1Nip_surv_curvm=[TMZRI1Nip_surv_curvm_MGMT_M TMZRI1Nip_surv_curvm_MGMT_P];
TMZout0_surv_Verre=[TMZout0_surv_Verre_MGMT_M' TMZout0_surv_Verre_MGMT_P'];
 
TMZdata_surv_Verre_TMZRI1Nip=[TMZ_surv_Verre_TMZRI1Nip_MGMT_M' TMZ_surv_Verre_TMZRI1Nip_MGMT_P'];
surv_mean_Verre_TMZRI1Nip=[surv_mean_Verre_TMZRI1Nip_MGMT_M' surv_mean_Verre_TMZRI1Nip_MGMT_P'];
surv_stddev_Verre_TMZRI1Nip=[surv_stddev_Verre_TMZRI1Nip_MGMT_M' surv_stddev_Verre_TMZRI1Nip_MGMT_P'];
surv_time_Verre=[144 144];
 
plot_viab(Verre_surv_TMZRI1Nip_survcurv_fig,Verre_surv_TMZRI1Nip_survcurv_fignumb,...figure control
    TMZout0_surv_Verre,TMZRI1Nip_surv_curvm,surv_time_Verre,'mp',...simulations
    's')
plot_viab_data(Verre_surv_TMZRI1Nip_survcurv_fig,Verre_surv_TMZRI1Nip_survcurv_fignumb,...figure control
    TMZdata_surv_Verre_TMZRI1Nip,surv_mean_Verre_TMZRI1Nip,surv_stddev_Verre_TMZRI1Nip,surv_time_Verre,'mp'...data
    )

%% Maite Verreault Survical curves (all the results)
[Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();
TMZ_alone_color=[0 0 0];
TMZ_Nip_color=color_conv_an_rgb(Okabe_Ito{6});
TMZ_RI1_color=color_conv_an_rgb(Okabe_Ito{2});
TMZ_RI1Nip_color=color_conv_an_rgb(Tol_bright{2});

if Verre_surv_survcurv_fig==1
    %MGMT-
    figure(Verre_surv_survcurv_fignumb+1)
    clf     
    hAx=axes;      
    errorbar(TMZ_surv_Verre_TMZalone_MGMT_M,surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,'o','Color',TMZ_alone_color,'MarkerFaceColor', TMZ_alone_color,'MarkerSize',10,'LineWidth',2.5)
    hold on
    errorbar(TMZ_surv_Verre_TMZNip_MGMT_M,surv_mean_Verre_TMZNip_MGMT_M,surv_stddev_Verre_TMZNip_MGMT_M,'o','Color',TMZ_Nip_color,'MarkerFaceColor', TMZ_Nip_color,'MarkerSize',10,'LineWidth',2.5)
    errorbar(TMZ_surv_Verre_TMZRI1_MGMT_M,surv_mean_Verre_TMZRI1_MGMT_M,surv_stddev_Verre_TMZRI1_MGMT_M,'o','Color',TMZ_RI1_color,'MarkerFaceColor', TMZ_RI1_color,'MarkerSize',10,'LineWidth',2.5)
    errorbar(TMZ_surv_Verre_TMZRI1Nip_MGMT_M,surv_mean_Verre_TMZRI1Nip_MGMT_M,surv_stddev_Verre_TMZRI1Nip_MGMT_M,'o','Color',TMZ_RI1Nip_color,'MarkerFaceColor', TMZ_RI1Nip_color,'MarkerSize',10,'LineWidth',2.5)
    semilogx(TMZ_surv_Verre_TMZalone_MGMT_M,TMZalone_surv_curvm_MGMT_M,'-','Color',TMZ_alone_color,'LineWidth',3)
    semilogx(TMZ_surv_Verre_TMZNip_MGMT_M,TMZNip_surv_curvm_MGMT_M,'-','Color',TMZ_Nip_color,'LineWidth',3)
    semilogx(TMZ_surv_Verre_TMZRI1_MGMT_M,TMZRI1_surv_curvm_MGMT_M,'-','Color',TMZ_RI1_color,'LineWidth',3)
    semilogx(TMZ_surv_Verre_TMZRI1Nip_MGMT_M,TMZRI1Nip_surv_curvm_MGMT_M,'-','Color',TMZ_RI1Nip_color,'LineWidth',3)
    hAx.XScale='log';
    xlim([0.1,2e3])
    ylim([-0.5,105])
    xlabel('Temozolomide (\mumol/L)')
    ylabel('Percent survival')
    % yticks([0 1])
    % yticklabels({'Death','Survival'})
    set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
    title('MGMT-')
    legend('TMZ','TMZ+Nip','TMZ+RI1','TMZ+RI1+Nip')
    box off
 
    %MGMT+
    figure(Verre_surv_survcurv_fignumb+2)
    clf           
    hAx=axes;
    errorbar(TMZ_surv_Verre_TMZalone_MGMT_P,surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,'o','Color',TMZ_alone_color,'MarkerFaceColor', TMZ_alone_color,'MarkerSize',10,'LineWidth',2.5)
    hold on
    errorbar(TMZ_surv_Verre_TMZNip_MGMT_P,surv_mean_Verre_TMZNip_MGMT_P,surv_stddev_Verre_TMZNip_MGMT_P,'o','Color',TMZ_Nip_color,'MarkerFaceColor', TMZ_Nip_color,'MarkerSize',10,'LineWidth',2.5)
    errorbar(TMZ_surv_Verre_TMZRI1_MGMT_P,surv_mean_Verre_TMZRI1_MGMT_P,surv_stddev_Verre_TMZRI1_MGMT_P,'o','Color',TMZ_RI1_color,'MarkerFaceColor', TMZ_RI1_color,'MarkerSize',10,'LineWidth',2.5)
    errorbar(TMZ_surv_Verre_TMZRI1Nip_MGMT_P,surv_mean_Verre_TMZRI1Nip_MGMT_P,surv_stddev_Verre_TMZRI1Nip_MGMT_P,'o','Color',TMZ_RI1Nip_color,'MarkerFaceColor', TMZ_RI1Nip_color,'MarkerSize',10,'LineWidth',2.5)
    semilogx(TMZ_surv_Verre_TMZalone_MGMT_P,TMZalone_surv_curvm_MGMT_P,'-','Color',TMZ_alone_color,'LineWidth',3)
    semilogx(TMZ_surv_Verre_TMZNip_MGMT_P,TMZNip_surv_curvm_MGMT_P,'-','Color',TMZ_Nip_color,'LineWidth',3)
    semilogx(TMZ_surv_Verre_TMZRI1_MGMT_P,TMZRI1_surv_curvm_MGMT_P,'-','Color',TMZ_RI1_color,'LineWidth',3)
    semilogx(TMZ_surv_Verre_TMZRI1Nip_MGMT_P,TMZRI1Nip_surv_curvm_MGMT_P,'-','Color',TMZ_RI1Nip_color,'LineWidth',3)
    hAx.XScale='log';
    hAx.XScale='log';
    xlim([0.1,2e3])
    ylim([-0.5,105])
    xlabel('Temozolomide (\mumol/L)')
    ylabel('Percent survival')
    % yticks([0 1])
    % yticklabels({'Death','Survival'})
    set(gca,'fontweight','bold','FontSize',15,'LineWidth',3)
    title('MGMT+')
    legend('TMZ','TMZ+Nip','TMZ+RI1','TMZ+RI1+Nip')
    box off
end   


end

