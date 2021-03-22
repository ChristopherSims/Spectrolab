%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Energy density Curves
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
YZ = squeeze(B(xpos,:,:));
figure('Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'off');
subplot(1,2,1)
hold on
title('EDC')
ylabel('Enegy (EV)')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
zlabel('Intensity (arb. units)')
stackedplot(YZ,3,1)
view(-70,70)
subplot(1,2,2)
 imshow(YZ,[], 'XData',...
     [KX_Angle_Min KX_Angle_Max], 'YData', [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level]);
hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_EDC_X.png'))
% YZ_EDC = squeeze(B(xpos,:,:));
% YZ_EDC = YZ_EDC./norm(YZ_EDC);
% figure('Position', get(0, 'Screensize'));
% offset =0.0007;
% subplot(1,2,1)
% hold on
% for ii = 1:1:Zlim
%     nline = YZ(ii,:)/norm(YZ(ii,:));
%    plot(YZ_EDC(:,ii) - offset*ii,'r') 
% end
% hold off
% title('EDC')
% xlabel('Energy')
% ylabel('Offset')
% subplot(1,2,2)
% imshow(YZ_EDC,[], 'XData',...
%     [KX_Angle_Min KX_Angle_Max], 'YData', [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Momentum density curve
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
YZ = squeeze(B(xpos,:,:));
YZ = YZ./norm(YZ);
figure('Position', get(0, 'Screensize'));
set(gcf, 'Visible', 'off');
subplot(1,2,1)
stackedplot(YZ,3,1)
hold on
title('MDC')
ylabel('Enegy (EV)')
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
zlabel('Intensity (arb. units)')
view(-120,40)
subplot(1,2,2)
imshow(YZ,[], 'XData',...
    [KX_Angle_Min KX_Angle_Max], 'YData', [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level]);
hold off
%saveas(gcf,strcat(dir,sample,'_',file_no,'_MDC_X.png'))
% YZ = squeeze(B(xpos,:,:));
% YZ = YZ./norm(YZ);
% figure('Position', get(0, 'Screensize'));
% subplot(1,2,1)
% hold on
% offset =0.0001;
% for ii = 1:5:Xlim
%    plot(YZ(ii,:) - offset*ii,'r') 
% end
% hold off
% title('MDC')
% ylabel('Enegy (EV)')
% xlabel('K(A^{-1})')
% zlabel('Intensity (arb. units)')
% %view(-120,40)
% subplot(1,2,2)
% imshow(YZ,[], 'XData',...
%     [KX_Angle_Min KX_Angle_Max], 'YData', [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level]);
% 
%