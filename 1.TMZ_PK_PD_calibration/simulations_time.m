function [numb_comptime1,t_Jack,t_Jack_inhATR,t_Aas,t_He,t_Ka,t_Jack_surv] = simulations_time()

%     T_Jack=48;
%     T_Jack_inhATR=24;
%     T_Aas=96; 
%     T_He=144;
%     T_Ka=24;
%     T_Jack_surv=144;
    T_Jack=144;
    T_Jack_inhATR=144;
    T_Aas=144; 
    T_He=144;
    T_Ka=144;
    T_Jack_surv=144;
    numb_comptime1=5;
    t_Jack=time_linespace(numb_comptime1,T_Jack);
    t_Jack_inhATR=time_linespace(numb_comptime1,T_Jack_inhATR);
    t_Aas=time_linespace(numb_comptime1,T_Aas);
    t_He=time_linespace(numb_comptime1,T_He);
    t_Ka=time_linespace(numb_comptime1,T_Ka);
    t_Jack_surv=time_linespace(numb_comptime1,T_Jack_surv);

end

