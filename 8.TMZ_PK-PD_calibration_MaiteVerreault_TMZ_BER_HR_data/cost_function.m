function [cost_surv_Verre_TMZalone_MGMT_M,cost_surv_Verre_TMZalone_MGMT_P,...
    cost_surv_Verre_TMZNip_MGMT_M,cost_surv_Verre_TMZNip_MGMT_P,...
    cost_surv_Verre_TMZRI1_MGMT_M,cost_surv_Verre_TMZRI1_MGMT_P,...
    cost_surv_Verre_TMZRI1Nip_MGMT_M,cost_surv_Verre_TMZRI1Nip_MGMT_P,...
    cost]=cost_function(...
    surv_mean_Verre_TMZalone_MGMT_M,surv_stddev_Verre_TMZalone_MGMT_M,...%data
    surv_mean_Verre_TMZalone_MGMT_P,surv_stddev_Verre_TMZalone_MGMT_P,...
    surv_mean_Verre_TMZNip_MGMT_M,surv_stddev_Verre_TMZNip_MGMT_M,...
    surv_mean_Verre_TMZNip_MGMT_P,surv_stddev_Verre_TMZNip_MGMT_P,...
    surv_mean_Verre_TMZRI1_MGMT_M,surv_stddev_Verre_TMZRI1_MGMT_M,...
    surv_mean_Verre_TMZRI1_MGMT_P,surv_stddev_Verre_TMZRI1_MGMT_P,...
    surv_mean_Verre_TMZRI1Nip_MGMT_M,surv_stddev_Verre_TMZRI1Nip_MGMT_M,...
    surv_mean_Verre_TMZRI1Nip_MGMT_P,surv_stddev_Verre_TMZRI1Nip_MGMT_P,...
    TMZalone_surv_curvm_MGMT_M,TMZalone_surv_curvm_MGMT_P,...%simulations
    TMZNip_surv_curvm_MGMT_M,TMZNip_surv_curvm_MGMT_P,...
    TMZRI1_surv_curvm_MGMT_M,TMZRI1_surv_curvm_MGMT_P,...
    TMZRI1Nip_surv_curvm_MGMT_M,TMZRI1Nip_surv_curvm_MGMT_P...
    )


cost_surv_Verre_TMZalone_MGMT_M=zeros(size(surv_mean_Verre_TMZalone_MGMT_M));
cost_surv_Verre_TMZalone_MGMT_P=zeros(size(surv_mean_Verre_TMZalone_MGMT_P));
cost_surv_Verre_TMZNip_MGMT_M=zeros(size(surv_mean_Verre_TMZNip_MGMT_M));
cost_surv_Verre_TMZNip_MGMT_P=zeros(size(surv_mean_Verre_TMZNip_MGMT_P));
cost_surv_Verre_TMZRI1_MGMT_M=zeros(size(surv_mean_Verre_TMZRI1_MGMT_M));
cost_surv_Verre_TMZRI1_MGMT_P=zeros(size(surv_mean_Verre_TMZRI1_MGMT_P));
cost_surv_Verre_TMZRI1Nip_MGMT_M=zeros(size(surv_mean_Verre_TMZRI1Nip_MGMT_M));
cost_surv_Verre_TMZRI1Nip_MGMT_P=zeros(size(surv_mean_Verre_TMZRI1Nip_MGMT_P));

wght_surv_Verre_TMZalone_MGMT_M=1;
wght_surv_Verre_TMZalone_MGMT_P=1;
wght_surv_Verre_TMZNip_MGMT_M=1;
wght_surv_Verre_TMZNip_MGMT_P=1;
wght_surv_Verre_TMZRI1_MGMT_M=1;
wght_surv_Verre_TMZRI1_MGMT_P=1;
wght_surv_Verre_TMZRI1Nip_MGMT_M=1;
wght_surv_Verre_TMZRI1Nip_MGMT_P=1;

stddev_min=7;

