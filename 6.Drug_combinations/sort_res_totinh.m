function [inhib_indx_mat_sort,res_cell_sort,res_totinh_sort] = ...
    sort_res_totinh(inhib_indx_mat,res_cell,res_totinh)

%sort according the best rest at total inhibition
[res_totinh_sort,I]=sort(res_totinh);
inhib_indx_mat_sort=inhib_indx_mat(I,:);
res_cell_sort=res_cell(I);


end

