function  print_param( dir,step,param_name, param, param_scale,cost,LO,UP)

% Create folder
paramEst_fold_name=strcat(dir,'/Param_estimation_fin/');
if ~exist(paramEst_fold_name,'dir')
    mkdir(paramEst_fold_name);
end

%print on file
if step=='i'
    filename_param=strcat(paramEst_fold_name,'init_cond_parameters.txt');
elseif step=='f'
    filename_param=strcat(paramEst_fold_name,'estimated_parameters.txt');
end
fileID_param = fopen(filename_param,'a');

paramcell=num2cell(param);
param_scalecell=num2cell(param_scale);

param_toprint=[param_name(:),paramcell(:)].';
param_scale_toprint=[param_name(:),param_scalecell(:)].';
 
formatSpec_param = '%s=%.10f;\n';
formatSpec_param_scale= '%s(norm)=%.5f;\n';
formatSpec_cost= 'cost=%.10f;\n';
fprintf(fileID_param,formatSpec_param_scale,param_scale_toprint{:});
fprintf(fileID_param,'\n%%%%%%%%%%%%%%%%%%\n\n');
fprintf(fileID_param,formatSpec_param,param_toprint{:});
fprintf(fileID_param,'\n%%%%%%%%%%%%%%%%%%\n\n');
fprintf(fileID_param,formatSpec_cost,cost);
fprintf(fileID_param,'\n%%%%%%%%%%%%%%%%%%\n\n');
fclose(fileID_param);

if step=='f'
    %print on csv file separatelty
    filename_param=strcat(paramEst_fold_name,'estimated_parameters.csv');
    fileID_param = fopen(filename_param,'a');
    fprintf(fileID_param,'%.10f\n',param);
    fclose(fileID_param);
    filename_param_scale=strcat(paramEst_fold_name,'estimated_scale_parameters.csv');
    fileID_param_scale = fopen(filename_param_scale,'a');
    fprintf(fileID_param_scale,'%.10f\n',param_scale);
    fclose(fileID_param_scale);

    % %print on command window
    % fprintf('\n');
    % fprintf(formatSpec_param_scale,param_scale_toprint{:});
    % fprintf('\n%%%%%%%%%%%%%%%%%%\n');
    % fprintf(formatSpec_param,param_toprint{:});
    % fprintf('\n%%%%%%%%%%%%%%%%%%\n');
    % fprintf(formatSpec_cost,cost);
    % fprintf('\n%%%%%%%%%%%%%%%%%%\n');

    %print ranges
    filename_LO=strcat(paramEst_fold_name,'estimated_parameters_LO.mat');
    save(filename_LO,'LO');
    filename_UP=strcat(paramEst_fold_name,'estimated_parameters_UP.mat');
    save(filename_UP,'UP');

end

end

