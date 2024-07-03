function legend_label = legend_writer(MGMT,TMZ,VX)

MGMTs=strings(size(MGMT'));

for n=1:size(MGMT,2)
    if MGMT(n)=='m'
        MGMTs(n,1)='-';
    else
        MGMTs(n,1)='+';
    end
end

% TMZs=num2str(TMZ','%3.1f')
TMZs=string(TMZ');
VXs=string(1e3*VX');
% VXs=num2str(1e3*VX','%.0f');
legend_label=strcat('MGMT',MGMTs,',TMZ=',TMZs,'nM,VX=',VXs,'nM');

end

