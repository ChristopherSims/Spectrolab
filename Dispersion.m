%Dispersion Map
close all
% figure('Name','Cut plot');
Ang = char(197);
vertical_space = 0.01;
yoffset = 30;
xoffset = 0;
% % % file_no = ['X53';'X56';'X59';'X62'];
% % % File_EV = ['53';'56';'59';'62'];
% % % %subaxis(1,4,1,'S',0.01); 
% % % hold on
% % % %set(gca,'LineWidth',8,'TickLength',[0.025 0.025]);
% % % for ii = 1:size(file_no)
% % % Dispersions = IBWread(strcat('Neupane\HA2\',file_no(ii,:),'.ibw'));
% % % Data_2D = Dispersions.y;
% % % Dy = Dispersions.dx;
% % % eV =  Dy(2)*(1:size(Data_2D,2));
% % % subaxis(1,4,ii,'sv',vertical_space,'sh',0.01);  
% % % cutplot(Data_2D')
% % % ylim = size(Data_2D,2);
% % % xlim = size(Data_2D,1);
% % %  kyvec = round((1:ylim/5:ylim),1) + yoffset;
% % %  kxvec = round(([1:xlim/2:xlim, xlim]),1) + xoffset;
% % %  stom = (0:Dy(1)/xlim:Dy(1)) - Dy(1)/2;
% % %  %daspect([1 1 1])
% % %  yticks(flipud(kyvec*10))
% % %  xticks(flipud(kxvec*10))
% % %  xticklabels(round(stom(kxvec),1))
% % %  yticklabels(round(eV(round(kyvec)) - eV(round(kyvec(end))),1))
% % % if ii == 1
% % %     axis on
% % %     ylabel('E-E_F (eV)','FontSize',20)
% % % end
% % % if ii > 1
% % %      axis on
% % %     set(gca,'yticklabel',{[]}) 
% % %    % set(gca,'xtick',[]) 
% % % end 
% % % xlabel(strcat("k_y ",'(',Ang,'^{-1})'),'FontSize',20)
% % % text(100,round(kyvec(end)*10)+200,...
% % %     strcat(num2str(File_EV(ii,:)),'eV')...
% % %     ,'color','Black','FontSize',24, 'FontWeight','bold')
% % % end
colormap(flipud(gray))
%%%%%%%%%Dispersion Map
file_no = ['Neupane\Swept_VB3'];
File_EV = ['59'];
%subaxis(1,4,1,'S',0.01); 
hold on
for ii = 1:size(file_no)
Dispersions = IBWread(strcat(file_no(ii,:),'.ibw'));
Data_2D = Dispersions.y;
Dy = Dispersions.dx;
eV =  Dy(2)*(1:size(Data_2D,2));
%subaxis(1,4,ii,'sv',vertical_space,'sh',0.01);  
h_Sobel = fspecial ('sobel');
%Data_2D = imresize(Data_2D,10);
%Data_2D = imgaussfilt(Data_2D,2);
%Data_2D = smooth2(Data_2D);
Data_2D = Data_2D./max(Data_2D(:));
%Data_2D = imsharpen(Data_2D*100);
f_y = imfilter (double(Data_2D), h_Sobel , 'replicate') ;
waterfall(Data_2D)
colormap(jet)
%imagesc(f_y)
axis on 
axis xy
box on
axis square
ylim = size(Data_2D,2);
xlim = size(Data_2D,1);
 kyvec = round((1:ylim/5:ylim),1) + yoffset;
 kxvec = round(([1:xlim/4:xlim, xlim]),1);
 stom = (0:Dy(1)/xlim:Dy(1)) - Dy(1)/2;
 %daspect([1 1 1])
  yticks(flipud(kyvec))
  xticks(flipud(kxvec) - 20)
%   xticklabels(round(stom(kxvec),1))
% yticklabels(round(eV(round(kyvec)) - eV(round(kyvec(end))),1))
 set(gca,'TickDir','out');
 set(gca,'fontsize',24)
if ii == 1
    axis on
    %ylabel('Binding energy (eV)','FontSize',20)
end
%xlabel(strcat("Momentum ",'(',Ang,'^{-1})'),'FontSize',20)
% text(100,round(kyvec(end)*10)+200,...
%     strcat(num2str(File_EV(ii,:)),'eV')...
%     ,'color','Black','FontSize',24, 'FontWeight','bold')
end
saveas(gcf,strcat(Figure_Dir,SampleName,'_Dispersion.png'))