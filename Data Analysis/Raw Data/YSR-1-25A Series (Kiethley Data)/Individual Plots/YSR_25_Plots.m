clear, clc, close all
%% README
%{ <-- Delete this bracket in front of each plot section (do 1-by-1)
% to see the results of each of the runs in this experiments [Abs J, J,
% Current vs. Voltage]
% These Matlab Codes will show you all of the raw data collected from
% experiments, as well as the averaged results of each set of experiments.
% *End mass comment section with this bracket notation --> %}

%% Data Extraction Section


%% EXPERIMENT SELECTION SECTION

% YSR-1-25A
FileExtr = 'Compiled_25A.txt'


% YSR-1-25B
%FileExtr = 'Compiled_25B.txt'


% YSR-1-25C
%FileExtr = 'Compiled_25C.txt'


% YSR-1-25D
%FileExtr = 'Compiled_25D.txt'


% YSR-1-25E
%FileExtr = 'Compiled_25E.txt'


% YSR-1-25F
%FileExtr = 'Compiled_25F.txt'


% YSR-1-25G
%FileExtr = 'Compiled_25G.txt'

%% Main CODE

Spill1 = importdata(FileExtr);
    Spill=Spill1.data;
    
     % Full Experimental Runs
    V = Spill(1:end,1);
    Abs_J = Spill(1:end,2);
    J = Spill(1:end,3);
    Current = Spill(1:end,4); 
   % Time = Spill(1:430,5);
    
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

%% Plot Abs Value of Current Density (J) vs. Voltage (Runs 1-5)
%

figure('Name','Raw ABS Current Density vs. Voltage')
subplot(2,3,1)
plot(VR,Abs_J1);% 
title('Run#1 Abs Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Abs Current Density (J)')
%xlim([0 7400])

subplot(2,3,2)
plot(VR,Abs_J2);% 
title('Run#2 Abs Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Abs Current Density (J)')
%xlim([0 7400])

subplot(2,3,3)
plot(VR,Abs_J3);% 
title('Run#3 Abs Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Abs Current Density (J)')
%xlim([0 7400])

subplot(2,3,4)
plot(VR,Abs_J4);% 
title('Run#4 Abs Current Density vs. Voltage')
xlabel('Voltage')%{
ylabel('Abs Current Density (J)')
%xlim([0 7400])

subplot(2,3,5)
plot(VR,Abs_J5);% 
title('Run#5 Abs Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Abs Current Density (J)')
%xlim([0 7400])




%}

%% Plot Value of Current Density (J) vs. Voltage (Runs 1-5)
%
figure('Name', 'Raw Current Density vs. Voltage')
hold on;
subplot(2,3,1)
plot(VR,J1);% 
title('Run#1 Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Current Density (J)')
%xlim([0 7400])


subplot(2,3,2)
plot(VR,J2);% 
title('Run#2 Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Current Density (J)')
%xlim([0 7400])
%figure

subplot(2,3,3)
plot(VR,J3);% 
title('Run#3 Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Current Density (J)')
%xlim([0 7400])
%figure

subplot(2,3,4)
plot(VR,J4);% 
title('Run#4 Current Density vs. Voltage')
xlabel('Voltage')%{
ylabel('Current Density (J)')
%xlim([0 7400])
%figure

subplot(2,3,5)
plot(VR,J5);% 
title('Run#5 Current Density vs. Voltage')
xlabel('Voltage')
ylabel('Current Density (J)')
%xlim([0 7400])
%}

hold off;

%% Plot Value of Current vs. Voltage (Runs 1-5)
%
figure('Name', 'Raw Current Vs. Voltage')
subplot(2,3,1)
plot(VR,Current1);% 
title('Run#1 Current vs. Voltage')
xlabel('Voltage')
ylabel('Current (I)')
%xlim([0 7400])

subplot(2,3,2)
plot(VR,Current2);% 
title('Run#2 Curren vs. Voltage')
xlabel('Voltage')
ylabel('Current (I)')
%xlim([0 7400])

subplot(2,3,3)
plot(VR,Current3);% 
title('Run#3 Current vs. Voltage')
xlabel('Voltage')
ylabel('Current (I)')
%xlim([0 7400])

subplot(2,3,4)
plot(VR,Current4);% 
title('Run#4 Current vs. Voltage')
xlabel('Voltage')%{
ylabel('Current (I)')
%xlim([0 7400])

subplot(2,3,5)
plot(VR,Current5);% 
title('Run#5 Current vs. Voltage')
xlabel('Voltage')
ylabel('Current (I)')
%xlim([0 7400])
%}


%% Plot Averages of Runs
%
figure('Name', 'Averaged Results from Experiment')
hold on;
subplot(2,2,1);
%Plot Averages
plot(VR,avgJ);% 
title('|J|/(A/cm^2) vs. V')
xlabel('Voltage')
ylabel('Abs Current Density |J|/(A/cm^2)')
%xlim([0 7400])

    
subplot(2,2,2);
plot(VR,avgAbs_J);
title('|J|/(A/cm^2) vs. V')
xlabel('Voltage')
ylabel('Avg Current Density |Avg J|/(A/cm^2)')
%xlim([0 7400])


subplot(2,2,[3,4]);
plot(VR,avgCurrent);
title('Avg Current vs. V')
xlabel('Voltage')
ylabel('Current (micro-amps)')
%xlim([0 7400])
%}

hold off
   