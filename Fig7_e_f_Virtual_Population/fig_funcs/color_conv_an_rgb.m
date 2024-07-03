function [color_rgb] = color_conv_an_rgb(color_an)

color_rgb = sscanf(color_an(2:end),'%2x%2x%2x',[1 3])/255;

end

