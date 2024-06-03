function [y_k_MGMT_pred] = comp_lin_regr_MGMT_P0_k_MGMT(x_MGMT_P0)
%
b=[136.9407187575450;-40.1812470133761];
X = [ones(length(x_MGMT_P0),1) x_MGMT_P0];
y_k_MGMT_pred=X*b;

end
