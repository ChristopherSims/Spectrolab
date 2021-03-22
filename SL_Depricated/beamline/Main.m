%clear all;
clc;
close all
Setup();
global Figure_Dir E ypos SampleName B;
SampleName = 'EB';
Figure_Dir = 'Figures\';mkdir(Figure_Dir);
%SamplePath = 'Data\f00003.ibw'; %111 phase
SamplePath = 'Data\ZIS\Swept_VB1.ibw'; %111 phase
%SamplePath = 'Data\EB2\f00008.ibw'; %111 phase
%SamplePath = 'Data\EB\f00014.ibw'; %001 phase
%[baseName, folder] = uigetfile('Data/*.ibw');
%SamplePath = fullfile(folder, baseName);
ypos = 300; % EV energy
[A,B] = LoadFile(SamplePath); % load File from neupane\sample\x.ibw
E=60;
setvariables(); % Set variables for data collection
%B = B./max(B(:)); % Normalize plots
%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%
FermiSurface()
% EDC_MDC() % multiple panal energy contour
%Dispersion();
% KX_Cuts()% KX cut plot
% KY_Cuts()% Ky cut plot
%FermiSurface(); %Fermi Surface
%ECP_Derivative();
ECP_Reg_2nd();
%ECP_Reg_Theory();
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