function [color_mat_VXvsConc_MGMT_M,color_mat_VXvsConc_MGMT_P] = color_VXvsConc()

% color_num_MGMT_M=6;
% color_num_MGMT_P=6;
% color_mat_VXvsConc_MGMT_M=zeros(color_num_MGMT_M,3);
% color_mat_VXvsConc_MGMT_P=zeros(color_num_MGMT_P,3);
% 
% color_num_vec_MGMT_M=0:color_num_MGMT_M-1;
% color_num_vec_MGMT_P=0:color_num_MGMT_P-1;

% int_col_MGMT_M=[0 1 1];
% fin_col_MGMT_M=[0 0 1];
% 
% 
% int_col_MGMT_P=[1 1 0];
% fin_col_MGMT_P=[1 0 0];
% 
% for n=1:color_num_MGMT_M
%         color_mat_VXvsConc_MGMT_M(n,:)=int_col_MGMT_M+(fin_col_MGMT_M-int_col_MGMT_M)*color_num_vec_MGMT_M(n)/(color_num_MGMT_M-1);
% end
% for n=1:color_num_MGMT_P
%         color_mat_VXvsConc_MGMT_P(n,:)=int_col_MGMT_P+(fin_col_MGMT_P-int_col_MGMT_P)*color_num_vec_MGMT_P(n)/(color_num_MGMT_P-1);
% end

color_mat_VXvsConc_MGMT_M=[0 1 1;0 0 1;0 0 1;0 0 1;0 0 1;0 0 1];
color_mat_VXvsConc_MGMT_P=[1 1 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0];

end