surv_stddev_Verre_TMZalone_MGMT_M_zerofactor=7;
surv_stddev_Verre_TMZalone_MGMT_P_zerofactor=7;
surv_stddev_Verre_TMZNip_MGMT_M_zerofactor=7;
surv_stddev_Verre_TMZNip_MGMT_P_zerofactor=7;
surv_stddev_Verre_TMZRI1_MGMT_M_zerofactor=7;
surv_stddev_Verre_TMZRI1_MGMT_P_zerofactor=7;
surv_stddev_Verre_TMZRI1Nip_MGMT_M_zerofactor=7;
surv_stddev_Verre_TMZRI1Nip_MGMT_P_zerofactor=7;

cost=0;

    
%% Maite Verreault TMZ survival (TMZ alone)
   surv_stddev_Verre_TMZalone_MGMT_M_todivide=surv_stddev_Verre_TMZalone_MGMT_M;
   surv_stddev_Verre_TMZalone_MGMT_M_todivide(surv_stddev_Verre_TMZalone_MGMT_M_todivide<stddev_min)=surv_stddev_Verre_TMZalone_MGMT_M_zerofactor;
   for i=1:size(surv_mean_Verre_TMZalone_MGMT_M,2)
   cost_surv_Verre_TMZalone_MGMT_M(i)=wght_surv_Verre_TMZalone_MGMT_M*(surv_mean_Verre_TMZalone_MGMT_M(i)-TMZalone_surv_curvm_MGMT_M(i))^2/(surv_stddev_Verre_TMZalone_MGMT_M_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZalone_MGMT_M);

   surv_stddev_Verre_TMZalone_MGMT_P_todivide=surv_stddev_Verre_TMZalone_MGMT_P;
   surv_stddev_Verre_TMZalone_MGMT_P_todivide(surv_stddev_Verre_TMZalone_MGMT_P_todivide<stddev_min)=surv_stddev_Verre_TMZalone_MGMT_P_zerofactor;
   for i=1:size(surv_mean_Verre_TMZalone_MGMT_P,2)
   cost_surv_Verre_TMZalone_MGMT_P(i)=wght_surv_Verre_TMZalone_MGMT_P*(surv_mean_Verre_TMZalone_MGMT_P(i)-TMZalone_surv_curvm_MGMT_P(i))^2/(surv_stddev_Verre_TMZalone_MGMT_P_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZalone_MGMT_P);
   
%% Maite Verreault TMZ survival (TMZ + Nip)
   surv_stddev_Verre_TMZNip_MGMT_M_todivide=surv_stddev_Verre_TMZNip_MGMT_M;
   surv_stddev_Verre_TMZNip_MGMT_M_todivide(surv_stddev_Verre_TMZNip_MGMT_M_todivide<stddev_min)=surv_stddev_Verre_TMZNip_MGMT_M_zerofactor;
   for i=1:size(surv_mean_Verre_TMZNip_MGMT_M,2)
   cost_surv_Verre_TMZNip_MGMT_M(i)=wght_surv_Verre_TMZNip_MGMT_M*(surv_mean_Verre_TMZNip_MGMT_M(i)-TMZNip_surv_curvm_MGMT_M(i))^2/(surv_stddev_Verre_TMZNip_MGMT_M_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZNip_MGMT_M);

   surv_stddev_Verre_TMZNip_MGMT_P_todivide=surv_stddev_Verre_TMZNip_MGMT_P;
   surv_stddev_Verre_TMZNip_MGMT_P_todivide(surv_stddev_Verre_TMZNip_MGMT_P_todivide<stddev_min)=surv_stddev_Verre_TMZNip_MGMT_P_zerofactor;
   for i=1:size(surv_mean_Verre_TMZNip_MGMT_P,2)
   cost_surv_Verre_TMZNip_MGMT_P(i)=wght_surv_Verre_TMZNip_MGMT_P*(surv_mean_Verre_TMZNip_MGMT_P(i)-TMZNip_surv_curvm_MGMT_P(i))^2/(surv_stddev_Verre_TMZNip_MGMT_P_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZNip_MGMT_P);
   
