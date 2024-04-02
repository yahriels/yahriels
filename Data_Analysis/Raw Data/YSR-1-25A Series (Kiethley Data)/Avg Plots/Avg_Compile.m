clear, clc, close all


M = zeros(430, 22);




for i = 1:8
 switch i
     case 1 %First Experiment
         VR = zeros(430,1);
         FileExtr = 'Compiled_25A.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,1) = VR;
         M(1:430,2) = avgAbs_J;
         M(1:430,3) = avgJ;
         M(1:430,4) = avgCurrent;
         
     case 2 % Second Experiment
         FileExtr = 'Compiled_25B.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,5) = avgAbs_J;
         M(1:430,6) = avgJ;
         M(1:430,7) = avgCurrent;
         
     case 3 %Third Experiment
         FileExtr = 'Compiled_25C.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,8) = avgAbs_J;
         M(1:430,9) = avgJ;
         M(1:430,10) = avgCurrent;
         
     case 4 %Fourth Experiment
         FileExtr = 'Compiled_25D.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,11) = avgAbs_J;
         M(1:430,12) = avgJ;
         M(1:430,13) = avgCurrent;
         
     case 5 %Fifth Experiment
         FileExtr = 'Compiled_25E.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,14) = avgAbs_J;
         M(1:430,15) = avgJ;
         M(1:430,16) = avgCurrent;
         
     case 6 %Sixth Experiment
         FileExtr = 'Compiled_25F.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,17) = avgAbs_J;
         M(1:430,18) = avgJ;
         M(1:430,19) = avgCurrent;
         
     case 7  %Seventh Experiment
         FileExtr = 'Compiled_25G.txt'; 
         [avgAbs_J, avgJ, avgCurrent, VR] = Avg_Fun(FileExtr);
         M(1:430,20) = avgAbs_J;
         M(1:430,21) = avgJ;
         M(1:430,22) = avgCurrent;
         
     otherwise
         disp('All averages from all the runs are now written to a new file')
         NewFile = 'CompiledAvgs.csv'
         csvwrite(NewFile, M)
         disp(M)
 end
        
        

end