function [param_scale] = scale_to10(param,LO,UP)
%%%Parameter Scaling to [0,1]
    param_scale=(log(param)-log(LO))./(log(UP)-log(LO));
end

