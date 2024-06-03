function plot_AUCHist(output_vec,origi_output,MGMT,output_type,ist_figcon,ist_fignumb,plot_tit)
if ist_figcon==1
    figure(ist_fignumb)
    clf
    NumBins= 60;
    orig_bin=1;
    h =histogram(output_vec,NumBins);
    hold on
%     h2 =histfit(output_vec,NumBins,'kernel')
    for i=1:NumBins %find the bin of original patient
        if origi_output>h.BinEdges(i) && origi_output<h.BinEdges(i+1)
            orig_bin=i;
        end
    end
%     b = bar(1:NumBins,h.Values);%color the original patient bin differently
%     b.FaceColor = 'flat';
%     b.CData(orig_bin,:) = [.5 0 .5];
    
%     pd =fitdist(output_vec,'Kernel');
%     max(output_vec)
%     surv_curv_x=linspace(0,max(output_vec),100);
%     surv_curv_distr =pdf(pd,surv_curv_x);
%     plot(surv_curv_x,surv_curv_distr)

%     origi_output_x=origi_output*ones(1,100);
%     origi_output_y=linspace(0,max(h.Values)*1.1,100);
%     plot(origi_output_x,origi_output_y,'--r','LineWidth',2);
%     
    
    if MGMT=='m'
        fMGMT=' MGMT\_M';
    elseif MGMT=='p'
        fMGMT=' MGMT\_P';
    elseif MGMT=='a'
        fMGMT=' all patients';
    end
    if output_type=='A'
        foutput_type='Surv. AUC ';
    elseif output_type=='I'
        foutput_type='IC50 ';
    end    
    title(strcat(foutput_type,',',plot_tit,fMGMT))
end
end

