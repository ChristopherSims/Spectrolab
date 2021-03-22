%2D image Load
ang = char(197);
sample = 'FS';
imagepath = strcat('Neupane\',sample);
dir = strcat('Neupane\',sample,'\','Figures','\');
if exist(dir) ~= 7
mkdir(dir)
end
file_no = '5';
A = IBWread(strcat(imagepath,'\f000',file_no,'.ibw'));
B = A.y;
Xmin = A.x0(1); Ymin = A.x0(2); 
Dx = A.dx(1); Dy = A.dx(2); 
Xmax = Dx*size(B,1) + Xmin; Ymax = Dy*size(B,2) + Ymin
E =75;
KY_Angle_Max = 0.5112*sqrt( E -4.5)*(pi*Ymax/180);
KY_Angle_Min = 0.5112*sqrt( E -4.5)*(pi*Ymin/180);
KX_Angle_Max = 0.5112*sqrt(E-4.5)*(pi*Xmax*0.046/180) -1.68;
KX_Angle_Min = 0.5112*sqrt(E-4.5)*(pi*Xmin*0.046/180) - 1.68;
Xlim = size(B,1); Ylim = size(B,2); 

Ypos = round(Ylim/2); %Angle 1
xpos = round(Xlim/2); %Angle 2

eV =  Dy*(1:size(B,2)) + Zmin;
setmap = cold;
B = B./max(B(:));
figure('Name','Cut plot','Position', get(0, 'Screensize'));
imshow(B',[], 'XData', ...
    [KX_Angle_Min KX_Angle_Max], 'YData',...
    [abs(Ymin) - Fermi_Level, abs(Ymax)- Fermi_Level], 'colormap', setmap);
axis on
axis square
xlabel(strcat('K_x','(1/',Ang,')'),'FontSize',14)
ylabel('Binding energy (eV)','FontSize',14)
hold off