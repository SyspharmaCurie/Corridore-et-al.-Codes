function plot_cell_pop(plot_dir,empl_inhib_name,inhib_level,h,numb_comptime1,tm_cell,um_cell,tcellpopm_cell,cellpopm_cell,TMZout0_MAX,n_p53int,upAsy,sness,tED50,sim_n,TMZ_dose,MGMT,VX,fignumb)


[t_p53_vec,p53_vec]= cell_pop_p53vec(h,numb_comptime1,tm_cell{sim_n},um_cell{sim_n});

tDMSO_TMZ_pop=tcellpopm_cell{sim_n};

norm_pop=cellpopm_cell{sim_n};


p53_integr_vec=cumtrapz(t_p53_vec,p53_vec) ;
logistic_f_vec=cell_pop_logistic_f(t_p53_vec,upAsy,sness,tED50);
int_p53_Hill_vec=cumtrapz(t_p53_vec,p53_vec).^n_p53int./(cumtrapz(t_p53_vec,p53_vec).^n_p53int+cell_pop_logistic_f(t_p53_vec,upAsy,sness,tED50).^n_p53int);

color_mat = color_TMZVXdef(1,MGMT,TMZ_dose,TMZout0_MAX,VX);

figure(fignumb)
set(gca,'fontweight','bold','FontSize',12,'LineWidth',3)

subplot(2,2,1)
plot(t_p53_vec,p53_vec,'color',color_mat(1,:),'LineWidth',3)
hold on
xlabel('Time (h)')
ylabel('p53');
set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
box off

subplot(2,2,2)
plot(t_p53_vec,p53_integr_vec,'color',color_mat(1,:),'LineWidth',2)
hold on
plot(t_p53_vec,logistic_f_vec,'g','LineWidth',2)
xlabel('Time (h)')
ylabel('\int p53');
set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
box off

subplot(2,2,3)
plot(t_p53_vec,int_p53_Hill_vec,'color',color_mat(1,:),'LineWidth',2)
hold on
xlabel('Time (h)')
ylabel('hill func');
ylim([0 1])
set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
box off

subplot(2,2,4)
plot(tDMSO_TMZ_pop,norm_pop,'color',color_mat(1,:),'LineWidth',2)
hold on
xlabel('Time (h)')
ylabel('N(norm)');
ylim([0 100])
set(gca,'fontweight','bold','FontSize',14,'LineWidth',3)
box off


    
filename=strcat(plot_dir,'/Cellpop_MGMT_',MGMT,'_',string(empl_inhib_name),'_',string(inhib_level),'inhib_PK.png');
saveas(gcf, filename);
   
end

