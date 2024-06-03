function [LO,UP] = cmaes_search_space(orig_param,param0)

LO=zeros(size(param0));
UP=zeros(size(param0));

LO(1:end)=param0(1:end)*0.8;
UP(1:end)=param0(1:end)*1.2;

if LO(1)<orig_param(1)*0.2
    LO(1)=orig_param(1)*0.2;
end
if UP(1)>orig_param(1)*5
    UP(1)=orig_param(1)*5;
end

if LO(2)<orig_param(2)*0.2
    LO(2)=orig_param(2)*0.2;
end
if UP(2)>orig_param(2)*5
    UP(2)=orig_param(2)*5;
end

if LO(3)<orig_param(3)*0.2
    LO(3)=orig_param(3)*0.2;
end
if UP(3)>orig_param(3)*5
    UP(3)=orig_param(3)*5;
end

if LO(4)<orig_param(4)*0.2
    LO(4)=orig_param(4)*0.2;
end
if UP(4)>orig_param(4)*5
    UP(4)=orig_param(4)*5;
end

if LO(5)<orig_param(5)*0.2
    LO(5)=orig_param(5)*0.2;
end
if UP(5)>orig_param(5)*5
    UP(5)=orig_param(5)*5;
end

if LO(6)<orig_param(6)*0.2
    LO(6)=orig_param(6)*0.2;
end
if UP(6)>orig_param(6)*5
    UP(6)=orig_param(6)*5;
end

if LO(7)<orig_param(7)*0.2
    LO(7)=orig_param(7)*0.2;
end
if UP(7)>orig_param(7)*6
    UP(7)=orig_param(7)*6;
end

if LO(8)<orig_param(8)*0.2
    LO(8)=orig_param(8)*0.2;
end
if UP(8)>orig_param(8)*5
    UP(8)=orig_param(8)*5;
end

if LO(9)<orig_param(9)*0.2
    LO(9)=orig_param(9)*0.2;
end
if UP(9)>orig_param(9)*5
    UP(9)=orig_param(9)*5;
end

if LO(10)<orig_param(10)*0.15
    LO(10)=orig_param(10)*0.15;
end
if UP(10)>orig_param(10)*5
    UP(10)=orig_param(10)*5;
end

if LO(11)<orig_param(11)*0.2
    LO(11)=orig_param(11)*0.2;
end
if UP(11)>orig_param(11)*5
    UP(11)=orig_param(11)*5;
end

if LO(12)<orig_param(12)*0.2
    LO(12)=orig_param(12)*0.2;
end
if UP(12)>orig_param(12)*6
    UP(12)=orig_param(12)*6;
end

if LO(13)<orig_param(13)*0.15
    LO(13)=orig_param(13)*0.15;
end
if UP(13)>orig_param(13)*5
    UP(13)=orig_param(13)*5;
end

if LO(14)<orig_param(14)*0.2
    LO(14)=orig_param(14)*0.2;
end
if UP(14)>orig_param(14)*5
    UP(14)=orig_param(14)*5;
end

if LO(15)<orig_param(15)*0.2
    LO(15)=orig_param(15)*0.2;
end
if UP(15)>orig_param(15)*6
    UP(15)=orig_param(15)*6;
end

end

