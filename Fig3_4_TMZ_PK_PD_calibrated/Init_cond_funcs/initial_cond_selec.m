function [param0_scale_mat,int_cond_numb] = initial_cond_selec(param_numb)

discr_points=[0.25 0.5 0.75];
int_cond_numb=3;


param0_scale_mat=zeros(param_numb,int_cond_numb);

param0_scale_mat(:,:)=discr_points(randi(length(discr_points),param_numb,int_cond_numb));


end

