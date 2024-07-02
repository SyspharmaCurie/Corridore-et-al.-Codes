function dudt=cell_pop_eq(time,v,time_vec,p53_vec,k_apop,n_p53int,upAsy,sness,tED50)
        [c, ind] = min(abs(time_vec-time));
        w=-k_apop*cell_pop_int_p53_Hillf(time_vec(1:ind),p53_vec(1:ind),n_p53int,upAsy,sness,tED50)*v;
        dudt=w';
       
end