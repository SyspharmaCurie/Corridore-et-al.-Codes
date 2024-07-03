function color_mat = color_TMZVXdef(color_num,MGMT,TMZ,TMZout0_MAX,VX)


TMZ_color=0.2+(1-0.2)*TMZ/TMZout0_MAX;
VX_Jack=[0 0.008 0.040 0.200 1.];
indVX=zeros(size(VX));

for n=1:size(VX,2)
    indVX(n)=find(abs(VX(n)-VX_Jack)<1e-9);
end

VX_color=(indVX-1)*1/4;

TMZ_base_color_mat=zeros(color_num,4);
VX_base_color_mat=zeros(color_num,4);
MarkerEdgeColor_mat=zeros(color_num,3);

for n=1:color_num
    
    if MGMT(n)=='m'
        TMZ_base_color_mat(n,:)=[0 0 1 0];
        VX_base_color_mat(n,:)=[0 1 0 0]*VX_color(n);
        MarkerEdgeColor_mat(n,:)=[0 0 1];
    else
        TMZ_base_color_mat(n,:)=[1 0 0 0];
        VX_base_color_mat(n,:)=[0 1 0 0]*VX_color(n);
        MarkerEdgeColor_mat(n,:)=[1 0 0];
    end
end

TMZ_base_color_mat(:,4)=TMZ_color';

color_mat=TMZ_base_color_mat+VX_base_color_mat;
x=find(TMZ==12.5);
x=find(TMZ==15);
if ~isempty(x)
    for i=1:size(x,2)
        color_mat(x(i),:)=[1 0 1 1];
    end
end

x=find(TMZ==20);
if ~isempty(x)
    for i=1:size(x,2)
        color_mat(x(i),:)=[0 1 1 1];
    end
end

end

