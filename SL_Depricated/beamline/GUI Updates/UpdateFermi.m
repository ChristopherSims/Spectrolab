function [] = UpdateFermi(ypos,ParentFig)
global KY_Angle_Max KY_Angle_Min KX_Angle_Max ...
    KX_Angle_Min offsetx offsety setmap Ang B;
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
f = imrotate(f,0,'crop');
hold on
imshow(f,[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
 , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', setmap,'Parent',ParentFig);
set(ParentFig,'fontsize',14)
kxvec = round((KX_Angle_Min:abs(KX_Angle_Max-KX_Angle_Min)/2:KX_Angle_Max)',1);
kyvec = round((KY_Angle_Min:abs(KY_Angle_Max-KY_Angle_Min)/2:KY_Angle_Max)',1);
xticks(ParentFig,[1:size(f,2)/2:size(f,2),size(f,2)])
yticks(ParentFig,[1:size(f,1)/2:size(f,1), size(f,1)])
xticklabels(ParentFig,round(kxvec+offsetx,1))
yticklabels(ParentFig,round(kyvec+offsety,1))
%axis(ParentFig,'xy')
axis(ParentFig,'on')
axis(ParentFig,'tight')
axis(ParentFig,'square')
set(ParentFig,'box','on')
set(ParentFig,'tickdir','out')
ylabel(ParentFig,strcat('K_x','(1/',Ang,')'),'FontSize',20,'color','k')
xlabel(ParentFig,strcat('K_y','(1/',Ang,')'),'FontSize',20)
hold off
end

% hold on
%             imshow(flipud(f),[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
%              , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', setmap,'Parent',app.Fermi);
%             set(app.Fermi,'fontsize',14)
%             kxvec = round((KX_Angle_Min:abs(KX_Angle_Max-KX_Angle_Min)/2:KX_Angle_Max)',1);
%             kyvec = round((KY_Angle_Min:abs(KY_Angle_Max-KY_Angle_Min)/2:KY_Angle_Max)',1);
%             xticks(app.Fermi,[1:size(f,2)/2:size(f,2),size(f,2)])
%             yticks(app.Fermi,[1:size(f,1)/2:size(f,1), size(f,1)])
%             xticklabels(app.Fermi,round(kxvec+offsetx,1))
%             yticklabels(app.Fermi,round(kyvec+offsety,1))
%             axis(app.Fermi,'xy')
%             axis(app.Fermi,'on')
%             axis(app.Fermi,'tight')
%             set(app.Fermi,'box','on')
%             set(app.Fermi,'tickdir','out')
%             ylabel(app.Fermi,strcat('K_x','(1/',Ang,')'),'FontSize',20,'color','k')
%             xlabel(app.Fermi,strcat('K_y','(1/',Ang,')'),'FontSize',20)
%             hold off