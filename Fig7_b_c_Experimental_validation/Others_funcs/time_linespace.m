function [t_vec] = time_linespace(numb_comptime1,T)
    numb_comptime=T*numb_comptime1+1;
    t_vec=linspace(0,T,numb_comptime);
end

