% figure
% hold on
% close all
% for ii = 1:6
% subaxis(2,6,ii,'S',0.01); 
% C = imread(strcat('E',num2str(ii),'.png'));
% imshow(C(100:350,170:320,3),[], 'XData', [-1 1]...
%     , 'YData', [-1 1]);
% daspect([1 0.5 1])
% axis on
% yticks((-1:1/3:1));
% yticklabels([ 1 0.5 0 -0.5 -1])
% if (ii>1)
%     set(gca,'ytick',[])
% end
% set(gca,'xtick',[])
% set(gca,'box','on')
% set(gca,'tickdir','out')
% set(gca,'fontsize',18)
% %xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',24)
% end
% 
% for ii = 1:6
%   subaxis(2,6,6+ii,'S',0.01);  
%   C = imread(strcat('Y',num2str(ii),'.png'));
%   imshow(C,[], 'XData', [-1 1], 'YData', [-1 1]);
% daspect([1 0.5 1])
% axis on
% yticks((-1:1/3:1)+ 0.33);
% yticklabels([ 1 0.5 0 -0.5 -1])
% if (ii>1)
%     set(gca,'ytick',[])
% end
% set(gca,'box','on')
% set(gca,'tickdir','out')
% set(gca,'fontsize',18)
% end



%%%%
% figure 2
%%%%%%%%%
figure
hold on
close all
for ii = 1:6
subaxis(2,6,ii,'sv',vertical_space,'sh',0.01); 
f = squeeze(B(:,Energy_Contour(ii),:))';
h_Sobel = fspecial ('sobel');
f_y = imfilter ( double(f) , h_Sobel , 'replicate') ;
imshow(f_y,[], 'XData', [-1 1], 'YData', [-1 1]);
daspect([1 0.5 1])
axis on
axis xy
yticks((-1:1/3:1) + 0.66);
yticklabels([ -1 -0.5 0 0.5 1])
if (ii>1)
    set(gca,'ytick',[])
end
set(gca,'xtick',[])
set(gca,'box','on')
set(gca,'tickdir','out')
set(gca,'fontsize',18)
% text(-0.9,70,...
%     strcat('-',num2str(round(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)...
%     /100)*100),'meV') ...
%  ,'color','Magenta','FontSize',12, 'FontWeight','bold')
end
for ii = 1:6
  subaxis(2,6,6+ii,'S',0.01);  
  C = imread(strcat('T',num2str(ii),'.png'));
  imshow(C,[], 'XData', [-1 1], 'YData', [-1 1]);
daspect([1 0.5 1])
axis on
yticks((-1:1/3:1)+ 0.33);
yticklabels([ 1 0.5 0 -0.5 -1])
if (ii>1)
    set(gca,'ytick',[])
end
set(gca,'box','on')
set(gca,'tickdir','out')
set(gca,'fontsize',18)
end