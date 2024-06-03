function Mdl = simulations_randfor(dataset,survcurv_AUC_vec,variabforweaklearn,treenumb)


t = templateTree('NumVariablesToSample',variabforweaklearn,...
    'PredictorSelection','interaction-curvature',...
    'Surrogate','on');
% Default for bagging: square root of the number of predictors for
% classification and one third of predictors for regression.
% Character vector specifying the algorithm for choosing the best split
% predictor, one of: 'allsplits', 'curvature' and 'interaction-curvature'.
% If 'interaction-curvature', the split predictor is chosen by minimizing the
% p-value of a chi-square test of independence between each predictor and
% response and minimizing the p-value of a chi-square test of independence
% between each pair of predictors and response.
% 'on', 'off', 'all', or a positive integer. When 'on', decision tree finds 10 surrogate splits at each branch
% node. When set to an integer, decision tree finds at most the specified number of surrogate splits at each branch node.

rng(1); % For reproducibility
Mdl = fitrensemble(dataset,survcurv_AUC_vec,'Method','Bag','NumLearningCycles',treenumb,'Learners',t);
% 'Method'='Bag' is the bagging
% 'NumLearningCycles' - Positive integer specifying the number of ensemble learning cycles. At every training cycle,
% fitrensemble loops over all learner templates in Learners and trains one weak learner (in this case decision tree)
% for every template object (in tha case just one, given by templateTree). The number of trained learners in ENS is
% equal to NumLearningCycles*numel(Learners). Usually, an ensemble with a good predictive power needs between
% a few hundred and a few thousand weak learners. You do not have to train an ensemble for that many cycles at once.
% You can start by growing a few dozen learners, inspect the ensemble performance and, if necessary, train
% more weak learners using RESUME method of the ensemble. Default: 100

%Question: do have to give all the data (dataset_MGMT_M) or we have to
%give a subset of trainingData?

end

