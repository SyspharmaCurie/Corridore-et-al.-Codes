function [] = sim_indx()


global sn_Jack_MGMT_M sn_Jack_MGMT_P...
    sn_Jack_inhATR_TMZVXcon_MGMT_M sn_Jack_inhATR_VXcon_MGMT_M sn_Jack_inhATR8VX_MGMT_M sn_Jack_inhATR40VX_MGMT_M sn_Jack_inhATR200VX_MGMT_M sn_Jack_inhATR1000VX_MGMT_M ...
    sn_Jack_inhATR_TMZVXcon_MGMT_P sn_Jack_inhATR_VXcon_MGMT_P sn_Jack_inhATR8VX_MGMT_P sn_Jack_inhATR40VX_MGMT_P sn_Jack_inhATR200VX_MGMT_P sn_Jack_inhATR1000VX_MGMT_P ...
    sn_Aas ...
    sn_He_0TMZ_MGMT_M_144h sn_He_1TMZ_MGMT_M_144h sn_He_2TMZ_MGMT_M_144h sn_He_3TMZ_MGMT_M_144h sn_He_4TMZ_MGMT_M_144h sn_He_5TMZ_MGMT_M_144h sn_He_10TMZ_MGMT_M_144h sn_He_15TMZ_MGMT_M_144h sn_He_20TMZ_MGMT_M_144h ...
    sn_He_12_5TMZ_MGMT_M_144h sn_He_25TMZ_MGMT_M_144h sn_He_50TMZ_MGMT_M_144h sn_He_75TMZ_MGMT_M_144h sn_He_100TMZ_MGMT_M_144h sn_He_125TMZ_MGMT_M_144h ...
    sn_He_0TMZ_MGMT_P_144h sn_He_1TMZ_MGMT_P_144h sn_He_2TMZ_MGMT_P_144h sn_He_3TMZ_MGMT_P_144h sn_He_4TMZ_MGMT_P_144h sn_He_5TMZ_MGMT_P_144h sn_He_10TMZ_MGMT_P_144h sn_He_15TMZ_MGMT_P_144h sn_He_20TMZ_MGMT_P_144h ...
    sn_He_12_5TMZ_MGMT_P_144h sn_He_25TMZ_MGMT_P_144h sn_He_50TMZ_MGMT_P_144h sn_He_75TMZ_MGMT_P_144h sn_He_100TMZ_MGMT_P_144h sn_He_125TMZ_MGMT_P_144h ...
    sn_Ka_20TMZ_MGMT_M sn_Ka_50TMZ_MGMT_M sn_Ka_75TMZ_MGMT_M sn_Ka_XTMZ_MGMT_M...
    sn_Ka_20TMZ_MGMT_P sn_Ka_50TMZ_MGMT_P sn_Ka_100TMZ_MGMT_P sn_Ka_XTMZ_MGMT_P...
    sn_surv_0TMZ_MGMT_M_144h sn_surv_1TMZ_MGMT_M_144h sn_surv_2TMZ_MGMT_M_144h sn_surv_4TMZ_MGMT_M_144h sn_surv_8TMZ_MGMT_M_144h sn_surv_16TMZ_MGMT_M_144h sn_surv_32TMZ_MGMT_M_144h ...
    sn_surv_64TMZ_MGMT_M_144h sn_surv_128TMZ_MGMT_M_144h sn_surv_256TMZ_MGMT_M_144h sn_surv_512TMZ_MGMT_M_144h sn_surv_1024TMZ_MGMT_M_144h sn_surv_3000TMZ_MGMT_M_144h...
    sn_surv_0TMZ_MGMT_P_144h sn_surv_1TMZ_MGMT_P_144h sn_surv_2TMZ_MGMT_P_144h sn_surv_4TMZ_MGMT_P_144h sn_surv_8TMZ_MGMT_P_144h sn_surv_16TMZ_MGMT_P_144h sn_surv_32TMZ_MGMT_P_144h...
    sn_surv_64TMZ_MGMT_P_144h sn_surv_128TMZ_MGMT_P_144h sn_surv_256TMZ_MGMT_P_144h sn_surv_512TMZ_MGMT_P_144h sn_surv_1024TMZ_MGMT_P_144h sn_surv_3000TMZ_MGMT_P_144h...
    sim_number

