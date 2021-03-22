%clear all;
clc;
close all
global Figure_Dir E ypos SamplePath SampleName;
SampleName = 'HfP' ;
Figure_Dir = 'Figures\';mkdir(Figure_Dir);
SamplePath = 'Data\Hf'; %without .ibw header
ypos = 300; % EV energy
[A,B] = LoadFile(); % load File from neupane\sample\x.ibw
E =60;
setvariables(); % Set variables for data collection
%B = B./max(B(:)); % Normalize plots
%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%
EDC_MDC() % multiple panal energy contour
%Dispersion();
KX_Cuts()% KX cut plot
KY_Cuts()% Ky cut plot
FermiSurface(); %Fermi Surface
ECP_Derivative();
ECP_Reg_2nd();
ECP_Reg_Theory();
StackedECP();
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