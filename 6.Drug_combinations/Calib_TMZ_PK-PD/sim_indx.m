function [] = sim_indx(TMZout0_vec)


global sn_MGMT_M_vec sn_MGMT_P_vec...
       sim_num

sim_number_cell_line=size(TMZout0_vec,2);
sim_num=2*size(TMZout0_vec,2);

sn_MGMT_M_vec=(1:1:sim_number_cell_line);
sn_MGMT_P_vec=(sim_number_cell_line+1:1:2*sim_number_cell_line);

end