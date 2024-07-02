function [t_vec,p53_vec] = cell_pop_p53vec(h,numb_comptime1,tm_simn_matrix,um_simn_matrix)

t_vec=tm_simn_matrix(1:h*numb_comptime1+1);
p53_vec=um_simn_matrix(1:h*numb_comptime1+1,20);

end

