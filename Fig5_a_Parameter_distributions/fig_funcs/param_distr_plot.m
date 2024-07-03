function [] = param_distr_plot(param_scale_dist,param_num,opt_scale_param,min_param_scale,param_name,vec_distrtoplot)

    X3=zeros(100,param_num);
    Y3=zeros(100,param_num);
    Z3=zeros(100,param_num);
    C3=zeros(100,param_num);
    X4=zeros(100,param_num);
    Y4=zeros(100,param_num);
    Z4=zeros(100,param_num);
    X5=zeros(100,param_num);
    Y5=zeros(100,param_num);
    Z5=zeros(100,param_num);
    
%     vec_distrtoplot=[(2:16) (20:25) (27:34)];
    numb_distrtoplot=size(vec_distrtoplot,2);
    
    for i=1:param_num
        paramx_scale_dist =param_scale_dist(:,i);
        pd =fitdist(paramx_scale_dist,'Kernel');
        
        X3(:,i)=i*ones(1,100);
        Y3(:,i)=linspace(0,1,100);
        Z3(:,i) =pdf(pd,Y3(:,i));
        C3(:,i) =Z3(:,i);
        
        X4(:,i)=X3(:,i);
        Y4(:,i)=opt_scale_param(i)*ones(1,100);
        Z4(:,i)=linspace(0,max(Z3(:,i)),100);
        X5(:,i)=X3(:,i);
        Y5(:,i)=min_param_scale(i)*ones(1,100);
        Z5(:,i)=linspace(0,max(Z3(:,i)),100);
    end
    
    figure(31)
    clf
    p=fill3(X3(:,1:numb_distrtoplot),Y3(:,vec_distrtoplot),Z3(:,vec_distrtoplot),C3(:,vec_distrtoplot));
    hold on
    plot3(X4(:,1:numb_distrtoplot),Y4(:,vec_distrtoplot),Z4(:,vec_distrtoplot),'--g','LineWidth',2);
    plot3(X5(:,1:numb_distrtoplot),Y5(:,vec_distrtoplot),Z5(:,vec_distrtoplot),'--r','LineWidth',2);
    
%     p.FaceAlpha=0.9;
    view(30, 40)
    set(gca, 'XLim', [1, numb_distrtoplot])
    set(gca, 'YLim', [-0.01, 1])
    set(gca,'fontweight','bold','FontSize',16,'LineWidth',3)
    set(gcf, 'Position', [100 100 1000 600])
    xticks(1:numb_distrtoplot)
    xticklabels(param_name(vec_distrtoplot))
    yticks([0 0.5 1])
    xlabel('Parameters')

end

