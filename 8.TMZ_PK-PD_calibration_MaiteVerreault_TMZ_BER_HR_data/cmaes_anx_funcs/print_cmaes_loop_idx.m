function  print_cmaes_loop_idx( Results_dir,counter)

filename=strcat(Results_dir,'/cmaes_loop_idx.csv');
fileID = fopen(filename,'a');
fprintf(fileID,'%i\n',counter);
fclose(fileID);

end

