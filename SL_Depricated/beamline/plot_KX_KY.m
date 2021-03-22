% Create plot with fermi level Kx cut Ky cut and binding energy
figure();
set(gcf, 'Visible', 'on');
subplot(2,2,1)
imshow(squeeze(B(:,ypos,:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
DKY = (KY_Angle_Max - KY_Angle_Min)*(zpos/Zlim) + KY_Angle_Min;
DKX = (KX_Angle_Max - KX_Angle_Min)*(xpos/Xlim) + KX_Angle_Min;
axis([KX_Angle_Min KX_Angle_Max KY_Angle_Min KY_Angle_Max])
line([KX_Angle_Min KX_Angle_Max],[DKY DKY], 'color', 'white', 'linewidth',1,'linestyle','--')
line([DKX DKX],[KY_Angle_Min KY_Angle_Max], 'color', 'white', 'linewidth', 1,'linestyle','--')
axis on
%axis square
title('Fermi Surface')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
subplot(2,2,2)
imshow(squeeze(B(:,:,zpos)'),[], 'XData', ...
    [KY_Angle_Min KY_Angle_Max], 'YData',...
    [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level], 'colormap', setmap);
axis on
%axis square
title('KX plot')
ylabel('Enegy (EV)')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
subplot(2,2,3)

imshow(squeeze(B(xpos,:,:)),[], 'XData',...
    [KX_Angle_Min KX_Angle_Max], 'YData',...
    [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level], 'colormap', setmap);
axis on
%axis square
title('Ky plot')
ylabel('Enegy (EV)')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
subplot(2,2,4)
M = mean(squeeze(B(:,:,zpos)));
plot(M,'linewidth',2)
title('Binding Energy')
ylabel('Intensity (Arb. units.)')
xlabel('Enegy (EV)')
line([ypos ypos],[0 max(M)], 'color' , 'red', 'linewidth', 2)
axis on
hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_3plot.png'))