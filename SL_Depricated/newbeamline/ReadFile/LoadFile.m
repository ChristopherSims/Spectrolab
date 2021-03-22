%LoadFile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Read file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A,B] = LoadFile()
global Figure_dir SamplePath
A = IBWread(strcat(SamplePath,'.ibw'));
if exist(Figure_dir) ~= 7
mkdir(Figure_dir)
end
B = A.y;
end