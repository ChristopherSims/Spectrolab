%energy contour volume slice
figure('Name','3D plot');
%set(gcf, 'Visible', 'off');
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
diff = double(B); %double(squeeze(B));
Energy_Limit = 200;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
%h_Sobel = fspecial ('sobel');
%diff(:,Energy_Contour,:) = imfilter(diff(:,Energy_Contour,:) , h_Sobel , 'replicate') ;
h = slice(diff,double(Energy_Contour),[],[]);
set(h, 'EdgeColor','none', 'FaceColor','interp')
alpha(.9)
axis on
%axis square
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
box on
grid off
daspect([0.1 1 0.6]) 
colormap(setmap)
xticks(flip(Energy_Contour));
a = ["","","","","",""];
for ii = 1:length(Energy_Contour)
 a(ii) = strcat(num2str((round(abs(eV(Energy_Contour(ii)) - eV(ypos)),1)*1000.0)),' meV');
end
a(1) = "0 meV";
xticklabels(flip(a))
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
% set(h,'YData',[KY_Angle_Min KY_Angle_Max]);
% set(h,'ZData',[KX_Angle_Min KX_Angle_Max]);
 %set(h,'XData',[eV(1) eV(end)]);
view(84,-18)
set( gca, 'Units', 'normalized', 'Position', [0 0.1 0.9 0.8] );
hold off
daspect([0.2 1 1]) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% 2ND dERIVATOVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %energy contour volume slice
% figure('Name','3D plot');
% %set(gcf, 'Visible', 'off');
% Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
% diff = double(B); %double(squeeze(B));
% Energy_Limit = 200;
% Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
% Energy_Contour = ypos - Energy_Cut;
% h_Sobel = fspecial ('sobel');
% for ii = 1:length(Energy_Contour)
% diff(:,Energy_Contour(ii),:) = imfilter(diff(:,Energy_Contour(ii),:) , h_Sobel , 'replicate') ;
% end
% h = slice(diff,double(Energy_Contour),[],[]);
% set(h, 'EdgeColor','none', 'FaceColor','interp')
% alpha(.9)
% axis on
% %axis square
% ax = gca;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];
% box on
% grid off
% daspect([0.1 1 0.6]) 
% colormap(bone(1000))
% xticks(flip(Energy_Contour));
% a = ["","","","","",""];
% for ii = 1:length(Energy_Contour)
%  a(ii) = strcat(num2str(round(abs(eV(Energy_Contour(ii)) - eV(ypos))*1000.0)),' meV');
% end
% a(1) = "0 meV";
% xticklabels(flip(a))
% xlabel(strcat('Energy'),'FontSize',14)
% %%%%%%%%%%%%%%%%%%5
% %Y label 
% %%%%%%%%%%%%%%
% yvector = 1:size(B,1)/2:size(B,1);
% yvector = [yvector,size(B,1)];
% yticks(int32(yvector))
% ylabelvector = KX_Angle_Min + (((abs(KX_Angle_Min) + abs(KX_Angle_Max))/size(B,1))*yvector);
% yticklabels(string(round(ylabelvector,1)))
% ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
% %%%%%%%%%%%%%%%%%%%%%%%%
% % z label
% %%%%%%%%%%%%%%%%
% zvector = 1:size(B,3)/4:size(B,3);
% zvector = [zvector,size(B,3)];
% zticks(int32(zvector))
% zlabelvector = KY_Angle_Min + (((abs(KY_Angle_Min) + abs(KY_Angle_Max))/size(B,3))*zvector);
% zticklabels(string(round(zlabelvector,1)))
% zlabel(strcat('K_y','(1/',Ang,')'),'FontSize',14)
% % set(h,'YData',[KY_Angle_Min KY_Angle_Max]);
% % set(h,'ZData',[KX_Angle_Min KX_Angle_Max]);
%  %set(h,'XData',[eV(1) eV(end)]);
% view(84,-18)
% set( gca, 'Units', 'normalized', 'Position', [0 0.1 0.9 0.8] );
% hold off
