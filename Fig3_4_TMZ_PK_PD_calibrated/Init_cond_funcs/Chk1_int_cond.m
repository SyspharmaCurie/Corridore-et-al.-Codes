function [Chk10_Jack_MGMT_M,Chk10_Jack_MGMT_P,Chk10_Jack_inhATR_MGMT_M,Chk10_Jack_inhATR_MGMT_P,...
    Chk10_Aas,Chk10_He_Ka_MGMT_M,Chk10_He_Ka_MGMT_P] = Chk1_int_cond(Chk1_Jack_MGMT_M_norm,Chk1_Jack_MGMT_P_norm,Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,Chk10)
%Jack MGMT-
Chk10_Jack_MGMT_M=sum(Chk1_Jack_MGMT_M_norm(1:3))/3;%==Chk10
%Jack MGMT+
Chk10_Jack_MGMT_P=sum(Chk1_Jack_MGMT_P_norm(1:3))/3;
%Jack inhibited ATR MGMT-
Chk10_Jack_inhATR_MGMT_M=Chk10;
%Jack inhibited ATR MGMT+
Chk10_Jack_inhATR_MGMT_P=Chk1_Jack_inhATR_TMZVXcon_MGMT_P_norm;
%Aaslan
Chk10_Aas=Chk10;
%%He & Kaina MGMT-
Chk10_He_Ka_MGMT_M=Chk10;
%He & Kaina MGMT+
Chk10_He_Ka_MGMT_P=Chk10_Jack_MGMT_P;
end

