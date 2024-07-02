function [all_param,all_param_scale,all_cost,LO_main,UP_main,opt_scale_param] = cmaes_file_selec(outputs_dir,optim_dir,param_num)

sim_num=length(outputs_dir);
all_param=zeros(1,param_num);
all_param_scale=zeros(1,param_num);
all_cost=0;

range_dir = 'Param_estimation_fin/';
opt_param = csvread(strcat('Results/',optim_dir,range_dir,'estimated_parameters.csv'))';
load(strcat('Results/','Multi_init_cond/',outputs_dir(end),range_dir,'estimated_parameters_LO.mat'),'LO');
load(strcat('Results/','Multi_init_cond/',outputs_dir(end),range_dir,'estimated_parameters_UP.mat'),'UP');

LO_main=0.4*opt_param;
UP_main=2*opt_param;

opt_scale_param = scale_to10(opt_param,LO_main,UP_main);

for n=1:sim_num
    load(strcat('Results/','Multi_init_cond/',outputs_dir(n),range_dir,'estimated_parameters_LO.mat'),'LO');
    load(strcat('Results/','Multi_init_cond/',outputs_dir(n),range_dir,'estimated_parameters_UP.mat'),'UP');
    sim_idx_vec=csvread(strcat('Results/','Multi_init_cond/',outputs_dir(n),'/cmaes_loop_idx.csv'))';

    for sim_idx=sim_idx_vec
        [param,param_scale_fin,cost]=cmaes_results_reader('Results/',outputs_dir(n),sim_idx,LO,UP,LO_main,UP_main);
        all_param=[all_param;param];
        all_param_scale=[all_param_scale;param_scale_fin];
        all_cost=[all_cost;cost];
    end

end

%cut the first line, just used for the matrix/vector definition
all_param=all_param(2:end,:);
all_param_scale=all_param_scale(2:end,:);
all_cost=all_cost(2:end,:);


end

