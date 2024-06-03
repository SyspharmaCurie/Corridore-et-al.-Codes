function time_dir=mkdir_results(empl_inhib_numb)

Results_dir=strcat('Results');
if ~exist(Results_dir,'dir')
    mkdir(Results_dir);
end

drug_quantity_dir=strcat(Results_dir,'/',int2str(empl_inhib_numb),'_Drug_comb');
if ~exist(drug_quantity_dir,'dir')
    mkdir(drug_quantity_dir);
end

formatOut = 'yyyy-mm-dd_HH.MM.SS';
time = datestr(now,formatOut);

time_dir=strcat(drug_quantity_dir,'/Results_',time);
if ~exist(time_dir,'dir')
    mkdir(time_dir);
end

end

