library(tictoc)
library(tidyr)
library(rvinecopulib)
library(ggplot2)
library(univariateML)
library(MASS)
library(mnormt)
library(assertthat)

# 1st step_____________________________________________________________________________________________________________________________________

###### YOU HAVE TO SET THE WORK DIRECTORY ###### 
dir="~/Post-doc/Github Codes/Corridore_et_al/Fig5_B_vinecop_model"

#Load cmaes file
all_param_df <- read.csv(here::here(dir,'all_param.csv'), header = FALSE) # The data in 'all_param.csv' have be obteined collecting the cmaes output. See Matlab code in "2.parameter_distribution".
parm_name_vector <- c("TMZout0_Ka_XTMZ","MGMT_P0","k_MGMT","k_addO","k_addN","DSB_72h_fac","k_DSBO","k_DSBN","k_CyA","fVX","kf_ATR_MGMT_P","k_ATR","K_add","kd_pATR","k_Chk1","C_Chk1","pChk1_ref12_5_24h","pChk1_ref100_24h","pChk1_ref100_48h","kd_pChk1","k_cdc25","K_cdc25","kf_p53","k_p53","K_ATR","p53ser46_ref50_72h","kp_ser46","K_p53","upAsy","sness","k_apop","tED50","cell_pop_norm0_Jack_MGMT_P","k_dis")
  names(all_param_df) <-   parm_name_vector

#Data fitting with multivariant vine copula distribution
tic("Multivariant Vine-copula")
data=all_param_df[ ,c("MGMT_P0","k_MGMT","k_addO","k_addN","k_DSBO","k_DSBN","k_CyA","kf_ATR_MGMT_P","k_ATR","K_add","kd_pATR","k_Chk1","C_Chk1","kd_pChk1","k_cdc25","K_cdc25","kf_p53","k_p53","K_ATR","kp_ser46","K_p53","upAsy","sness","k_apop","tED50")] #
data=drop_na(data)

# 2nd step_____________________________________________________________________________________________________________________________________
#(This step could stand several minutes)

## Fitting the margins: model_select Fits multiple models (univariateML_models means all,"beta","betapr","cauchy","exp","gamma"...)
#with "data" and select the best fit. To fit the data it used the crietrion "aic". Thanks to "lapply", the function "model select" is applied
# to all the elements of the list "data", which in this example are "data2" and "data1". Namely, we are fiting the marginals for "data2" and "data1".
margin_fits <- lapply(
  data,
  univariateML::model_select,
  models = univariateML::univariateML_models,
  criterion = "aic"
)

# 3rd step_____________________________________________________________________________________________________________________________________

##Transform variables to uniform scale. The function mapply is like lapply but it is applied when de function to compute, "pml",asks more
#than one arguments. In this case two:data, margin_fits. The function pml compute the distribution function given in "margins_fits" on
#the elements in "data". The output is than transformed in a data frame.
u_data <- mapply(univariateML::pml, data, margin_fits)
u_data <- as.data.frame(u_data)

# 4th step_____________________________________________________________________________________________________________________________________
#(This step could stand several minutes)

vc <- rvinecopulib::vinecop(
  u_data,
  family_set = "parametric",
  cores = 8L
)
summary(vc)

# 5th step_____________________________________________________________________________________________________________________________________

vincop_sim=rvinecop(1000, vc)
vincop_sim <- as.data.frame(vincop_sim)

#This function provides pair plots for copula data. It shows bivariate contour plots on the lower
#panel, scatter plots and correlations on the upper panel and histograms on the diagonal panel.
pairs_copula_data(vincop_sim)




