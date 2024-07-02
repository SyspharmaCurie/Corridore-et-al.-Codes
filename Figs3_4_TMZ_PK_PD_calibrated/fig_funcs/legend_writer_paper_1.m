function legend_label = legend_writer_paper_1(MGMT,TMZ)

MGMTs=strings(size(MGMT'));

for n=1:size(MGMT,2)
    if MGMT(n)=='m'
        MGMTs(n,1)='-';
    else
        MGMTs(n,1)='+';
    end
end

TMZs=string(TMZ');
legend_label=strcat('MGMT',MGMTs,',TMZ=',TMZs,'nM');

end

