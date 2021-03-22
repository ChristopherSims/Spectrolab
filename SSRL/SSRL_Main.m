% SSRL DATA
clf;
close all;
clc;
Ang = char(197);
%data = info.
%info = h5info('EMB1_00027.h5','/Data/Count');
%h5disp('EMB1_00027.h5')
counts = h5read('EMB1_00027.h5','/Data/Count');
Resolution = h5readatt('EMB1_00027.h5','/Resolution','TotalResolution');%mev
PassE = h5readatt('EMB1_00027.h5','/Measurement', 'PassEnergy'); % Ev
% Z Variables
zOffset = h5readatt('EMB1_00027.h5','/Data/Axes0', 'Offset');
Dz =  h5readatt('EMB1_00027.h5','/Data/Axes0', 'Delta'); %ev
zmin = h5readatt('EMB1_00027.h5','/Data/Axes0', 'Minimum'); % ev
zmax = h5readatt('EMB1_00027.h5','/Data/Axes0', 'Maximum'); % ev
% X Variables
xOffset = h5readatt('EMB1_00027.h5','/Data/Axes1', 'Offset');
Dx = h5readatt('EMB1_00027.h5','/Data/Axes1', 'Delta'); % deg
xmin = h5readatt('EMB1_00027.h5','/Data/Axes1', 'Minimum'); % deg
xmax = h5readatt('EMB1_00027.h5','/Data/Axes1', 'Maximum'); % deg
% Y Variables
yOffset = h5readatt('EMB1_00027.h5','/Data/Axes2', 'Offset');
Dy = h5readatt('EMB1_00027.h5','/Data/Axes2', 'Delta'); % deg
ymin = h5readatt('EMB1_00027.h5','/Data/Axes2', 'Minimum'); % deg
ymax = h5readatt('EMB1_00027.h5','/Data/Axes2', 'Maximum'); % deg
%Sample_Temp = 
% X = Ky, Y = Kx, Z = energy(eV)
Rval = 10; %image resize val


subplot(1,2,1)
%KY CUT
yval = 28 0;
Kcut = squeeze(counts(:,yval,:))';
%xang= xval*Dx + xOffset;
yang= yval*Dx + xOffset;
Kcut = imresize(Kcut,Rval); % improve resolution
hold on
%axis square
%title(strcat(num2str(Energy), " (eV)"))
%(flipud(gray))
imshow(Kcut,[], 'XData', [ymin ymax]...
    , 'YData', [zmin zmax], 'colormap',(flipud(gray)));
xlabel(strcat('K_y','(',Ang,'^{-1})'),'FontSize',20)
ylabel(strcat('E - E_F','(eV)'),'FontSize',20)
axis xy
axis on
axis square
set(gca,'box','on')
xlim([-15 15])
%xlim([xmin xmax])
ylim([zmin zmax])
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% xval = 75;
% Kcut = squeeze(counts(xval,:,:))';
% %xang= xval*Dx + xOffset;
% xang= xval*Dy + yOffset;
% Kcut = imresize(Kcut,Rval); % improve resolution
% hold on
% %axis square
% %title(strcat(num2str(Energy), " (eV)"))
% %(flipud(gray))
% imshow(Kcut,[], 'XData', [xmin xmax]...
%     , 'YData', [zmin zmax], 'colormap',(flipud(gray)));
% xlabel(strcat('K_x','(',Ang,'^{-1})'),'FontSize',20)
% ylabel(strcat('E - E_F','(eV)'),'FontSize',20)
% axis xy
% axis on
% axis square
% set(gca,'box','on')
% xlim([-15 15])
% %xlim([xmin xmax])
% ylim([zmin zmax])
% hold off
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Energy Cut %%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,2)
%colormap(flipud(gray))
Zval = 265;
Ecut = squeeze(counts(:,:,Zval));
Energy = Zval*Dz + zOffset;
Ecut = imresize(Ecut,Rval); % improve resolution
hold on
axis square
title(strcat(num2str(Energy), " (eV)"))
%(flipud(gray))
%imagesc(Ecut)
imshow(Ecut,[], 'XData', [xmin xmax]...
    , 'YData', [ymin ymax], 'colormap',(flipud(gray)));
%line([xmin xmax],[xang xang], 'color', 'red', 'linewidth',2) %KX
line([yang yang],[ymin ymax], 'color', 'red', 'linewidth',2) %KY
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',20)
ylabel(strcat('K_y','(1/',Ang,')'),'FontSize',20)
axis xy
axis on
set(gca,'box','on')
xlim([xmin xmax])
ylim([ymin ymax])
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%