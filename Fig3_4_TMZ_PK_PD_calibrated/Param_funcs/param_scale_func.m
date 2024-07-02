function [param0_scale,LO_scale,UP_scale] = param_scale_func(param0,LO,UP)

    param0_scale=(log(param0)-log(LO))./(log(UP)-log(LO));
    LO_scale=(log(LO)-log(LO))./(log(UP)-log(LO));
    UP_scale=(log(UP)-log(LO))./(log(UP)-log(LO));
    
end

