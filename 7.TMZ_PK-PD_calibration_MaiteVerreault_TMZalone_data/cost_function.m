function [cost_surv_Verre_TMZalone_MGMT_M,cost_surv_Verre_TMZalone_MGMT_P,...
    cost]=cost_function(...
    surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...%data
    surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P...%simulations
    )


cost_surv_Verre_TMZalone_MGMT_M=zeros(1,size(surv_mean_Verre_TMZalone_MGMT_M,1)-1);
cost_surv_Verre_TMZalone_MGMT_P=zeros(1,size(surv_mean_Verre_TMZalone_MGMT_P,1)-1);

wght_surv_Verre_TMZalone_MGMT_M=1;
wght_surv_Verre_TMZalone_MGMT_P=1;
apop_stddev_Verre_TMZalone_MGMT_M_zerofactor=4;
apop_stddev_Verre_TMZalone_MGMT_P_zerofactor=4;

cost=0;

    
    %% Maite Verreault TMZ survival (TMZ alone)
       surv_stddev_Verre_TMZalone_MGMT_M_todivide=surv_stddev_Verre_TMZalone_MGMT_M;
       surv_stddev_Verre_TMZalone_MGMT_M_todivide(surv_stddev_Verre_TMZalone_MGMT_M_todivide<1e-10)=apop_stddev_Verre_TMZalone_MGMT_M_zerofactor;
       for i=1:size(surv_mean_Verre_TMZalone_MGMT_M,1)
       cost_surv_Verre_TMZalone_MGMT_M(i)=wght_surv_Verre_TMZalone_MGMT_M*(surv_mean_Verre_TMZalone_MGMT_M(i)-TMZalone_surv_curvm_MGMT_M(i))^2/(surv_stddev_Verre_TMZalone_MGMT_M_todivide(i))^2;
       end
       cost=cost+sum(cost_surv_Verre_TMZalone_MGMT_M);
       
       surv_stddev_Verre_MGMTalone_P_todivide=surv_stddev_Verre_TMZalone_MGMT_P;
       surv_stddev_Verre_MGMTalone_P_todivide(surv_stddev_Verre_MGMTalone_P_todivide<1e-10)=apop_stddev_Verre_TMZalone_MGMT_P_zerofactor;
       for i=1:size(surv_mean_Verre_TMZalone_MGMT_P,1)
       cost_surv_Verre_TMZalone_MGMT_P(i)=wght_surv_Verre_TMZalone_MGMT_P*(surv_mean_Verre_TMZalone_MGMT_P(i)-TMZalone_surv_curvm_MGMT_P(i))^2/(surv_stddev_Verre_MGMTalone_P_todivide(i))^2;
       end
       cost=cost+sum(cost_surv_Verre_TMZalone_MGMT_P);
       
       

end