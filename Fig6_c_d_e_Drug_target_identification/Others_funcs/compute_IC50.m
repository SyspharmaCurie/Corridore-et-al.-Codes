function [IC50_MGMT_M,IC50_MGMT_P] = compute_IC50(TMZout0_surv,surv_curvm_MGMT_M,surv_curvm_MGMT_P)

IC50_MGMT_M=TMZout0_surv(end);
IC50_MGMT_P=TMZout0_surv(end);
 
 for i=1:size(TMZout0_surv,2)
     if (surv_curvm_MGMT_M(i)<50)
         IC50_MGMT_M=TMZout0_surv(i);
         break
    end
 end
 
 for i=1:size(TMZout0_surv,2)
     if (surv_curvm_MGMT_P(i)<50)
         IC50_MGMT_P=TMZout0_surv(i);
         break
    end
 end



end

