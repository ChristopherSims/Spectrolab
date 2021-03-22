%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
global offsetx offsety
offsetx = 0.1; %xaxis
offsety = -0.4; % yaxis
rotate = 0;
vertical_space = 0.02;
%aspect = 1-abs(KX_Angle_Max-KX_Angle_Min)/abs(KY_Angle_Max-KY_Angle_Min);
%aspect = 1;
figure('Name',"Constant Energy Contour Plot");
set(gcf, 'Visible', 'on');
Energy_Limit = size(B,2);
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
hold on
set(gca,'fontsize',18)
subaxis(2,6,1,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
contourplot(f,rotate)
axis on
set(gca,'xtick',[])
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
for ii = 2:6
subaxis(2,6,ii,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,Energy_Contour(ii),:))';
contourplot(f,rotate)
%daspect([1 aspect 1])
axis on
set(gca,'xtick',[])
set(gca,'ytick',[])
% text(400,550,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),' meV') ...
%  ,'color','Black','FontSize',24, 'FontWeight','bold')

end
subaxis(2,6,7,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,ypos,:))';
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
contourplot(f_y,rotate)
colormap(flipud(gray))
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',18,'color','k')
axis on
set(gca,'box','on')
set(gca,'tickdir','out')

for ii = 2:6
subaxis(2,6,6+ii,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,Energy_Contour(ii),:))';
f = imresize(f,10);
h_Sobel = fspecial('sobel');
%f_y = edge(double(f),'canny');
f_y = imfilter(double(f), h_Sobel,'replicate');
%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%
contourplot(smooth(f_y),rotate)
axis on
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',18,'color','k')
% text(-0.9,70,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),'meV') ...
%  ,'color','Magenta','FontSize',12, 'FontWeight','bold')
end
hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_Energy_Contour.png'))