%% Maite Verreault TMZ survival (TMZ + RI1)
   surv_stddev_Verre_TMZRI1_MGMT_M_todivide=surv_stddev_Verre_TMZRI1_MGMT_M;
   surv_stddev_Verre_TMZRI1_MGMT_M_todivide(surv_stddev_Verre_TMZRI1_MGMT_M_todivide<stddev_min)=surv_stddev_Verre_TMZRI1_MGMT_M_zerofactor;
   for i=1:size(surv_mean_Verre_TMZRI1_MGMT_M,2)
   cost_surv_Verre_TMZRI1_MGMT_M(i)=wght_surv_Verre_TMZRI1_MGMT_M*(surv_mean_Verre_TMZRI1_MGMT_M(i)-TMZRI1_surv_curvm_MGMT_M(i))^2/(surv_stddev_Verre_TMZRI1_MGMT_M_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZRI1_MGMT_M);

   surv_stddev_Verre_TMZRI1_MGMT_P_todivide=surv_stddev_Verre_TMZRI1_MGMT_P;
   surv_stddev_Verre_TMZRI1_MGMT_P_todivide(surv_stddev_Verre_TMZRI1_MGMT_P_todivide<stddev_min)=surv_stddev_Verre_TMZRI1_MGMT_P_zerofactor;
   for i=1:size(surv_mean_Verre_TMZRI1_MGMT_P,2)
   cost_surv_Verre_TMZRI1_MGMT_P(i)=wght_surv_Verre_TMZRI1_MGMT_P*(surv_mean_Verre_TMZRI1_MGMT_P(i)-TMZRI1_surv_curvm_MGMT_P(i))^2/(surv_stddev_Verre_TMZRI1_MGMT_P_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZRI1_MGMT_P);
%% Maite Verreault TMZ survival (TMZ + RI1 + Nip)
   surv_stddev_Verre_TMZRI1Nip_MGMT_M_todivide=surv_stddev_Verre_TMZRI1Nip_MGMT_M;
   surv_stddev_Verre_TMZRI1Nip_MGMT_M_todivide(surv_stddev_Verre_TMZRI1Nip_MGMT_M_todivide<stddev_min)=surv_stddev_Verre_TMZRI1Nip_MGMT_M_zerofactor;
   for i=1:size(surv_mean_Verre_TMZRI1Nip_MGMT_M,2)
   cost_surv_Verre_TMZRI1Nip_MGMT_M(i)=wght_surv_Verre_TMZRI1Nip_MGMT_M*(surv_mean_Verre_TMZRI1Nip_MGMT_M(i)-TMZRI1Nip_surv_curvm_MGMT_M(i))^2/(surv_stddev_Verre_TMZRI1Nip_MGMT_M_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZRI1Nip_MGMT_M);

   surv_stddev_Verre_TMZRI1Nip_MGMT_P_todivide=surv_stddev_Verre_TMZRI1Nip_MGMT_P;
   surv_stddev_Verre_TMZRI1Nip_MGMT_P_todivide(surv_stddev_Verre_TMZRI1Nip_MGMT_P_todivide<stddev_min)=surv_stddev_Verre_TMZRI1Nip_MGMT_P_zerofactor;
   for i=1:size(surv_mean_Verre_TMZRI1Nip_MGMT_P,2)
   cost_surv_Verre_TMZRI1Nip_MGMT_P(i)=wght_surv_Verre_TMZRI1Nip_MGMT_P*(surv_mean_Verre_TMZRI1Nip_MGMT_P(i)-TMZRI1Nip_surv_curvm_MGMT_P(i))^2/(surv_stddev_Verre_TMZRI1Nip_MGMT_P_todivide(i))^2;
   end
   cost=cost+sum(cost_surv_Verre_TMZRI1Nip_MGMT_P);
       
       

end