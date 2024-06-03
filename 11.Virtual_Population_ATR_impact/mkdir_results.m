function Results_dir=mkdir_results()

formatOut = 'yyyy-mm-dd_HH.MM.SS';
time = datestr(now,formatOut);

Results_dir=strcat('Results/Results_',time);
if ~exist(Results_dir,'dir')
    mkdir(Results_dir);
end

end

