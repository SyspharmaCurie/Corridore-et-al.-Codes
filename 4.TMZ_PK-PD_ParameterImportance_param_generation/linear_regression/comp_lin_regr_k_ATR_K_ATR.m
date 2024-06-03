function [y_K_ATR_pred] = comp_lin_regr_k_ATR_K_ATR(x_k_ATR)
%
b=[0.000054596987388;0.015901910798039];
X = [ones(length(x_k_ATR),1) x_k_ATR];
y_K_ATR_pred=X*b;

end

