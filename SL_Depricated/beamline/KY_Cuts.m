%Ky Cuts
figure('Name', "K_Y Cut Plots",'Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'on');
Energy_Contour = double(int16(1:Xlim/5:Xlim));
subaxis(1,6,1,'S',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,5);
imshow(f,[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
%colorbar;
hold on
for ii = 1:5
DKX = (KX_Angle_Max - KX_Angle_Min)*(Energy_Contour(ii)/Xlim) + KX_Angle_Min;
line([DKX DKX],[KY_Angle_Min KY_Angle_Max], 'color', 'white', 'linewidth', 1,'linestyle','--')
text(DKX,KY_Angle_Min + 0.2,num2str(ii),'color','White','FontSize',12, 'FontWeight','bold')
% DKX = (KY_Angle_Max - KY_Angle_Min)*(Energy_Contour(ii)/Xlim) + KY_Angle_Min;
% line([KX_Angle_Min KX_Angle_Max],[DKX DKX], 'color', 'white', 'linewidth',1,'linestyle','--')
% text(KX_Angle_Min,DKX + 0.1,num2str(ii),'color','White','FontSize',12, 'FontWeight','bold')
end
axis on
axis square
title(' Fermi level')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',20)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
hold off
for ii = 2:6
subaxis(1,6,ii,'S',0.01); 
f = squeeze(B(int16(Energy_Contour(ii-1)),:,:));
f = imresize(f,5);
imshow(f,[], 'XData',...
    [KY_Angle_Min KY_Angle_Max], 'YData',...
     [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level], 'colormap', setmap);
axis off
%axis square
text(KY_Angle_Min+0.1,-0.1,...
    strcat('cut', num2str(ii-1)) ...
 ,'color','Black','BackgroundColor','White','FontSize',12, 'FontWeight','bold')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
set(gca,'fontsize',20)
hold off
end
saveas(gcf,strcat(Figure_Dir,SampleName,'_KY_Cuts.png'))