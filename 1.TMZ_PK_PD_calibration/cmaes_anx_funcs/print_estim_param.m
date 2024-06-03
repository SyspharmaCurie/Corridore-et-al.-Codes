function  print_estim_param( Results_dir,param_name, param, param_scale,cost,counter)

% Create folder
paramEst_fold_name=strcat(Results_dir,'/Param_estimation_',string(counter),'/');

if ~exist(paramEst_fold_name,'dir')
    mkdir(paramEst_fold_name);
end

filename_param=strcat(paramEst_fold_name,'estimated_parameters.txt');
fileID_param = fopen(filename_param,'a');

paramcell=num2cell(param);
param_scalecell=num2cell(param_scale);

param_toprint=[param_name(:),paramcell(:)].';
param_scale_toprint=[param_name(:),param_scalecell(:)].';
 
formatSpec_param = '%s=%.10f;\n';
formatSpec_param_scale= '%s(norm)=%.5f;\n';
formatSpec_cost= 'cost=%.10f;\n';
%print on file
fprintf(fileID_param,formatSpec_param_scale,param_scale_toprint{:});
fprintf(fileID_param,'\n%%%%%%%%%%%%%%%%%%\n\n');
fprintf(fileID_param,formatSpec_param,param_toprint{:});
fprintf(fileID_param,'\n%%%%%%%%%%%%%%%%%%\n\n');
fprintf(fileID_param,formatSpec_cost,cost);
fprintf(fileID_param,'\n%%%%%%%%%%%%%%%%%%\n\n');
fclose(fileID_param);

end

