function color_mat = color_paper_temDyn(color_num,MGMT,TMZ)


[Tol_bright,Tol_muted,Tol_light,Okabe_Ito] = color_pallets_def();

color_rbg_12_5TMZ_MGMT_M = color_conv_an_rgb(Okabe_Ito{2});%color_conv_an_rgb('#58CCED');
color_rgb_12_5TMZ_MGMT_P = color_conv_an_rgb(Okabe_Ito{1});%color_conv_an_rgb('#FAC200');
color_rgb_100TMZ_MGMT_M = color_conv_an_rgb(Okabe_Ito{5});%color_conv_an_rgb('#004999');
color_rgb_100TMZ_MGMT_P = color_conv_an_rgb(Tol_bright{1});%[1 0.0 0.6];
color_rgb_1024TMZ_MGMT_M = color_conv_an_rgb('#1E213D');
color_rgb_1024TMZ_MGMT_P = color_conv_an_rgb(Tol_muted{8});%color_conv_an_rgb('#D83600');

color_mat=zeros(color_num,3);

for n=1:color_num
    if MGMT(n)=='m' && (TMZ(n)==12.5 || TMZ(n)==16)
        color_mat(n,:)= color_rbg_12_5TMZ_MGMT_M;
    elseif MGMT(n)=='m' && (TMZ(n)==100 || TMZ(n)==128)
        color_mat(n,:)= color_rgb_100TMZ_MGMT_M;
    elseif MGMT(n)=='m' && TMZ(n)==1024
        color_mat(n,:)= color_rgb_1024TMZ_MGMT_M;
    elseif MGMT(n)=='p' && (TMZ(n)==12.5 || TMZ(n)==16)
        color_mat(n,:)= color_rgb_12_5TMZ_MGMT_P;
    elseif MGMT(n)=='p' && (TMZ(n)==100 || TMZ(n)==128)
        color_mat(n,:)= color_rgb_100TMZ_MGMT_P;
    elseif MGMT(n)=='p' && TMZ(n)==1024
        color_mat(n,:)= color_rgb_1024TMZ_MGMT_P;
    end
end


end

