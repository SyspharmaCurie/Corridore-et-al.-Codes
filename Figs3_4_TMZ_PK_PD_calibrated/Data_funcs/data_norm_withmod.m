function [MGMT_Jack_MGMT_M_norm,MGMT_Jack_MGMT_P_norm,...Normalized Data
    pChk1_Jack_MGMT_M_norm,pChk1_Jack_MGMT_P_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm,MGMT_Jack_inhATR_VXcon_MGMT_M_norm,MGMT_Jack_inhATR_MGMT_M_norm,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm,MGMT_Jack_inhATR_VXcon_MGMT_P_norm,MGMT_Jack_inhATR_MGMT_P_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm,pChk1_Jack_inhATR_VXcon_MGMT_M_norm,pChk1_Jack_inhATR_MGMT_M_norm,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm,pChk1_Jack_inhATR_VXcon_MGMT_P_norm,pChk1_Jack_inhATR_MGMT_P_norm,...
    pChk1_Aas_norm,p53_Aas_norm,...
    p53_He_hdTMZ_MGMT_M_24h_norm,p53_He_hdTMZ_MGMT_M_72h_norm,...
    p53_He_ldTMZ_MGMT_M_24h_norm,p53_He_ldTMZ_MGMT_M_72h_norm,...
    p53ser46_He_hdTMZ_MGMT_M_24h_norm,p53ser46_He_hdTMZ_MGMT_M_72h_norm,...
    p53ser46_He_ldTMZ_MGMT_M_24h_norm,p53ser46_He_ldTMZ_MGMT_M_72h_norm]=data_norm_withmod(...Parameters
    MGMT_Jack_MGMT_M,MGMT_Jack_MGMT_P,...Data
    pChk1_Jack_MGMT_M,pChk1_Jack_MGMT_P,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_M,MGMT_Jack_inhATR_VXcon_MGMT_M,MGMT_Jack_inhATR_MGMT_M,...
    MGMT_Jack_inhATR_TMZVXcon_MGMT_P,MGMT_Jack_inhATR_VXcon_MGMT_P,MGMT_Jack_inhATR_MGMT_P,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_M,pChk1_Jack_inhATR_VXcon_MGMT_M,pChk1_Jack_inhATR_MGMT_M,...
    pChk1_Jack_inhATR_TMZVXcon_MGMT_P,pChk1_Jack_inhATR_VXcon_MGMT_P,pChk1_Jack_inhATR_MGMT_P,...
    pChk1_Aas,p53_Aas,...
    p53_He_ldTMZ_MGMT_M_24h,p53_He_ldTMZ_MGMT_M_72h,...
    p53_He_hdTMZ_MGMT_M_24h,p53_He_hdTMZ_MGMT_M_72h,...
    p53ser46_He_hdTMZ_MGMT_M_24h,p53ser46_He_hdTMZ_MGMT_M_72h,...
    p53ser46_He_ldTMZ_MGMT_M_24h,p53ser46_He_ldTMZ_MGMT_M_72h,...
    MGMT_P0,p530_MGMT_M,...normalization value reference
    pChk1_ref12_5_24h,pChk1_ref100_24h,pChk1_ref100_48h,p53ser46_ref50_72h...
        )

%%%%%%%%%%%%Data Normalization
%%%Jackson 2019
factor_MGMT_Jack=4*MGMT_P0/(MGMT_Jack_MGMT_P(1)+MGMT_Jack_MGMT_P(2)+MGMT_Jack_MGMT_P(3)+MGMT_Jack_MGMT_P(4));
MGMT_Jack_MGMT_M_norm=MGMT_Jack_MGMT_M;
MGMT_Jack_MGMT_P_norm=MGMT_Jack_MGMT_P*factor_MGMT_Jack;

factor_pChk1_Jack=pChk1_ref12_5_24h/pChk1_Jack_MGMT_M(4);%Jackson at 24h equal to 0.00075muM
% factor_pChk1_Jack=pChk1_Jack_inhATR_TMZVXcon_MGMT_M_Norm/pChk1_Jack_MGMT_M(1);
% factor_pChk1_Jack=u_mJack_MGMT_M(48*numb_comptime1+1,18)/pChk1_Jack_MGMT_M(5);
% factor_pChk1_Jack=(pChk1_Jack_inhATR_TMZVXcon_P_Norm+pChk1_Jack_inhATR_VXcon_P_Norm+sum(pChk1_Jack_inhATR_P_Norm))/(6*pChk1_Jack_MGMT_P(4));
% factor_pChk1_Jack=(pChk1_Jack_inhATR_TMZVXcon_M_Norm+pChk1_Jack_inhATR_VXcon_M_Norm+sum(pChk1_Jack_inhATR_M_Norm))/(6*pChk1_Jack_MGMT_M(4));
pChk1_Jack_MGMT_M_norm=pChk1_Jack_MGMT_M*factor_pChk1_Jack;
pChk1_Jack_MGMT_P_norm=pChk1_Jack_MGMT_P*factor_pChk1_Jack;

%%%Jackson 2019 inhibited
factor_MGMT_Jack_inhATR=MGMT_P0/MGMT_Jack_inhATR_TMZVXcon_MGMT_P;
MGMT_Jack_inhATR_TMZVXcon_MGMT_M_norm=MGMT_Jack_inhATR_TMZVXcon_MGMT_M;
MGMT_Jack_inhATR_VXcon_MGMT_M_norm=MGMT_Jack_inhATR_VXcon_MGMT_M;
MGMT_Jack_inhATR_MGMT_M_norm=MGMT_Jack_inhATR_MGMT_M;

