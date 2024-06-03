function [LO,UP] = cmaes_search_space(param0)

% LO=0.0001*ones(size(param0));
% UP=ones(size(param0));

LO=0.8*param0;
if LO(1)<0.0001
    LO(1)=0.0001;
end
if LO(2)<0.0001
    LO(2)=0.0001;
end

UP=1.2*param0;
if UP(1)>1
    UP(1)=1;
end
if UP(2)>1
    UP(2)=1;
end



end

