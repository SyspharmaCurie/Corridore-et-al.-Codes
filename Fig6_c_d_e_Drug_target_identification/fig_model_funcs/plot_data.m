   function plot_data(fig_num,genfig_con,data_mat,MGMT,TMZ,TMZout0_MAX,VX,figure_type,gen_subplot_vec)

dataset_num=size(data_mat,2)/2;
color_mat = color_TMZVXdef(dataset_num,MGMT,TMZ,TMZout0_MAX,VX);

switch figure_type
    case 'pk'
        gen_subplot_lin=3;
        gen_subplot_col=3;
    case 'add'
        gen_subplot_lin=3;
        gen_subplot_col=3;
    case 'atr'
        gen_subplot_lin=3;
        gen_subplot_col=2;
    case 'p53'
        gen_subplot_lin=2;
        gen_subplot_col=2;
end

if genfig_con==1
    figure(fig_num)
    for n=1:dataset_num
        subplot(gen_subplot_lin,gen_subplot_col,gen_subplot_vec(n))
        hold on
%         color_mat(n,4)
        scatter(data_mat(:,2*n-1),1e3*data_mat(:,2*n),80,'filled','MarkerFaceColor',color_mat(n,1:3),'MarkerEdgeColor',[0 0 0],'MarkerFaceAlpha',color_mat(n,4))
        box off
    end
 
end

end
