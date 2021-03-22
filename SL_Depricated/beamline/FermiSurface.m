% Create and save fermi surface plot
figure('Name', "Fermi Surface");
global KY_Angle_Max KY_Angle_Min KX_Angle_Max KX_Angle_Min offsetx offsety;
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
f = squeeze(B(:,ypos,:))';
f = normalize(imresize(f,10));
f=imrotate(f,0,'crop');
offsety = 0;
offsetx = 0.25;
aspect = abs(KX_Angle_Max-KX_Angle_Min)/abs(KY_Angle_Max-KY_Angle_Min);
mat = imrotate(f,0,'bilinear');
%imshow(f) 
imagesc(mat)
colormap(setmap)
daspect([1 0.2 1])
set(gca,'fontsize',14)
kxvec = round((KX_Angle_Min:abs(KX_Angle_Max-KX_Angle_Min)/2:KX_Angle_Max)',1);
kyvec =  round((KY_Angle_Min:abs(KY_Angle_Max-KY_Angle_Min)/2:KY_Angle_Max)',1);
xticks([1:size(mat,2)/2:size(mat,2),size(mat,2)])
yticks([1:size(mat,1)/2:size(mat,1), size(mat,1)])
xticklabels(round(kxvec+offsetx,1))
yticklabels(round(kyvec+offsety,1))
axis xy
axis on
set(gca,'box','on')
set(gca,'tickdir','out')
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',20,'color','k')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
saveas(gcf,strcat(Figure_Dir,SampleName,'_Fermi.png'))