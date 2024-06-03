function [y_kp_ser46_pred] = comp_lin_regr_k_ATR_kp_ser46(x_k_ATR)
% linear regression parameters have been computed in "linear regression/lin_Regr_k_HR_kp_ser46.m"
b=[6.8801726966236;-132.3145928788587];
X = [ones(length(x_k_ATR),1) x_k_ATR];
y_kp_ser46_pred=X*b;

end