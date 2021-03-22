function contourplot(mat,rotate)
global KY_Angle_Max KY_Angle_Min KX_Angle_Max KX_Angle_Min offsetx offsety;
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
box on
mat = imresize(mat,10);
mat=imrotate(mat,rotate,'bilinear');
imagesc(mat)
set(gca,'fontsize',14)
%colormap(setmap)
kxvec = round((KX_Angle_Min:abs(KX_Angle_Max-KX_Angle_Min)/2:KX_Angle_Max)',1);
kyvec =  round((KY_Angle_Min:abs(KY_Angle_Max-KY_Angle_Min)/2:KY_Angle_Max)',1);
xticks([1:size(mat,2)/2:size(mat,2),size(mat,2)])
yticks([1:size(mat,1)/2:size(mat,1), size(mat,1)])
xticklabels(round(kxvec+offsetx,1))
yticklabels(round(kyvec+offsety,1))
axis xy
axis off
set(gca,'box','on')
set(gca,'tickdir','out')
end

