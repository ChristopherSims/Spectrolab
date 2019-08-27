%clear all;
clc;
close all
global Figure_Dir E ypos SamplePath SampleName;
SampleName = 'HfP2' ;
Figure_Dir = 'Figures\';mkdir(Figure_Dir);
SamplePath = 'Data\HfP_map7'; %without .ibw header
addpath('Colormaps','Data','Figures','Plots','ReadFile','temp','Theory')
[A,B] = LoadFile(); % load File from neupane\sample\x.ibw
ypos = size(B,2)-90; % EV energy
E =60;
setvariables(); % Set variables for data collection
%B = B./max(B(:)); % Normalize plots
%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%
% SDTest();
% SDTestX();
% SDTestY();
% EdgeTest();
% EDC_MDC() % multiple panal energy contour
% %Dispersion();
% KX_Cuts()% KX cut plot
% KY_Cuts()% Ky cut plot
% FermiSurface(); %Fermi Surface
% ECP_Derivative();
% ECP_Reg_2nd();
% ECP_Reg_Theory();
% StackedECP();
%VolumetricPlot();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scan Plots
% %%%%%%%%%%%%%%%%%%%%%%%%%
%  XY_Plot= figure('Position', get(0, 'Screensize')); % Kx
%  slider_plot(B,Zlim,XY_Plot,3)
% XZ_Plot = figure; % fermi 
% slider_plot(B,Ylim,XZ_Plot,2)
%  ZY_Plot = figure('Position', get(0, 'Screensize')); %Ky
%  slider_plot(B,Xlim,ZY_Plot ,1)