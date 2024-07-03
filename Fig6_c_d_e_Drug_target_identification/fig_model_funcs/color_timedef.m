function color_mat = color_timedef(MGMT,time)

sim_num=size(MGMT,2);
% color_mat=zeros(sim_num,3);

for sim_indx=1:sim_num
    switch MGMT(sim_indx)
        case 'm'
            switch time(sim_indx)
                case 3
                    color_mat(sim_indx,:)=([0.62 0.66 0.95]+[0.8 0.9 0.95])/2;
                case 24
                    color_mat(sim_indx,:)=[0.8 0.9 0.95];
                case 72
                    color_mat(sim_indx,:)=[0.45 0.53 0.91];
                case 96
                    color_mat(sim_indx,:)=color_conv_an_rgb('#0D98BA');%[0.20 0.3 0.83];
                case 120
                    color_mat(sim_indx,:)=color_conv_an_rgb('#006A6E');
                case 144
                    color_mat(sim_indx,:)=[0.1 0.2 0.7];
            end
        case 'p'
            switch time(sim_indx)
                case 3
                    color_mat(sim_indx,:)=(color_conv_an_rgb('#FFDA25')+color_conv_an_rgb('#FF7514'))/2;
                case 24
                    color_mat(sim_indx,:)=color_conv_an_rgb('#FFDA25');
                case 72
                    color_mat(sim_indx,:)=color_conv_an_rgb('#FF7514');
                case 96
                    color_mat(sim_indx,:)=[1 0.0 0.6];
                case 120
                    color_mat(sim_indx,:)=[1 0.40 0.4];
                case 144
                    color_mat(sim_indx,:)=color_conv_an_rgb('#D83600');
            end
    end
end
end

%24 [0.8 0.9 0.95];
%48 [0.62 0.66 0.95];
%72 [0.45 0.53 0.91];
%96 %[0.30 0.43 0.87];
%120 %[0.20 0.3 0.83];
%144 [0.1 0.2 0.7];
