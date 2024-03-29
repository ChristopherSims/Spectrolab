%KX Cuts
figure('Name','K_X Cut Plots','Position', get(0, 'Screensize'));
%set(gcf, 'Visible', 'off');
Energy_Contour = double(int16(1:Zlim/5:Zlim));
subaxis(1,6,1,'S',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,5);
imshow(squeeze(B(:,ypos,:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', flipud(cold));
%colorbar;
hold on
for ii = 1:5
DKY = (KY_Angle_Max - KY_Angle_Min)*(Energy_Contour(ii)/Zlim) + KY_Angle_Min;
line([KX_Angle_Min KX_Angle_Max],[DKY DKY], 'color', 'magenta', 'linewidth',1,'linestyle','--')
text(KX_Angle_Min,DKY + 0.1,num2str(ii),'color','magenta','FontSize',12, 'FontWeight','bold')
end
axis on
axis square
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',20)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
hold off
for ii = 2:6
subaxis(1,6,ii,'S',0.01); 
f = squeeze(B(:,:,Energy_Contour(ii-1))');
f = imresize(f,5);
imshow(f,[], 'XData', ...
    [KX_Angle_Min KX_Angle_Max], 'YData',...
    [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level], 'colormap', flipud(cold));
axis off
%axis square
text(KX_Angle_Min+0.1,-0.1,...
    strcat('cut', num2str(ii-1)) ...
 ,'color','Black','BackgroundColor','White','FontSize',12, 'FontWeight','bold')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',20)
set(gca,'fontsize',20)
hold off
end
saveas(gcf,strcat(Figure_Dir,SampleName,'_KX_Cuts.png'))