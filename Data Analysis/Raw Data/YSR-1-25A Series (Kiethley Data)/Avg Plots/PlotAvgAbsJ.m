
function [AbsJ] = PlotAvgAbsJ(FileExtr)
%% Data Extraction Section

Spill1 = importdata(FileExtr);
Spill=Spill1.data;
    
V = Spill(1:end, 1);

%25 A
 AJA = Spill(1:21,2);
 
%25 B
 AJB = Spill(1:21,5);
 
%25 C
 AJC = Spill(1:21,8);
 
%25 D
 AJD = Spill(1:21,11);
 
%25 E
 AJE = Spill(1:21,14);
 
%25 F
 AJF = Spill(1:21,17);
 
%25 G
 AJG = Spill(1:21,20);




%% Making the Plots
figure('Name', 'Compiled AbsJ Averages')
subplot(4,2,1);
plot(V,AJA);% 
title('YSR25A |Abs| J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,2);
plot(V,AJB);% 
title('YSR25B |Abs| J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,3);
plot(V,AJC);% 
title('YSR25C |Abs| J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,4);
plot(V,AJD);% 
title('YSR25D |Abs| J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,5);
plot(V,AJE);% 
title('YSR25E |Abs| J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,6);
plot(V,AJF);% 
title('YSR25F |Abs| J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,7);
plot(V,AJG);% 
title('YSR25G J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,8);
hold on

plot(V,AJA,'b-.');
   
plot(V,AJB,'g-.');
 
plot(V,AJC,'r-.');

plot(V,AJD,'c-.');
 
plot(V,AJE,'m-.');
 
plot(V,AJF,'y-.');

plot(V,AJG,'k-.');

    
hold off
title('AbsJ Raw Stacked Plots')
xlabel('Voltage')
ylabel('Current Density')

%{
subplot(5,2,[9,10]);
hold on
    FJ1 = V + JA; 
    %scatter(V,FJ1,25,'b','*') 
    P = polyfit(V,FJ1,1);
    FJA = P(1)*V+P(2);
    %hold on
 plot(V,FJA,'b-.');
    %hold off
    
    FJ2 = V + JB; 
    %scatter(V,FJ2,25,'g','*') 
    P = polyfit(V,FJ2,1);
    FJB = P(1)*V+P(2);
    %hold on
plot(V,FJB,'g-.');
    %hold off

    FJ3 = V + JC; 
    %scatter(V,FJ3,25,'r','*') 
    P = polyfit(V,FJ3,1);
    FJC = P(1)*V+P(2);
    %hold on
plot(V,FJC,'r-.');
    %hold off
    
    FJ4 = V + JD; 
    %scatter(V,FJ4,25,'c','*') 
    P = polyfit(V,FJ4,1);
    FJD = P(1)*V+P(2);
    %hold on
plot(V,FJD,'c-.');
    %hold off
    
    FJ5 = V + JE; 
    %scatter(V,FJ5,25,'m','*') 
    P = polyfit(V,FJ5,1);
    FJE = P(1)*V+P(2);
    %hold on
plot(V,FJE,'m-.');
    %hold off    

    FJ6 = V + JF; 
    %scatter(V,FJ6,25,'y','*') 
    P = polyfit(V,FJ6,1);
    FJF = P(1)*V+P(2);
    %hold on
plot(V,FJF,'y-.');
    %hold off    
    
    FJ7 = V + JG; 
    %scatter(V,FJ7,25,'k','*') 
    P = polyfit(V,FJ7,1);
    FJG = P(1)*V+P(2);
    %hold on
plot(V,FJG,'k-.');
    %hold off
    
hold off
title('Fitted Stacked Plots')
xlabel('Voltage')
ylabel('Current Density')
%}
%% Make Other bigger Plots
figure('Name', 'Averaged Compiled AbsJ Stacked Plots')
hold on
grid on 
box on

plot(V,AJA,'b-','DisplayName', 'YSR25A');
   
plot(V,AJB,'g-','DisplayName', 'YSR25B');
 
plot(V,AJC,'r-','DisplayName', 'YSR25C');

plot(V,AJD,'c-','DisplayName', 'YSR25D');
 
plot(V,AJE,'m-','DisplayName', 'YSR25E');
 
plot(V,AJF,'b--','DisplayName', 'YSR25F');

plot(V,AJG,'k-','DisplayName', 'YSR25G');


    
hold off
title('AbsJ Raw Stacked Plots')
xlabel('Voltage')
ylabel('|Abs| Current Density')
legend

figure('Name', 'Linear Fitted Compiled AbsJ Stacked Plots')

hold on
    AFJ1 = V + AJA; 
    %scatter(V,FJ1,25,'b','*') 
    P = polyfit(V,AFJ1,1);
    AFJA = P(1)*V+P(2);
    %hold on
 plot(V,AFJA,'b-', 'DisplayName', 'YSR25A');
    %hold off
    
    AFJ2 = V + AJB; 
    %scatter(V,FJ2,25,'g','*') 
    P = polyfit(V,AFJ2,1);
    AFJB = P(1)*V+P(2);
    %hold on
plot(V,AFJB,'g-','DisplayName', 'YSR25B');
    %hold off

    AFJ3 = V + AJC; 
    %scatter(V,FJ3,25,'r','*') 
    P = polyfit(V,AFJ3,1);
    AFJC = P(1)*V+P(2);
    %hold on
plot(V,AFJC,'r-','DisplayName', 'YSR25C');
    %hold off
    
    AFJ4 = V + AJD; 
    %scatter(V,FJ4,25,'c','*') 
    P = polyfit(V,AFJ4,1);
    AFJD = P(1)*V+P(2);
    %hold on
plot(V,AFJD,'c-','DisplayName', 'YSR25D');
    %hold off
    
    AFJ5 = V + AJE; 
    %scatter(V,FJ5,25,'m','*') 
    P = polyfit(V,AFJ5,1);
    AFJE = P(1)*V+P(2);
    %hold on
plot(V,AFJE,'m-','DisplayName', 'YSR25E');
    %hold off    

    AFJ6 = V + AJF; 
    %scatter(V,FJ6,25,'y','*') 
    P = polyfit(V,AFJ6,1);
    AFJF = P(1)*V+P(2);
    %hold on
plot(V,AFJF,'b--','DisplayName', 'YSR25F');
    %hold off    
    
    AFJ7 = V + AJG; 
    %scatter(V,FJ7,25,'k','*') 
    P = polyfit(V,AFJ7,1);
    AFJG = P(1)*V+P(2);
    %hold on
plot(V,AFJG,'k-','DisplayName', 'YSR25G');
    %hold off
    
hold off
title('AbsJ Linear Fitted Stacked Plots')
xlabel('Voltage')
ylabel('|Abs| Current Density')
legend
AbsJ = 'Plotted Average ABs Current Densities';
end

