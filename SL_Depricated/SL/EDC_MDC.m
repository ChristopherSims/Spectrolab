%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Energy density Curves
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
YZ = squeeze(B(xpos,:,:));
figure
%set(gcf, 'Visible', 'off');
subplot(1,2,1)
hold on
title('EDC')
xlabel('Enegy (EV)')
ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
zlabel('Intensity (arb. units)')
waterfall(YZ')
view(-70,70)
subplot(1,2,2)
 imshow(YZ,[], 'XData',...
     [KX_Angle_Min KX_Angle_Max], 'YData', [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level]);
hold off
saveas(gcf,strcat(Figure_Dir,SampleName,'_EDC.png'))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Momentum density curve
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%YZ = squeeze(B(xpos,:,:));
YZ = YZ./norm(YZ);
%set(gcf, 'Visible', 'off');
subplot(1,2,1)
waterfall(YZ)
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
saveas(gcf,strcat(Figure_Dir,SampleName,'_MDC.png'))