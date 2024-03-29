%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
offsetx = 0.25;
offsety = 0;
figure('Name',"Constant Energy Contour Plot");
set(gcf, 'Visible', 'on');
Energy_Limit = ypos;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
hold on
set(gca,'fontsize',20)
subaxis(2,6,1,'sv',0.0,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
imshow(imrotate(f,0),[], 'XData', [KX_Angle_Min+ + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', setmap);
axis xy
axis on
set(gca,'box','on')
set(gca,'tickdir','out')
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
for ii = 2:6
subaxis(2,6,ii,'sv',0.01,'sh',0.01); 
f = squeeze(B(:,Energy_Contour(ii),:))';
f = imresize(f,5);
imshow(imrotate(flipud(f),0),[], 'XData', [KX_Angle_Min KX_Angle_Max]...
    , 'YData', [KY_Angle_Min KY_Angle_Max], 'colormap', setmap);
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',12)
text(KX_Angle_Min + 0.10,KY_Angle_Max - 0.2,...
    strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
    /100)*100),'meV') ...
 ,'color','Black','BackgroundColor','White','FontSize',12, 'FontWeight','bold')
set(gca,'box','on')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii = 1:6
    if ii ==2
        ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
       axis on
       xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',18)
       set(gca,'tickdir','in')
       yticks([-1.5:0.5:1.5]+0.1);
       yticklabels([-1.5:0.5:1.5]);
    end
subaxis(2,6,6+ii); 
C = imread(strcat('Theory\T',num2str(ii),'.png'));
imshow(C,[], 'XData', [-1 1]...
    , 'YData', [KY_Angle_Min KY_Angle_Max]);
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',18)
end
hold off
saveas(gcf,strcat(Figure_Dir,SampleName,'_ECP_Reg_Theory.png'))