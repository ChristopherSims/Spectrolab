%energy contour volume slice
close all
figure('Name','Rotation');
vertical_space = 0.01;
yoffset = 30;
xoffset = 0;

%set(gcf, 'Visible', 'off');
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
diff = double(B); %double(squeeze(B));
Energy_Limit = 200;
Energy_Cut = 1:int16(Energy_Limit/6):Energy_Limit;
Energy_Contour = ypos - Energy_Cut;
%padval = max(size(slice,1),size(slice,2));
Bnew = permute(B,[1 3 2]);
eV =  Dx*(1:size(Bnew,3)) + Ymin;
slice = imrotate(Bnew,0);
pad = round(1:size(slice,2)/6:size(slice,2));
figure(1)
angle_points = [-5 -10 -15 -20];
imagesc(slice(:,:,ypos)')
axis xy
colormap(hot)
hold on
ycent = 62;
mult = 15;
xamin=300;
xamax=500;
   kyvec = round((1:Ylim/5:Ylim),1) + yoffset;
 kxvec = round(([1:Xlim/4:Xlim, Xlim]),1);
 stomx = (0:Xlim)*Dx(1) - Xlim*Dx(1)/2;
 
  kzvec = round(([1:Zlim/4:Zlim, Zlim]));
 stomz =  0.5112*sqrt(E -4.5)*(pi.*...
     ((0:Zlim)*Dz(1) - Zlim*Dz(1)/2)./180);
 stomz = flip(stomz,1)';
 ylabel(strcat('K_x','(1/',Ang,')'),'FontSize',18,'color','k')
xlabel(strcat('K_y','(1/',Ang,')'),'FontSize',18,'color','k')
axis on
for angle = angle_points
    x = round(xamin:size(Bnew,1)/size(Bnew,2):xamax)';
    y = round(ycent - (size(x,1)/size(Bnew,1))*sin(deg2rad(angle))*size(Bnew,2)*mult...
        :(size(x,1)/size(Bnew,1))*sin(deg2rad(angle))*size(Bnew,2)/size(x,1)*mult*2 ...
        :ycent + (size(x,1)/size(Bnew,1))*sin(deg2rad(angle))*size(Bnew,2)*mult)';
    line([x(1) x(end)],[y(1) y(end)],'color','green','linewidth',3,'linestyle','--')
end
    yticks(kzvec)
     yticklabels(round(stomz(kzvec),1))
     xticks(flipud(kxvec))
     xticklabels(round(stomx(kxvec),1))
hold off
figure(2)
Cut = zeros(size(slice,3),size(x,1));
set = 1;
for angle = angle_points
    x = round(xamin:size(Bnew,1)/size(Bnew,2):xamax)';
    y = round(ycent - (size(x,1)/size(Bnew,1))*sin(deg2rad(angle))*size(Bnew,2)*mult...
        :(size(x,1)/size(Bnew,1))*sin(deg2rad(angle))*size(Bnew,2)/size(x,1)*mult*2 ...
        :ycent + (size(x,1)/size(Bnew,1))*sin(deg2rad(angle))*size(Bnew,2)*mult)';
    
  for ii = 1:size(x,1)
        Dtest = slice(x(ii),y(ii),:);
        Cut(:,ii) = Dtest;
  end
  subaxis(1,size(angle_points,2),set,'S',0.01); 
  hold on
  axis on

  Cut2 = medfilt2(imresize(Cut,10));
  ylim([0 3500])
 xlim([0 200])
 %daspect([1 1 1])
 yticks(flipud(kyvec)*10)
 yticklabels(round(eV(round(kyvec)) - eV(round(kyvec(end))),1))
 
 kxvec = round(([xamin:(xamax-xamin)/3:xamax]));
 stomx = (0:Xlim)*Dx(1) - Xlim*Dx(1)/2;
      xticks(flipud(kxvec)-xamin)
   xticklabels(round(stomx(kxvec),1))
ylabel("Energy(E-E_f)",'fontsize',24)
 imagesc(Cut2)
 colormap(hot)
 hold off
 if set > 1
     axis off
 end
 set = set+1;
csvwrite(strcat('Cut',num2str(angle),'.csv'),Cut)
end
%  set(2,'fontsize',18)

% figure(1)
% imagesc(slice(:,:,300))
% figure(2)
% for ii = 1:size(pad,2)
%    subaxis(1,6,ii,'S',0.01); 
% f = squeeze(slice(:,pad(ii),:));
% imagesc(f)
% end
