% Create and save fermi surface plot
figure('Name', "Fermi Surface",'Position', get(0, 'Screensize'));
Ang = char(197);
sample = 'FS';
imagepath = strcat('Data\',sample);
dir = strcat('Data\',sample,'\','Figures','\');
if exist(dir) ~= 7
mkdir(dir)
end
file_no = '6';
A = IBWread(strcat(imagepath,'\f000',file_no,'.ibw'));
B = A.y;
ypos=100;

Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));

f = squeeze(B(:,ypos,:));
f = normalize(imresize(f,10));
offsety = 0;
offsetx = 0.25;
aspect = abs(KX_Angle_Max-KX_Angle_Min)/abs(KY_Angle_Max-KY_Angle_Min);
f = imrotate(f,0,'bilinear');
imagesc(f)
colormap(gray)
%daspect([1 1-aspect 1])
%caxis([0 3])
% kxvec = round((KX_Angle_Min:abs(KX_Angle_Max-KX_Angle_Min)/6:KX_Angle_Max)',2);
% kyvec =  round((KY_Angle_Min:abs(KY_Angle_Max-KY_Angle_Min)/5:KY_Angle_Max)',2);
% xticks([1:size(f,2)/6:size(f,2),size(f,2)-1])
% yticks([1:size(f,1)/5:size(f,1), size(f,1)])
% xticklabels(kxvec)
% yticklabels(kyvec)
axis xy
axis on
set(gca,'box','on')
set(gca,'tickdir','in')
%colorbar;
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',24)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',24)
set(gca,'fontsize',20)
%colormapeditor
saveas(gcf,strcat(dir,sample,'_',file_no,'_Fermi_Surface.png'))