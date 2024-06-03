function [IC50] = compute_survcurv_IC50(TMZout0_surv,surv_curvm)

IC50=TMZout0_surv(end);
IC50_diff=50;
 
 for i=1:size(TMZout0_surv,1)
     if (abs(surv_curvm(i)-50)<IC50_diff)
         IC50=TMZout0_surv(i);
         IC50_diff=abs(surv_curvm(i)-50);
    end
 end



end

