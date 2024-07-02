function [dudt]=TMZ_PK_PD_ODE(t,v,...
    Vin,Vout,pT,pT2,pA,pA2,dna,kcat,kT0,lambdaT,kM0,lambdaM,pH0,...
    k_addO,kf_MGMT,RNA_MGMT0,kd_MGMT,k_MGMT,...
    omega_cc,t0_cc,M_cc,A_cc,phi_cc,...
    k_GT,k_MMR,k_addEx,k_addN,k_BER,k_DSBO,k_DSBN,k_HR,k_CyA,K_cc,n_cc,kf_ATR,k_ATR,K_add,n_add,kd_ATR,kd_pATR,...
    kf_Chk1,k_Chk1,kd_Chk1,kd_pChk1,kf_cdc25,k_cdc25,kd_cdc25,K_cdc25,n_cdc25,...
    kf_p53,k_p53,n_ATR,K_ATR,kd_p53,kd_p53Mdm2,K_Mdm2,n_Mdm2,kp_ser46,kd_ser46,kt_Mdm2,kt_Mdm2p53,K_p53,n_p53,ktd_Mdm2,kf_Mdm2,kd_Mdm2)

pH_extra=pH0;
pH_intra=pH_extra-0.01;

kTout=kT0*exp(lambdaT*pH_extra);
kMout=kM0*exp(-lambdaM*pH_extra);

kTin=kT0*exp(lambdaT*pH_intra);
kMin=kM0*exp(-lambdaM*pH_intra);

%cyclin A
%  CyA= (M+A*cos(omega*(t-phi+t0)))...
%      *(v(18)^n_cdc25)/(K_cdc25^n_cdc25+v(18)^n_cdc25);

 CyA= CyclinA_fun(t,v(18),t0_cc,M_cc,A_cc,omega_cc,phi_cc,K_cdc25,n_cdc25);

%ODEs
%1-TMZ out
  w(1)= -(pT*v(1)-pT2*v(2))/Vout-kTout*v(1); 
%2-TMZ in
  w(2)= (pT*v(1)-pT2*v(2))/Vin-kTin*v(2);     
%3-MTIC out
  w(3)= kTout*v(1)-kMout*v(3); 
%4-MTIC in
  w(4)= kTin*v(2)-kMin*v(4);
%5-AIC out 
  w(5)= -(pA*v(5)-pA2*v(6))/Vout + kMout*v(3);
%6-AIC in  
  w(6)= (pA*v(5)-pA2*v(6))/Vin + kMin*v(4);
%7-methylating agent (Cation)
  w(7)= kMin*v(4)-(k_addO/2+k_addN)*dna*v(7)-kcat*v(7);

%%%%PD%%%%%%
%8-DNA adduct 06MeG
w(8)= k_addO*dna*v(7)/2-k_MGMT*v(8)*v(9)-k_GT*v(8)*(1+k_CyA*(CyA^n_cc)/(CyA^n_cc+K_cc^n_cc));%only the bases conteining G are targeted, so DNA is divided by 2
% %9-mRNA MGMT
% w(9)= kt_MGMT-ktd_MGMT*v(9);
%9-MGMT
w(9)= kf_MGMT*RNA_MGMT0-kd_MGMT*v(9)-k_MGMT*v(8)*v(9);%RNA_MGMT0 comes from the fact that there was the MGTM RNA equation with steady state value=RNA_MGMT0
%10-G:T
w(10)=k_GT*v(8)*(1+k_CyA*(CyA^n_cc)/(CyA^n_cc+K_cc^n_cc))-k_MMR*v(10);
%11-SSB by MMR
w(11)=k_MMR*v(10)-k_DSBO*v(11)*(1+k_CyA*(CyA^n_cc)/(CyA^n_cc+K_cc^n_cc));
%12-DNA adduct N3MeG N3MeA N7MeG
w(12)=k_addEx+k_addN*dna*v(7)-v(12)*(k_BER+k_DSBN*(1+k_CyA*(CyA^n_cc)/(CyA^n_cc+K_cc^n_cc)));
%13-DSB-(h2ax)gammah2ax
w(13)=(k_DSBO*v(11)+k_DSBN*v(12))*(1+k_CyA*(CyA^n_cc)/(CyA^n_cc+K_cc^n_cc))-k_HR*v(13);
%%%%%%%%%%%%ATR/Chk1
%14-ATR
w(14)=kf_ATR-(k_ATR*(v(13)^n_add)/(v(13)^n_add+K_add^n_add)+kd_ATR)*v(14);
%15-pATR
w(15)=k_ATR*v(14)*(v(13)^n_add)/(v(13)^n_add+K_add^n_add)-kd_pATR*v(15);
%16-Chk1
w(16)=kf_Chk1-k_Chk1*v(16)*v(15)-kd_Chk1*v(16);
%17-pChk1
w(17)=k_Chk1*v(16)*v(15)-kd_pChk1*v(17);
%%%%%%%%%%%%Cdc25
%18-Cdc25
w(18)=kf_cdc25-(k_cdc25*v(17)+kd_cdc25)*v(18);
%%%%%%%%%%%%p53
%19-p53
w(19)=kf_p53*(1+k_p53*(v(15)^n_ATR)/(v(15)^n_ATR+K_ATR^n_ATR))-v(19)*(kd_p53+kd_p53Mdm2*(v(22)^n_Mdm2)/(v(22)^n_Mdm2+K_Mdm2^n_Mdm2)+kp_ser46*v(15));
%20-p53ser46(pro-apoptosis)
w(20)=kp_ser46*v(19)*v(15)-kd_ser46*v(20);
%21-mRNA Mdm2
w(21)=kt_Mdm2+kt_Mdm2p53*((v(19)+v(20))^n_p53)/((v(19)+v(20))^n_p53+K_p53^n_p53)-ktd_Mdm2*v(21);
%22-Mdm2
w(22)=kf_Mdm2*v(21)-kd_Mdm2*v(22);

% [v w']
%%%%%%%%%%%%
dudt=w';
end