%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
offsetx = 0.25;
offsety = 0.4;
figure('Name',"Constant Energy Contour Plot");%,'Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'on');
Energy_Limit = ypos;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
hold on
set(gca,'fontsize',20)
title('Normal')
subaxis(1,5,1,'sv',0.05,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
imshow(f,[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap', bone);
title('Normal')
axis xy
axis on
set(gca,'box','on')
set(gca,'tickdir','out')
%axis square
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',20,'color','k')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
%%%% 2
subaxis(1,5,2,'sv',0.01,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
h = fspecial('sobel');
fyfilt = imfilter( double(f) , h , 'replicate');
fxfilt = imfilter( double(f) , h' , 'replicate');
ftfilt = sqrt(fyfilt.^2+ fxfilt.^2);
imshow(flipud(fyfilt),[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap',cold);
title('Sobel')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
daspect([1 1 1])
axis on
    set(gca,'yticklabel',{[]})
    
%%%% 3

subaxis(1,5,3,'sv',0.01,'sh',0.01); 

f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
h = fspecial('prewitt');
fyfilt = imfilter( double(f) , h , 'replicate');
fxfilt = imfilter( double(f) , h' , 'replicate');
ftfilt = sqrt(fyfilt.^2+ fxfilt.^2);
imshow(flipud(fyfilt),[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap',colormap(flipud(gray)));
title('Prewitt')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
daspect([1 1 1])
axis on
    set(gca,'yticklabel',{[]})
%%%%% 4

subaxis(1,5,4,'sv',0.01,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
h = fspecial('log');

fyfilt = imfilter( double(f) , h , 'replicate');
fxfilt = imfilter( double(f) , h' , 'replicate');
ftfilt = sqrt(fyfilt.^2+ fxfilt.^2);
imshow(flipud(fyfilt),[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap',colormap(flipud(gray)));
title('LoG')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
daspect([1 1 1])
axis on
    set(gca,'yticklabel',{[]})
    %%%%% 5
  
subaxis(1,5,5,'sv',0.01,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
f = imresize(f,10);
h = fspecial('laplacian');
fyfilt = imfilter( double(f) , h , 'replicate');
fxfilt = imfilter( double(f) , h' , 'replicate');
ftfilt = sqrt(fyfilt.^2+ fxfilt.^2);
imshow(flipud(fyfilt),[], 'XData', [KX_Angle_Min + offsetx KX_Angle_Max+ offsetx]...
    , 'YData', [KY_Angle_Min + offsety KY_Angle_Max + offsety], 'colormap',colormap(flipud(gray)));
 title('Laplacian')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
daspect([1 1 1])
axis on
    set(gca,'yticklabel',{[]})
%saveas(gcf,strcat(Figure_Dir,SampleName,'_ECP_2nd.png'))
