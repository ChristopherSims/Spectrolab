function [ smoothData ] = Smooth2( Data, method, arg )
%SMOOTH2 Smooths 2D data using your choice of method
%   Input:
%   Data   - your 2D data set that needs smoothing
%   method - the method you want to use (see methods below)
%   arg    - aditional arguements that depend on method
%   Output:
%   smoothData - your 2D smoothed data
%   Methods:
%   Gaussian Convolution (GaussConv)  arg=[FWHM_X,FWHM_Y]  [Full-width-half-maximum-x (recommended 10), Full-width-half-maximum-y (recommended 10)]
%   Monty Carlo (MontyCarlo)          arg=[PPC,sigma]      [Particles/datapoint to use(recommended 10), particle range (recommended 2)]
%   Nearest Neighbor 2nd order (NN2)  arg=[its]            [number of itterations (recommended 2)]
%   Nearest Neighbor 3rd order (NN3)  arg=[its]            [number of itterations (recommended 2)]
%   The quickest most effecient smoothing method in this script is NN2, but
%   each method has its own artistic uniqueness.
%% 
% Zero pad method for case check
method_b=[method,'00000000000'];
if method_b(1:9)=='GaussConv'
% Convolve data with a Gaussian
[NX,NY]=size(Data);
FWHM_X=arg(1);
FWHM_Y=arg(2);
SNX=3*FWHM_X;
SNY=3*FWHM_Y;
Stencil=zeros(SNX,SNY);
[SX,SY]=meshgrid(1:SNX,1:SNY);
Stencil=exp(-(sqrt((SX-SNX/2).^2+(SY-SNY/2).^2)/sqrt((SNX/6)^2+(SNY/6)^2)).^2);
smoothData=conv2(Data,Stencil,'same');
elseif method_b(1:10)=='MontyCarlo'
% Create random particle field for reduction
PPC=arg(1);
sigma=arg(2);
[NX,NY]=size(Data);
[X,Y]=meshgrid(1:NX,1:NY);
% Initialize particles
xP=zeros(NX*NY*PPC,1); % particle x-locations
yP=xP;                 % particle y-locations
wP=xP;                 % particle weights
% Create particle field
for n=1:NX*NY
xP((1+(n-1)*PPC):n*PPC)=X(n)+sigma*(rand(PPC,1)-.5);
yP((1+(n-1)*PPC):n*PPC)=Y(n)+sigma*(rand(PPC,1)-.5);
wP((1+(n-1)*PPC):n*PPC)=Data(X(n),Y(n))/PPC;
end
% Simple way of accounting for out-of-bounds particles (introdues boundary errors)
xP=(xP*(NX-1)/NX)+.5;
yP=(yP*(NY-1)/NY)+.5;
% Collect particles
for n=1:NX*NY*PPC
smoothData(round(xP(n)),round(yP(n)))=smoothData(round(xP(n)),round(yP(n)))+wP(n);
end
elseif method_b(1:3)=='NN2'
% Use 2nd order nearest neighbor averaging 
its=arg(1);
[NX,NY]=size(Data);
    % regular indexes
    ii=1:NX; jj=1:NY;
    
    % indix +/- 1 (with periodicity) for averaging 
    ii_p=[2:NX,1]; ii_m=[NX,1:(NX-1)];
    jj_p=[2:NY,1]; jj_m=[NY,1:(NY-1)];
    
    % smooth the data once
    smoothData(ii,jj)=( Data(ii,jj)+Data(ii_p,jj)+Data(ii_m,jj)+Data(ii,jj_p)+Data(ii,jj_m) )/5;
    
    % smooth the data again if necessary
    for n=1:(its-1)
    smoothData(ii,jj)=( smoothData(ii,jj)+smoothData(ii_p,jj)+smoothData(ii_m,jj)+smoothData(ii,jj_p)+smoothData(ii,jj_m) )/5;
    end
        
elseif method_b(1:3)=='NN3'
% Use 3rd order nearest neighbor averaging 
its=arg(1);
[NX,NY]=size(Data);
    % regular indexes
    ii=1:NX; jj=1:NY;
    
    % indix +/- 1 (with periodicity) for averaging 
    ii_p=[2:NX,1]; ii_m=[NX,1:(NX-1)];
    jj_p=[2:NY,1]; jj_m=[NY,1:(NY-1)];
    
    % smooth the data once
    smoothData(ii,jj)=( Data(ii,jj)+Data(ii_p,jj)+Data(ii_m,jj)+Data(ii,jj_p)+Data(ii,jj_m)+sqrt(2)*(Data(ii_p,jj_p)+Data(ii_p,jj_m)+Data(ii_m,jj_m)+Data(ii_m,jj_m)) )/(5+4*sqrt(2));
    
    % smooth the data again if necessary
    for n=1:(its-1)
    smoothData(ii,jj)=( smoothData(ii,jj)+smoothData(ii_p,jj)+smoothData(ii_m,jj)+smoothData(ii,jj_p)+smoothData(ii,jj_m) )/5;
    end
  
else
    fprintf('Unrecognized method: ''%s'', returning input data\n',method)
    smoothData=Data;
end
end
