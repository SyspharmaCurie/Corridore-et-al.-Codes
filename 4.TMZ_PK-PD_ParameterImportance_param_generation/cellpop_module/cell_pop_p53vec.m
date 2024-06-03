function [t_vec,p53_vec] = cell_pop_p53vec(qqq,patient_indx,h,numb_comptime1,tm_simn_matrix,um_simn_matrix)

if size(tm_simn_matrix,1)<h*numb_comptime1+1
    patient_indx
    [qqq(1:33)' qqq(34:end)']
end
t_vec=tm_simn_matrix(1:h*numb_comptime1+1);
p53_vec=um_simn_matrix(1:h*numb_comptime1+1,20);

end

