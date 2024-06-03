function [tDMSO_TMZ_pop,norm_popm]=cell_pop_simulations(h,numb_comptime1,tm_cell,um_cell,N0,k_apop,n_p53int,upAsy,sness,tED50,N_norm0,DMSO_pop,sim_index)

% t=tm_cell{sim_index};
% p53_vec=um_cell{sim_index}(:,21);
[t,p53_vec]=cell_pop_p53vec(h,numb_comptime1,tm_cell{sim_index},um_cell{sim_index});

[tDMSO_TMZ_pop,DMSO_TMZ_pop]=ode23tb(@cell_pop_eq,t,N0,[],t,p53_vec,k_apop,n_p53int,upAsy,sness,tED50);
norm_popm=DMSO_TMZ_pop;
% norm_popm=N_norm0*DMSO_TMZ_pop./DMSO_pop;    % The cell population data are normalized with the control, consisting in DMSO alone, no TMZ.
                                             % Hence we do the same for the cell population model, by dividing fot the dynamics at TMZ=0.

end

