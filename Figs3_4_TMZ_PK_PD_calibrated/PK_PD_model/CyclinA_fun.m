function [ CyA ] = CyclinA_fun(t,cdc25,t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25)

CyA= (M_cc+A_cc*cos(omega_cc*(t-phi_cc+t0_cc))).*(cdc25.^n_cdc25)./(K_cdc25^n_cdc25+cdc25.^n_cdc25);

end

