function [param,param_scale_fin,cost]=cmaes_results_reader(code_vers_results_dir,outputs_dir,sim_idx,LO,UP,LO_main,UP_main)

best_file=strcat(code_vers_results_dir,'Multi_init_cond/',outputs_dir,'cmaes_files/outcmaes',string(sim_idx),'xrecentbest.dat');
outcmaesxrecentbest=importdata(best_file);
cost=outcmaesxrecentbest.data(:,3);
param_scale=outcmaesxrecentbest.data(:,6:end);

param = scale_toLOUP(param_scale,LO,UP);
param_scale_fin = scale_to10(param,LO_main,UP_main);


end

