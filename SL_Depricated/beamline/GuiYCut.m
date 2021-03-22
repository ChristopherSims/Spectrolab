% figure('Position', get(0, 'Screensize'));
function [] = GuiYCut(KyPos,ParentFig) 
global KY_Angle_Max KY_Angle_Min KX_Angle_Max ...
    KX_Angle_Min setmap Ang B zpos Zlim xpos Xlim Ymax Ymin ypos;
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
imshow(squeeze(B(:,:,KyPos)'),[], 'XData', ...
    [KY_Angle_Min + Ky_Shift , KY_Angle_Max + Ky_Shift], 'YData',...
    [abs(Ymin) - ypos, abs(Ymax)- ypos],...
    'colormap', setmap, 'Parent', ParentFig);
%axis(ParentFig,'xy')
axis(ParentFig,'on')
axis(ParentFig,'tight')
set(ParentFig,'box','on')
set(ParentFig,'tickdir','out')
axis(ParentFig,'square')
%axis square
%title('KX plot')
ylabel(ParentFig,'Energy (EV)')
xlabel(ParentFig,strcat('K_y','(1/',Ang,')'))
hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_3plot.png'))
end

