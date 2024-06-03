function [y_kd_pATR_pred] = comp_lin_regr_K_add_kd_pATR(x_K_add)
%
b=[0.0128499997477;-122.2547474395736];
X = [ones(length(x_K_add),1) x_K_add];
y_kd_pATR_pred=X*b;

end
