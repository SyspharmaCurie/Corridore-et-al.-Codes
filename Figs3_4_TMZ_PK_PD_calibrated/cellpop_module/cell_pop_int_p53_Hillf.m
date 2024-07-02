function I=cell_pop_int_p53_Hillf(time_vec,p53_vec,n,upAsy,sness,tED50)
        if(size(time_vec)==[1 1])
            I=0;
        else
            I=trapz(time_vec,p53_vec)^n/(trapz(time_vec,p53_vec)^n+cell_pop_logistic_f(time_vec(end),upAsy,sness,tED50)^n);
        end
end