MGMT_Jack_inhATR_TMZVXcon_MGMT_P_norm=MGMT_Jack_inhATR_TMZVXcon_MGMT_P*factor_MGMT_Jack_inhATR;
MGMT_Jack_inhATR_VXcon_MGMT_P_norm=MGMT_Jack_inhATR_VXcon_MGMT_P*factor_MGMT_Jack_inhATR;
MGMT_Jack_inhATR_MGMT_P_norm=MGMT_Jack_inhATR_MGMT_P*factor_MGMT_Jack_inhATR;

factor_pChk1_Jack_inhATR=pChk1_ref100_24h/pChk1_Jack_inhATR_VXcon_MGMT_M;%Jackson ATR Inhib at 24h equal to 0.002muM
% factor_pChk1_Jack_inhATR=u_mJack_inhATR_VXcon_MGMT_M(24*numb_comptime1+1,18)/pChk1_Jack_inhATR_VXcon_MGMT_M;
% factor_pChk1_Jack_inhATR=3*u_mJack_inhATR_TMZVXcon_MGMT_M(24*numb_comptime1+1,18)/(pChk1_Jack_inhATR_TMZVXcon_MGMT_M+pChk1_Jack_inhATR_MGMT_M(3)+pChk1_Jack_inhATR_MGMT_M(4));
pChk1_Jack_inhATR_TMZVXcon_MGMT_M_norm=pChk1_Jack_inhATR_TMZVXcon_MGMT_M*factor_pChk1_Jack_inhATR;
pChk1_Jack_inhATR_VXcon_MGMT_M_norm=pChk1_Jack_inhATR_VXcon_MGMT_M*factor_pChk1_Jack_inhATR;
pChk1_Jack_inhATR_MGMT_M_norm=pChk1_Jack_inhATR_MGMT_M*factor_pChk1_Jack_inhATR;

pChk1_Jack_inhATR_TMZVXcon_MGMT_P_norm=pChk1_Jack_inhATR_TMZVXcon_MGMT_P*factor_pChk1_Jack_inhATR;
pChk1_Jack_inhATR_VXcon_MGMT_P_norm=pChk1_Jack_inhATR_VXcon_MGMT_P*factor_pChk1_Jack_inhATR;
pChk1_Jack_inhATR_MGMT_P_norm=pChk1_Jack_inhATR_MGMT_P*factor_pChk1_Jack_inhATR;

%%He 2019 MGMT- High and low doses
factor_p53_He=p530_MGMT_M;
p53_He_ldTMZ_MGMT_M_24h_norm=p53_He_ldTMZ_MGMT_M_24h*factor_p53_He;
p53_He_ldTMZ_MGMT_M_72h_norm=p53_He_ldTMZ_MGMT_M_72h*factor_p53_He;
p53_He_hdTMZ_MGMT_M_24h_norm=p53_He_hdTMZ_MGMT_M_24h*factor_p53_He;
p53_He_hdTMZ_MGMT_M_72h_norm=p53_He_hdTMZ_MGMT_M_72h*factor_p53_He;
% factor_p53ser46_He_MGMT_M_24h=u_mHe_125TMZ_MGMT_M_72h(72*numb_comptime1+1,21)/p53ser46_He_hdTMZ_MGMT_M_72h(7);
factor_p53ser46_He_MGMT_M_24h=p53ser46_ref50_72h/p53ser46_He_hdTMZ_MGMT_M_72h(4);
p53ser46_He_hdTMZ_MGMT_M_24h_norm=p53ser46_He_hdTMZ_MGMT_M_24h*factor_p53ser46_He_MGMT_M_24h;
p53ser46_He_hdTMZ_MGMT_M_72h_norm=p53ser46_He_hdTMZ_MGMT_M_72h*factor_p53ser46_He_MGMT_M_24h;
p53ser46_He_ldTMZ_MGMT_M_24h_norm=p53ser46_He_ldTMZ_MGMT_M_24h*factor_p53ser46_He_MGMT_M_24h;
p53ser46_He_ldTMZ_MGMT_M_72h_norm=p53ser46_He_ldTMZ_MGMT_M_72h*factor_p53ser46_He_MGMT_M_24h;

%%%Aasland 2020
factor_pChk1_Aas=pChk1_ref100_48h/pChk1_Aas(2); % The norm of Aas is connected to Jack inh ATR since u_mAas=u_mJack_inhATR_VXcon_MGMT_M
% factor_pChk1_Aas=u_mAas(72*numb_comptime1+1,18)/pChk1_Aas(2); % The norm of Aas is connected to Jack inh ATR since u_mAas=u_mJack_inhATR_VXcon_MGMT_M
% factor_pChk1_Aas=u_mAas(48*numb_comptime1+1,18)/pChk1_Aas(1);
% factor_pChk1_Aas=3*pChk1_Jack_MGMT_M_Norm(5)/(pChk1_Aas(1)+pChk1_Aas(2)+pChk1_Aas(3));
% factor_pChk1_Aas=3*u_mJack_inhATR_VXcon_MGMT_M(24*numb_comptime1+1,18)/(pChk1_Aas(1)+pChk1_Aas(2)+pChk1_Aas(3));
pChk1_Aas_norm=pChk1_Aas*factor_pChk1_Aas;
% p53_p_Aas2A, p53_p_Aas2B and pChk1_Aas normalization inside the cost function and in the plot function
% factor_p53_Aas=p530/p53_Aas_con;
factor_p53_Aas=p53_He_hdTMZ_MGMT_M_24h_norm(6)/p53_Aas(2);
p53_Aas_norm=p53_Aas*factor_p53_Aas;

%%%%%%%%%%%%Data Normalization END
end
 




