%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
global offsetx offsety
offsetx = 0.1; %xaxis
offsety = -0.4; % yaxis
rotate = 0;
cm = flipud(gray);
roll = -56;
vertical_space = 0.02;
%aspect = 1-abs(KX_Angle_Max-KX_Angle_Min)/abs(KY_Angle_Max-KY_Angle_Min);
%aspect = 1;
%figure('Name',"Constant Energy Contour Plot",'Position',get(0, 'Screensize'));
figure(1)
set(gcf, 'Visible', 'on');
Energy_Limit = 200;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
colormap(flipud(cm))
hold on
set(gca,'fontsize',18)
%subaxis(1,6,1,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
f_y = imgaussfilt(f_y);
contourplot(f_y,rotate)
camroll(roll)
%axis on
%set(gca,'xtick',[])
daspect([1 0.1 1])
%ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
for ii = 2:6
figure(ii)
%subaxis(1,6,ii,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,Energy_Contour(ii),:))';
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
f_y = imgaussfilt(f_y);
contourplot(f_y,rotate)
camroll(roll)
%daspect([1 aspect 1])
axis off
box off
set(gca,'xtick',[])
set(gca,'ytick',[])
daspect([1 0.1 1])
% text(400,550,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),' meV') ...
%  ,'color','Black','FontSize',24, 'FontWeight','bold')
colormap(flipud(cm))
end

% %subaxis(2,6,7,'sv',vertical_space,'sh',0.01); 
% figure(7)
% f = squeeze(B(:,ypos,:))';
% h_Sobel = fspecial ('sobel');
% f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
% contourplot(f_y,rotate)
% colormap(flipud(gray))
% % ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
% % xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',18,'color','k')
% axis off
% camroll(-60)
% % set(gca,'box','on')
% % set(gca,'tickdir','out')
% for ii = 2:6
% %subaxis(2,6,6+ii,'sv',vertical_space,'sh',0.01); 
% figure(ii+6)
% f = squeeze(B(:,Energy_Contour(ii),:))';
% h_Sobel = fspecial ('sobel');
% f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
% contourplot(f_y,rotate)
% camroll(-60)
% axis off
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% % text(-0.9,70,...
% %     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
% %     /100)*100),'meV') ...
% %  ,'color','Magenta','FontSize',12, 'FontWeight','bold')
% colormap(flipud(gray))
% end
% hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_Energy_Contour11.png'))

