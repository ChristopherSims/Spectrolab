ypos = 430; % EV energy
[A,B] = LoadFile(); % load File from neupane\sample\x.ibw
E =60;

% Set variables for data analysis 
global E KY_Angle_Max KY_Angle_Min KX_Angle_Max KX_Angle_Min eV ypos;
Xmin = A.x0(1); Ymin = A.x0(2); Zmin = A.x0(3);
Dx = A.dx(1); Dy = A.dx(2); Dz = A.dx(3);
Xmax = Dx*size(B,1) + Xmin; Ymax = Dy*size(B,2) + Ymin; Zmax = Dz*size(B,3) +Zmin;
KY_Angle_Max = 0.5112*sqrt(E -4.5)*(pi*Zmax/180);
KY_Angle_Min = 0.5112*sqrt(E -4.5)*(pi*Zmin/180);
KX_Angle_Max = 0.5112*sqrt(E-4.5)*(pi*Xmax*0.046/180) -1.68;
KX_Angle_Min = 0.5112*sqrt(E-4.5)*(pi*Xmin*0.046/180) - 1.68;
Xlim = size(B,1); Ylim = size(B,2); Zlim = size(B,3);
zpos = round(Zlim/2); %Angle 1
xpos = round(Xlim/2); %Angle 2
eV =  Dy*(1:size(B,2)) + Ymin;
setmap = flipud(cold);
Fermi_Level = abs(Ymin) + ((ypos/Ylim)*(abs(Ymax) - abs(Ymin)));
function [A,B] = LoadFile(SamplePath)
A = IBWread(strcat(SamplePath,'.ibw'));
B = A.y;
end