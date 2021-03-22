% figure('Position', get(0, 'Screensize'));
figure
set(gcf, 'Visible', 'on');
% imshow(squeeze(B(:,ypos,:))',[], 'XData', [KX_Angle_Min KX_Angle_Max]...
%     , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
DKY = (KY_Angle_Max - KY_Angle_Min)*(zpos/Zlim) + KY_Angle_Min;
DKX = (KX_Angle_Max - KX_Angle_Min)*(xpos/Xlim) + KX_Angle_Min;
axis([KX_Angle_Min KX_Angle_Max KY_Angle_Min KY_Angle_Max])
line([KX_Angle_Min KX_Angle_Max],[DKY DKY], 'color', 'white', 'linewidth',1,'linestyle','--')
line([DKX DKX],[KY_Angle_Min KY_Angle_Max], 'color', 'white', 'linewidth', 1,'linestyle','--')

axis on
F_Shift = 0.45;
Ky_Shift = 0.35;
imshow(squeeze(B(100:328,:,16)'),[], 'XData', ...
    [KY_Angle_Min + Ky_Shift , KY_Angle_Max + Ky_Shift], 'YData',...
    [abs(Ymin) - Fermi_Level+F_Shift, abs(Ymax)- Fermi_Level+F_Shift], 'colormap', setmap);
axis on
set(gca,'fontsize',20)
%axis square
%title('KX plot')
ylabel('Energy (EV)')
xlabel(strcat('K_y','(1/',Ang,')'))
hold off
colormap(flipud(gray))
%saveas(gcf,strcat(dir,sample,'_',file_no,'_3plot.png'))