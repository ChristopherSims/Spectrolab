%LoadFile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Read file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A,B] = LoadFile()
global Figure_Dir SamplePath
A = IBWread(strcat(SamplePath,'.ibw'));
if exist(Figure_Dir) ~= 7
mkdir(Figure_Dir)
end
B = A.y;
end