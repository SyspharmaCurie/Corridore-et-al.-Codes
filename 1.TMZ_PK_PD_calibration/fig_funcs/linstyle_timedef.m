function linstyle_mat = linstyle_timedef(MGMT,time)

sim_num=size(MGMT,2);

for sim_indx=1:sim_num
    switch MGMT(sim_indx)
        case 'm'
            switch time(sim_indx)
                case 3
                    linstyle_mat(sim_indx,:)='-';
                case 24
                    linstyle_mat(sim_indx,:)='-';
                case 72
                    linstyle_mat(sim_indx,:)='-';
                case 96
                    linstyle_mat(sim_indx,:)='--';
                case 120
                    linstyle_mat(sim_indx,:)='--';
                case 144
                    linstyle_mat(sim_indx,:)='-';
            end
        case 'p'
            switch time(sim_indx)
                case 3
                    linstyle_mat(sim_indx,:)='-';
                case 24
                    linstyle_mat(sim_indx,:)='-';
                case 72
                    linstyle_mat(sim_indx,:)='-';
                case 96
                    linstyle_mat(sim_indx,:)='--';
                case 120
                    linstyle_mat(sim_indx,:)='--';
                case 144
                    linstyle_mat(sim_indx,:)='-';
            end
    end
end
end