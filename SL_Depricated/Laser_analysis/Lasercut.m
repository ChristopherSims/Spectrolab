%2D image Load
close all
Ang = char(197);
E = 21.7; 
sample = 'BTI';
imagepath = strcat('Data\',sample);
dir = strcat('Data\',sample,'\','Figures','\');
if exist(dir) ~= 7
mkdir(dir)
end

Fermi = 17;
for ii = 1:10
file_no = ii;
A = IBWread(strcat(imagepath,'\B000',num2str(file_no),'.ibw'));
B = A.y;
Emin = A.x0(1);
Xmin = A.x0(2); 
Dy = A.dx(1); %%% EV scale
Dx = A.dx(2); %%% momentum scale
Emax = Dy*size(B,1) + Emin; %%% max photon energy
Xmax = Dx*size(B,2) + Xmin;
KX_Angle_Max = 0.5112*sqrt(E-4.5)*(pi*Xmax*0.046/180) -1.68;
KX_Angle_Min = 0.5112*sqrt(E-4.5)*(pi*Xmin*0.046/180) -1.68;
Elim = size(B,1); Xlim = size(B,2); 
% 
% Ypos = round(Ylim/2); %Angle 1
% xpos = round(Xlim/2); %Angle 2

%eV =  Dy*(1:size(B,2)) + Emin;
set(gca,'TickDir','out');
figure('Name','Cut plot');
imagesc(flipud(B))
daspect([1 1 1])
axis on
%axis square
xlabel(strcat('K_x','deg.'),'FontSize',14)
ylabel('Binding energy (eV)','FontSize',14)
xticks([1:Xlim/5:Xlim Xlim]);
xticklabels(round(Xmin:(Xmax-Xmin)/5:Xmax))
yticks([1:Elim/10:Elim Elim] - 50);
yticklabels(round(Emax:-(Emax-Emin)/10:Emin,2)-17.2)
hold off
% set(gca,'xtick',[])
% set(gca,'ytick',[])
saveas(gcf,strcat(dir,sample,'_',num2str(file_no),'_Cut.png'))
end