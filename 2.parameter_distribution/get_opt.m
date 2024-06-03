function [opt_scale_param] = get_opt(code_vers_results_dir,outputs_dir)
opt_scale_param=csvread(strcat(code_vers_results_dir,outputs_dir,'Param_estimation_fin/estimated_scale_parameters.csv'))';
end

