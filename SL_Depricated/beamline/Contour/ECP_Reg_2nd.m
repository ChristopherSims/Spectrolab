%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constant Energy Contour Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%
global offsetx offsety
offsetx = 0.3; %xaxis
offsety = -0.1; % yaxis
rotate = 0;
vertical_space = 0.02;
%aspect = 1-abs(KX_Angle_Max-KX_Angle_Min)/abs(KY_Angle_Max-KY_Angle_Min);
%aspect = 1;
figure('Name',"Constant Energy Contour Plot");
set(gcf, 'Visible', 'on');
Energy_Limit = 200;
Energy_Cut = 1:int16(Energy_Limit/5):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
hold on
set(gca,'fontsize',8)
subaxis(2,5,1,'sv',vertical_space,'sh',0.01); 
%f = squeeze(B(30:348,ypos,1:30))';
f = squeeze(B(:,ypos,:))';
f = imresize(f,10); 
contourplot(f,rotate)
axis on
set(gca,'xtick',[])
ylabel(strcat('k_x','(',Ang,'^{-1})'),'FontSize',18,'color','k')
for ii = 2:5
subaxis(2,5,ii,'sv',vertical_space,'sh',0.01);
%f = squeeze(B(30:348,Energy_Contour(ii),1:30))';
f = squeeze(B(:,Energy_Contour(ii),:))';
f = imresize(f,10); 
colormap(cold)
contourplot(f,rotate)
axis on
set(gca,'xtick',[])
set(gca,'ytick',[])
% text(Xmax,Ymax,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),' meV') ...
%  ,'color','Black','FontSize',24, 'FontWeight','bold')

end
subaxis(2,5,6,'sv',vertical_space,'sh',0.01); 
%f = squeeze(B(30:348,ypos,1:30))';

f = squeeze(B(:,ypos,:))';
f = imresize(f,10); 
h_Sobel = fspecial('sobel');
f_y = imfilter( double(f) , h_Sobel , 'replicate');
%f_y = edge(double(f),'Canny');
contourplot(f_y,rotate)
colormap(flipud(gray))
ylabel(strcat('k_x','(',Ang,'^{-1})'),'FontSize',18,'color','k')
label_h = xlabel(strcat('k_y','(',Ang,'^{-1})'),'FontSize',18,'color','k');
label_h.Position(1) = 2000; % change horizontal position of ylabel
label_h.Position(2) = -50;
axis on
set(gca,'box','on')
set(gca,'tickdir','out')
xtickangle(60)
for ii = 2:5
subaxis(2,5,5+ii,'sv',vertical_space,'sh',0.01); 
%f = squeeze(B(30:348,Energy_Contour(ii),1:30))';
f = squeeze(B(:,Energy_Contour(ii),:))';
f = imresize(f,10); 
h_Sobel = fspecial('sobel');
f_y = imfilter(double(f) , h_Sobel , 'replicate');
contourplot(f_y,rotate)
axis on
%set(gca,'xtick',[])
xtickangle(60)
set(gca,'ytick',[])
% text(-0.9,70,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),'meV') ...
%  ,'color','Magenta','FontSize',12, 'FontWeight','bold')
end
hold off
saveas(gcf,strcat(Figure_Dir,SampleName,'_ECP_Reg_2nd.png'))

