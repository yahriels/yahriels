clear, clc, close all

%% Data Extraction Section
FileExtr = 'CompiledAvgs_Final.txt'
% NOTE TO SKIP PAST ALL OTHER MATLAB SCRIPTS, Just change the 'A' letter in
% the 'Compiled_25A.txt' for the file extract. [A,B,C,D,E,F,G] %

[AbsJ]= PlotAvgAbsJ(FileExtr);
AbsJ
[J]= PlotAvgJ(FileExtr);
J
[I]= PlotAvgI(FileExtr);
I