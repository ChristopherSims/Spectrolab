function cutplot(mat)
global E KY_Angle_Max KY_Angle_Min KX_Angle_Max KX_Angle_Min eV ypos;
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
mat = imresize(mat,10);
imagesc(mat)
set(gca,'fontsize',14)
%colormap(setmap)
%daspect([1 aspect 1])
xticks([1:size(mat,2)/5:size(mat,2),size(mat,2)-1])
yticks([1:size(mat,1)/5:size(mat,1), size(mat,1)])

axis xy
axis off
set(gca,'box','on')
set(gca,'tickdir','out')
end

