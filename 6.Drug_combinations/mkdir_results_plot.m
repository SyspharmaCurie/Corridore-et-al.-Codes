function [plot_dir,plot_dir_cont]=mkdir_results_plot(Results_dir)

plot_dir=strcat(Results_dir,'/','Plot');
plot_dir_cont=exist(plot_dir,'dir');
if ~plot_dir_cont
    mkdir(plot_dir);
end


end