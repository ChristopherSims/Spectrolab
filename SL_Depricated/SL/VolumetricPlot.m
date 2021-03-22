%energy contour volume slice
figure('Name','3D plot');
set(gcf, 'Visible', 'off');
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
diff = rot90(double(B),270); %double(squeeze(B));
Energy_Cut = 1:int16(200/4):200;
Energy_Contour = ypos - Energy_Cut;
figure
BW = edge3(diff,'Sobel', 0.8);
vol3d('Cdata',diff)
alphamap([0 linspace(0.0005, 0.4, 255)]);
colormap(flipud(cold));
ylabel('K_x')
xlabel('Energy')
zlabel('K_y')

% xticks(Energy_Contour(end:-1:1) - 70)
% a = ["","","","","",""];
% for ii = 1:length(Energy_Contour)
%  a(ii) = strcat(num2str((round(abs(eV(Energy_Contour(ii)) - eV(ypos)),1)*1.0)),' eV');
% end
% a(1) = "0 eV";
% xticklabels(a)
xlabel(strcat('Energy'),'FontSize',14)
%%%%%%%%%%%%%%%%%%5
%Y label 
%%%%%%%%%%%%%%
yvector = 1:size(B,1)/2:size(B,1);
yvector = [yvector,size(B,1)];
yticks(int32(yvector))
ylabelvector = KX_Angle_Min + (((abs(KX_Angle_Min) + abs(KX_Angle_Max))/size(B,1))*yvector);
yticklabels(string(round(ylabelvector)))
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
%%%%%%%%%%%%%%%%%%%%%%%%
% z label
%%%%%%%%%%%%%%%%
zvector = 1:size(B,3)/2:size(B,3);
zvector = [zvector,size(B,3)];
zticks(int32(zvector))
zlabelvector = KY_Angle_Min + (((abs(KY_Angle_Min) + abs(KY_Angle_Max))/size(B,3))*zvector);
zticklabels(string(round(zlabelvector)))
zlabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% set(gca,'ztick',[])
%daspect([1 1 1]) 
axis square
saveas(gcf,strcat(Figure_Dir,SampleName,'_Volumetric.png'))