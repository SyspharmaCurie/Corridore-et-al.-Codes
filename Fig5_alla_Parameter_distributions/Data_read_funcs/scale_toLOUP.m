function [param] = scale_toLOUP(param_scale,LO,UP)
%Parameter Scaling to [LO,UP]
param=LO.*(UP./LO).^param_scale(:,:);

end

