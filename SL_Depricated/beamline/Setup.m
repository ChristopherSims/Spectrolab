global SampleName Ang
SampleName = 'Default';
Figure_Dir = 'Figures\';
if exist(Figure_Dir) ~= 7
mkdir(Figure_Dir)
end
addpath('Colormaps','Data','Figures','Plots'...
    ,'ReadFile','temp','Theory','GUI Updates','Contour');
Ang = char(197);

