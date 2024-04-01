

function [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr)

%% Data Extraction Section

% NOTE TO SKIP PAST ALL OTHER MATLAB SCRIPTS, Just change the 'A' letter in
% the 'Compiled_25A.txt' for the file extract. [A,B,C,D,E,F,G] %

Spill1 = importdata(FileExtr);
    Spill=Spill1.data;
    
     % Full Experimental Runs
    V = Spill(1:end,1);
    Abs_J = Spill(1:end,2);
    J = Spill(1:end,3);
    Current = Spill(1:end,4); 
    Time = Spill(1:430,5);
    
    % First Run
    VR = Spill(1:430,1);
    Abs_J1 = Spill(1:430,2);
    J1 = Spill(1:430,3);
    Current1 = Spill(1:430,4); 
    %Time = Spill(1:430,5);
    
    % Second Run
   % V2 = Spill(431:860,1);
    Abs_J2 = Spill(431:860,2);
    J2 = Spill(431:860,3);
    Current2 = Spill(431:860,4); 
    %Time2 = Spill(431:860,5);
    
    % Third Run
    %V3 = Spill(861:1290,1);
    Abs_J3 = Spill(861:1290,2);
    J3 = Spill(861:1290,3);
    Current3 = Spill(861:1290,4); 
    %Time3 = Spill(861:1290,5);

    
    % Fourth Run
    %V4 = Spill(1291:1720,1);
    Abs_J4 = Spill(1291:1720,2);
    J4 = Spill(1291:1720,3);
    Current4 = Spill(1291:1720,4); 
    %Time4 = Spill(1291:1720,5);
    
    
    % Fifth Run
    %V5 = Spill(1721:2150,1);
    Abs_J5 = Spill(1721:2150,2);
    J5 = Spill(1721:2150,3);
    Current5 = Spill(1721:2150,4); 
    %Time5 = Spill(1721:2150,5);

 %% Calculate Averages of Runs
 sum =0; 
%Have the average for Abs_J
for i = 1:430
    sum =0;
    sum = sum + Abs_J1(i) + Abs_J2(i) + Abs_J3(i) + Abs_J4(i) + Abs_J5(i);
    sum = (sum/5);
    avgAbs_J(i,1) = sum;
end

%Have the average for J
sum = 0;
for i = 1:430
    sum = 0; 
    sum = sum + J1(i) + J2(i) + J3(i) + J4(i) + J5(i);
    sum = (sum/5);
    avgJ(i,1) = sum;
end

%Have the average for Current
sum=0;
for i = 1:430
    sum = 0;
    sum = sum + Current1(i) + Current2(i) + Current3(i) + Current4(i) + Current5(i);
    sum = (sum/5);
    avgCurrent(i,1) = sum;
end

end

