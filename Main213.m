%clear all;
global Figure_Dir E ypos SamplePath SampleName setmap;
clc;
setmap = flipud(cold);
close all
SampleName = 'ZrSiS' ;
Figure_Dir = 'Figures\';mkdir(Figure_Dir);
SamplePath = 'Data\ZrSiSMap2'; %without .ibw header
[A,B] = LoadFile(); % load File from neupane\sample\x.ibw
B = permute(B,[2 1 3]);
ypos = size(B,2)-50; % EV energy
 %B = rot90(B);
E =60;
setvariables213(); % Set variables for data collection
B = (B./max(B(:)))*100; % Normalize plots
%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%
% KX_Cuts()% KX cut plot
% KY_Cuts()% Ky cut plot
% FermiSurface(); %Fermi Surface
% ECP_Derivative();
% ECP_Reg_2nd();
% ECP_Reg_Theory();
% StackedECP();
% SDTest();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scan Plots
% %%%%%%%%%%%%%%%%%%%%%%%%%
%  XY_Plot= figure('Position', get(0, 'Screensize')); % Kx
%  slider_plot(B,Zlim,XY_Plot,3)
% XZ_Plot = figure; % fermi 
% slider_plot(B,Ylim,XZ_Plot,2)
%  ZY_Plot = figure('Position', get(0, 'Screensize')); %Ky
%  slider_plot(B,Xlim,ZY_Plot ,1)
%     