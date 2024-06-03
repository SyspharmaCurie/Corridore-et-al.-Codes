function dataset_checking(dataset_MGMT_M,dataset_MGMT_P)


dataset_MGMT_M_min=min(dataset_MGMT_M);
dataset_MGMT_P_min=min(dataset_MGMT_P);
dataset_MGMT_M_max=max(dataset_MGMT_M);
dataset_MGMT_P_max=max(dataset_MGMT_P);
if min(dataset_MGMT_M_min)<0
    disp("******** Warning message ********")
    disp("dataset_MGMT_M_min<0")
end
if min(dataset_MGMT_P_min)<0
    disp("******** Warning message ********")
    disp("dataset_MGMT_P_min<0")
end
if min(dataset_MGMT_M_max)>1e9
    disp("******** Warning message ********")
    disp("dataset_MGMT_M_max too large")
end
if min(dataset_MGMT_P_max)>1e9
    disp("******** Warning message ********")
    disp("dataset_MGMT_P_max too large")
end


end

