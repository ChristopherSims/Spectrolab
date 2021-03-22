%LoadFile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Read file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A,B] = LoadFile()
global file_no sample dir
imagepath = strcat('Neupane\',sample);
A = IBWread(strcat(imagepath,'\f000',file_no,'.ibw'));
dir = strcat('Neupane\',sample,'\','Figures','\');
if exist(dir) ~= 7
mkdir(dir)
end
A = IBWread(strcat(imagepath,'\f000',file_no,'.ibw'));
B = A.y;
end