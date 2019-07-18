%energy contour volume slice
figure('Name','3D Stacked plot'); % name figur
%set(gcf, 'Visible', 'off'); %%% dont load figure
cut1 = imread('Theory\B1.jpg');
cut2 = imread('Theory\B2.jpg');
cut3 = imread('Theory\B3.jpg');
cut4 = imread('Theory\B4.jpg');
cut5 = imread('Theory\B5.jpg');
cut6 = imread('Theory\B6.jpg');
im = {cut1; cut2 ;cut3;cut4;cut5;cut6};
I = [max([size(im{1},1),size(im{2},1),size(im{3},1),size(im{4},1),...
    size(im{5},1),size(im{6},1)]),max([size(im{1},2),size(im{2},2),size(im{3},2),size(im{4},2),...
    size(im{5},2),size(im{6},2)])]; %representative matrix
%# coordinates
[X,Y] = meshgrid(1:I(2), 1:I(1));
Z = ones(I(1),I(2));

%# plot each slice as a texture-mapped surface (stacked along the Z-dimension)
for k=1:size(im)
      surface('XData',X-0.5, 'YData',Y, 'ZData', Z.*-k, ...
        'CData',im{k}, 'CDataMapping','direct', ...
        'EdgeColor','none', 'FaceColor','texturemap')
end
view(3), box on, axis tight square
set(gca, 'YDir','reverse', 'ZLim',[-5 0])
zaspect = 0.005;
daspect([1 1 zaspect]) 
 alpha(.9)
axis on
%axis square
% ax = gca;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2)*2;
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];
box on
grid off
zticks([-6 -5 -4 -3 -2 -1 0]);
a = ["0","-100","-200","-300","-500","-600"];
zticklabels(flip(a))
zlabel('Energy (eV)','fontsize',18)
xlabel('K_x','fontsize',18)
ylabel('K_y','fontsize',18)
set(gca,'xtick',[])
set(gca,'ytick',[])
view([-50 10])
%set(gca,'ztick',[])
saveas(gcf,strcat(Figure_Dir,SampleName,'_StackedTheory.png'))