n=1;
%% Jack
sn_Jack_MGMT_M=n;n=n+1;
sn_Jack_MGMT_P=n;n=n+1;
%% Jackson inhibited ATR
%%% MGMT-
sn_Jack_inhATR_TMZVXcon_MGMT_M=n;n=n+1;
sn_Jack_inhATR_VXcon_MGMT_M=n;n=n+1;
sn_Jack_inhATR8VX_MGMT_M=n;n=n+1;
sn_Jack_inhATR40VX_MGMT_M=n;n=n+1;
sn_Jack_inhATR200VX_MGMT_M=n;n=n+1;
sn_Jack_inhATR1000VX_MGMT_M=n;n=n+1;
%%% MGMT-
sn_Jack_inhATR_TMZVXcon_MGMT_P=n;n=n+1;
sn_Jack_inhATR_VXcon_MGMT_P=n;n=n+1;
sn_Jack_inhATR8VX_MGMT_P=n;n=n+1;
sn_Jack_inhATR40VX_MGMT_P=n;n=n+1;
sn_Jack_inhATR200VX_MGMT_P=n;n=n+1;
sn_Jack_inhATR1000VX_MGMT_P=n;n=n+1;
%% Aasland
sn_Aas=n;n=n+1;
%% He
sn_He_0TMZ_MGMT_M_144h=n;n=n+1;
sn_He_1TMZ_MGMT_M_144h=n;n=n+1;
sn_He_2TMZ_MGMT_M_144h=n;n=n+1;
sn_He_3TMZ_MGMT_M_144h=n;n=n+1;
sn_He_4TMZ_MGMT_M_144h=n;n=n+1;
sn_He_5TMZ_MGMT_M_144h=n;n=n+1;
sn_He_10TMZ_MGMT_M_144h=n;n=n+1;
sn_He_15TMZ_MGMT_M_144h=n;n=n+1;
sn_He_20TMZ_MGMT_M_144h=n;n=n+1;

sn_He_12_5TMZ_MGMT_M_144h=n;n=n+1;
sn_He_25TMZ_MGMT_M_144h=n;n=n+1;
sn_He_50TMZ_MGMT_M_144h=n;n=n+1;
sn_He_75TMZ_MGMT_M_144h=n;n=n+1;
sn_He_100TMZ_MGMT_M_144h=n;n=n+1;
sn_He_125TMZ_MGMT_M_144h=n;n=n+1;

sn_He_0TMZ_MGMT_P_144h=n;n=n+1;
sn_He_1TMZ_MGMT_P_144h=n;n=n+1;
sn_He_2TMZ_MGMT_P_144h=n;n=n+1;
sn_He_3TMZ_MGMT_P_144h=n;n=n+1;
sn_He_4TMZ_MGMT_P_144h=n;n=n+1;
sn_He_5TMZ_MGMT_P_144h=n;n=n+1;
sn_He_10TMZ_MGMT_P_144h=n;n=n+1;
sn_He_15TMZ_MGMT_P_144h=n;n=n+1;
sn_He_20TMZ_MGMT_P_144h=n;n=n+1;

sn_He_12_5TMZ_MGMT_P_144h=n;n=n+1;
sn_He_25TMZ_MGMT_P_144h=n;n=n+1;
sn_He_50TMZ_MGMT_P_144h=n;n=n+1;
sn_He_75TMZ_MGMT_P_144h=n;n=n+1;
sn_He_100TMZ_MGMT_P_144h=n;n=n+1;
sn_He_125TMZ_MGMT_P_144h=n;n=n+1;

%% Kaina
sn_Ka_20TMZ_MGMT_M=n;n=n+1;
sn_Ka_50TMZ_MGMT_M=n;n=n+1;
sn_Ka_75TMZ_MGMT_M=n;n=n+1;
sn_Ka_XTMZ_MGMT_M=n;n=n+1;

sn_Ka_20TMZ_MGMT_P=n;n=n+1;
sn_Ka_50TMZ_MGMT_P=n;n=n+1;
sn_Ka_100TMZ_MGMT_P=n;n=n+1;
sn_Ka_XTMZ_MGMT_P=n;n=n+1;

%% Jackson Cell TMZ viability
%%% MGMT-
sn_surv_0TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_1TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_2TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_4TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_8TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_16TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_32TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_64TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_128TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_256TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_512TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_1024TMZ_MGMT_M_144h=n;n=n+1;
sn_surv_3000TMZ_MGMT_M_144h=n;n=n+1;
%%% MGMT+
sn_surv_0TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_1TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_2TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_4TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_8TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_16TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_32TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_64TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_128TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_256TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_512TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_1024TMZ_MGMT_P_144h=n;n=n+1;
sn_surv_3000TMZ_MGMT_P_144h=n;

sim_number=n;
end

