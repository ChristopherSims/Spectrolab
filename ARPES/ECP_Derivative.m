%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
offsetx = 0.25;
offsety = 0.4;
figure('Name',"Constant Energy Contour Plot");%,'Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'on');
Energy_Limit = 200;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
hold on
set(gca,'fontsize',20)
subaxis(1,6,1,'sv',0.05,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
imshow(f_y,[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', bone);
axis xy
axis on
set(gca,'box','on')
set(gca,'tickdir','out')
%axis square
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',20,'color','k')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
for ii = 2:6
subaxis(1,6,ii,'sv',0.01,'sh',0.01); 
f = squeeze(B(:,Energy_Contour(ii),:))';
f = imresize(f,10);
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
imshow(flipud(f_y),[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', bone);
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
axis on
    set(gca,'yticklabel',{[]})
% text(KX_Angle_Min + 0.10,KY_Angle_Max - 0.2,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),'meV') ...
%  ,'color','Black','BackgroundColor','White','FontSize',12, 'FontWeight','bold')
end
saveas(gcf,strcat(Figure_Dir,SampleName,'_ECP_2nd.png'))
