%GUI X CUTS
% figure('Position', get(0, 'Screensize'));
function [] = GuiXCut(KxPos,ParentFig) 
global KY_Angle_Max KY_Angle_Min KX_Angle_Max ...
    KX_Angle_Min setmap Ang B zpos Zlim xpos Xlim Ymax Ymin ypos Fermi_Level;
F_Shift = 0.45;
Kx_Shift = 0.35;
imshow(squeeze(B(KxPos,:,:)),[], 'XData',...
    [KX_Angle_Min+Kx_Shift,  KX_Angle_Max+Kx_Shift], 'YData',...
    [abs(Ymin) - Fermi_Level + F_Shift, abs(Ymax)- Fermi_Level + F_Shift],...
    'colormap', setmap, 'Parent', ParentFig);
axis(ParentFig,'on')
axis(ParentFig,'tight')
set(ParentFig,'box','on')
set(ParentFig,'tickdir','out')
axis(ParentFig,'square')
%axis square
%title('KX plot')
ylabel(ParentFig,'Energy (EV)')
xlabel(ParentFig,strcat('K_X','(1/',Ang,')'))
hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_3plot.png'))
end

