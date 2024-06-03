function distr = pat_log_norm_dist(m,v,patient_num)
mu =log(m^2 / sqrt(v+m^2))
sigma =sqrt(log(v/m^2 + 1))

distr=lognrnd(mu,sigma,[patient_num,1]);

% figure(672)
% clf
% histogram(distr)
% % xlim([0,3])
% 
% figure(673)
% clf
% histfit(distr)
% 
% 
% pd = fitdist(distr,'Lognormal')
% x_values = 0:0.01:10;
% y = pdf(pd,x_values);
% figure(674)
% clf
% plot(x_values,y)


end

