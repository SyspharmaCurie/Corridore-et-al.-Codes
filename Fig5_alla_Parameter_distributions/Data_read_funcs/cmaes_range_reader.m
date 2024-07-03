function [LO,UP]=cmaes_range_reader()

outputs_dir = 'cmaes_ranges/';

load (strcat(outputs_dir,'estimated_parameters_LO.txt'),'LO')
load (strcat(outputs_dir,'estimated_parameters_UP.txt'),'UP')
