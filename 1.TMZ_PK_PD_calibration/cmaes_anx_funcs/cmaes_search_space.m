function [LO,UP] = cmaes_search_space(param0,Chk1_Jack_MGMT_M_norm,Chk1_Jack_inhATR_VXcon_MGMT_M_norm,Cdc250)

LO=zeros(size(param0));
UP=zeros(size(param0));

LO(1:end)=param0(1:end)*0.6;
UP(1:end)=param0(1:end)*1.4;

if LO(1)<31%TMZout0_Ka_XTMZ should be between 35muM and 38muM
    LO(1)=31;
end
if UP(1)>39
    UP(1)=39;
end

if LO(2)<0.05%MGMT_P0 should be between 5nM and 500nM
    LO(2)=0.05;
end
if UP(2)>2.5
    UP(2)=2.5;
end

if LO(6)<0.5%DSB_72h_fac
    LO(6)=0.5;
end
if UP(6)>1.4
    UP(6)=1.4;
end

if LO(9)<1%k_CyA should be between 1 and 10
    LO(9)=1;
end
if UP(9)>20
    UP(9)=20;
end

if LO(13)<0.01e-3%K_add bouderies fixed considering the He p53 data in 3th step of estimation
    LO(13)=0.01e-3;
end
if UP(13)>10e-3
    UP(13)=10e-3;
end

if LO(17)<0.005*Chk1_Jack_MGMT_M_norm(4)%the upper bound of pChk1_ref12_5_24h is already fixed inside the cost function
    LO(17)=0.005*Chk1_Jack_MGMT_M_norm(4);
end

if UP(19)>1.2*Chk1_Jack_inhATR_VXcon_MGMT_M_norm%the lower bound of pChk1_ref100_48h is already fixed inside the cost function
    UP(19)=1.2*Chk1_Jack_inhATR_VXcon_MGMT_M_norm;
end

if LO(22)<0%K_cdc25, CyA degradation starts when Cdc25 joins the Aas 48h data
    LO(22)=0;
end
if UP(22)>Cdc250
    UP(22)=Cdc250;
end

if LO(25)<0.005e-3%K_ATR
    LO(25)=0.005e-3;
end
if UP(25)>10e-3
    UP(25)=10e-3;
end

if LO(26)<0.0001 %p53ser46_ref50_72h, fosforilated p53 is between 1% and 100% of the tot p53 at 50muM TMZ, corresponding more or less at 120nM
    LO(26)=0.0001;
end
if UP(26)>1
    UP(26)=1;
end

if LO(28)<0.001%K_p53
    LO(28)=0.001;
end
if UP(28)>8
    UP(28)=8;
end

if LO(32)<120%tED50
    LO(32)=120;
end

if LO(33)<70%cell_pop_norm0_Jack_MGMT_P
    LO(33)=70;
end
if UP(33)>100
    UP(33)=100;
end

end

