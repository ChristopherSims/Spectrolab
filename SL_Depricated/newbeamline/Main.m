%clear all;
clc;
close all
global figure_dir SamplePath E ypos sample file_no;
file_no = "1";
sample = 'ttp';
figure_dir = 'Figures\';
SamplePath = 'Map1';
ypos = 300; % EV energy
[A,B] = LoadFile(); % load File from neupane\sample\x.ibw
 B = rot90(B);
% B = permute(C,[2 3 1]);
E =60;
setvariables(); % Set variables for data collection
B = (B./max(B(:)))*100; % Normalize plots
%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%
%EnergyContourPlot() % multiple panal energy contour
%KX_Cuts()% KX cut plot
%KY_Cuts()% Ky cut plot
% FermiSurface(); %Fermi Surface
 ECP2();
% StackedPlot();
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