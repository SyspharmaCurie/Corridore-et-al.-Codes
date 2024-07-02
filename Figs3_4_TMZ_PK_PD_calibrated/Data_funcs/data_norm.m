function [Chk1_Jack_MGMT_M_norm,Chk1_Jack_MGMT_P_norm,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Chk1_Jack_inhATR_MGMT_M_norm,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk1_Jack_inhATR_VXcon_MGMT_P_norm,Chk1_Jack_inhATR_MGMT_P_norm,...
          cdc25c_Aas_norm] = data_norm(Chk10_MGMT_M,Chk10_MGMT_P,Chk1_Jack_MGMT_M,Chk1_Jack_MGMT_P,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_M,Chk1_Jack_inhATR_VXcon_MGMT_M,Chk1_Jack_inhATR_MGMT_M,...
          Chk1_Jack_inhATR_TMZVXcon_MGMT_P,Chk1_Jack_inhATR_VXcon_MGMT_P,Chk1_Jack_inhATR_MGMT_P,...
          Cdc250,cdc25c_Aas)


%%%%Jackson 2019
%pChk1_Jackson_MGMT_P, pChk1_Jackson_MGMT_M normalization inside the cost function and before plot function
% factor_Chk1_Jack=4*Chk10/(Chk1_Jack_MGMT_M(1)+Chk1_Jack_MGMT_M(2)+Chk1_Jack_MGMT_M(3)+Chk1_Jack_MGMT_M(4));
factor_Chk1_Jack_MGMT_M=3*Chk10_MGMT_M/(sum(Chk1_Jack_MGMT_M(1:3)));
Chk1_Jack_MGMT_M_norm=Chk1_Jack_MGMT_M*factor_Chk1_Jack_MGMT_M;
factor_Chk1_Jack_MGMT_P=3*Chk10_MGMT_P/(sum(Chk1_Jack_MGMT_P(1:3)));
Chk1_Jack_MGMT_P_norm=Chk1_Jack_MGMT_P*factor_Chk1_Jack_MGMT_P;

%%%%Jackson 2019 inihibited ATR
%pChk1_Jack_inhATR_M  and pChk1_Jack_inhATR_P normalization inside the cost function and before plot function
factor_Chk1_Jack_inhATR=Chk10_MGMT_M/(Chk1_Jack_inhATR_TMZVXcon_MGMT_M);%Normalization with the value of MGMT- because greater, then reduce the measurement distorisions
Chk1_Jack_inhATR_TMZVXcon_MGMT_M_norm=Chk1_Jack_inhATR_TMZVXcon_MGMT_M*factor_Chk1_Jack_inhATR;
Chk1_Jack_inhATR_VXcon_MGMT_M_norm=Chk1_Jack_inhATR_VXcon_MGMT_M*factor_Chk1_Jack_inhATR;
Chk1_Jack_inhATR_MGMT_M_norm=Chk1_Jack_inhATR_MGMT_M*factor_Chk1_Jack_inhATR;

Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm=Chk1_Jack_inhATR_TMZVXcon_MGMT_P*factor_Chk1_Jack_inhATR;
Chk1_Jack_inhATR_VXcon_MGMT_P_norm=Chk1_Jack_inhATR_VXcon_MGMT_P*factor_Chk1_Jack_inhATR;
Chk1_Jack_inhATR_MGMT_P_norm=Chk1_Jack_inhATR_MGMT_P*factor_Chk1_Jack_inhATR;

%%%%Aasland 2020
factor_cdc25c_Aas=Cdc250/cdc25c_Aas(1);
cdc25c_Aas_norm=cdc25c_Aas*factor_cdc25c_Aas;

end

