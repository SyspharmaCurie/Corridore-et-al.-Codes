   function [] = plot_paper_temDyn_data(fig_num,data_mat,MGMT,TMZ,gen_subplot_vec)

dataset_num=size(data_mat,2)/2;
color_mat = color_paper_temDyn(dataset_num,MGMT,TMZ);


    figure(fig_num)
    for n=1:dataset_num
        subplot(4,4,gen_subplot_vec(n))
        hold on
        if TMZ==12.5
            scatter(data_mat(:,2*n-1),1e3*data_mat(:,2*n),80,'filled','MarkerFaceColor',color_mat(n,:))
        else
            scatter(data_mat(:,2*n-1),1e3*data_mat(:,2*n),80,'filled',"diamond",'MarkerFaceColor',color_mat(n,:))
        end
        box off
    end


end
