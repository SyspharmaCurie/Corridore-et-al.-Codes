function K=cell_pop_logistic_f(time,upAsy,sness,tED50)

        K=upAsy*(1-1./(1+exp(sness*(time-tED50))));
end

