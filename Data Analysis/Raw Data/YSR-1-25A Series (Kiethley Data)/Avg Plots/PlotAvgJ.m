function [J] = PlotAvgJ(FileExtr)
%% Data Extraction Section

Spill1 = importdata(FileExtr);
Spill=Spill1.data;
    
V = Spill(1:end, 1);

%25 A
 JA = Spill(1:21,3);
 
%25 B
 JB = Spill(1:21,6);
 
%25 C
 JC = Spill(1:21,9);
 
%25 D
 JD = Spill(1:21,12);
 
%25 E
 JE = Spill(1:21,15);
 
%25 F
 JF = Spill(1:21,18);
 
%25 G
 JG = Spill(1:21,21);




%% Making the Plots
figure('Name', 'Compiled Current Density (J) Averages')
subplot(4,2,1);
plot(V,JA);% 
title('YSR25A J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,2);
plot(V,JB);% 
title('YSR25B J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,3);
plot(V,JC);% 
title('YSR25C J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,4);
plot(V,JD);% 
title('YSR25D J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,5);
plot(V,JE);% 
title('YSR25E J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,6);
plot(V,JF);% 
title('YSR25F J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,7);
plot(V,JG);% 
title('YSR25G J-V')
xlabel('Voltage')
ylabel('Current Density')

subplot(4,2,8);
hold on

plot(V,JA,'b-.');
   
plot(V,JB,'g-.');
 
plot(V,JC,'r-.');

plot(V,JD,'c-.');
 
plot(V,JE,'m-.');
 
plot(V,JF,'y-.');

plot(V,JG,'k-.');

    
hold off
title('J Raw Stacked Plots')
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
figure('Name', 'Averaged Compiled Current Density (J) Stacked Plots')
hold on

plot(V,JA,'b-','DisplayName', 'YSR25A');
   
plot(V,JB,'g-','DisplayName', 'YSR25B');
 
plot(V,JC,'r-','DisplayName', 'YSR25C');

plot(V,JD,'c-','DisplayName', 'YSR25D');
 
plot(V,JE,'m-','DisplayName', 'YSR25E');
 
plot(V,JF,'b--','DisplayName', 'YSR25F');

plot(V,JG,'k-','DisplayName', 'YSR25G');

    
hold off
title('J Raw Stacked Plots')
xlabel('Voltage')
ylabel('Current Density')
legend


figure('Name', 'Linear Fitted Compiled Current Density (J) Stacked Plots')

hold on
    FJ1 = V + JA; 
    %scatter(V,FJ1,25,'b','*') 
    P = polyfit(V,FJ1,1);
    FJA = P(1)*V+P(2);
    %hold on
 plot(V,FJA,'b-', 'DisplayName', 'YSR25A');
    %hold off
    
    FJ2 = V + JB; 
    %scatter(V,FJ2,25,'g','*') 
    P = polyfit(V,FJ2,1);
    FJB = P(1)*V+P(2);
    %hold on
plot(V,FJB,'g-','DisplayName', 'YSR25B');
    %hold off

    FJ3 = V + JC; 
    %scatter(V,FJ3,25,'r','*') 
    P = polyfit(V,FJ3,1);
    FJC = P(1)*V+P(2);
    %hold on
plot(V,FJC,'r-','DisplayName', 'YSR25C');
    %hold off
    
    FJ4 = V + JD; 
    %scatter(V,FJ4,25,'c','*') 
    P = polyfit(V,FJ4,1);
    FJD = P(1)*V+P(2);
    %hold on
plot(V,FJD,'c-','DisplayName', 'YSR25D');
    %hold off
    
    FJ5 = V + JE; 
    %scatter(V,FJ5,25,'m','*') 
    P = polyfit(V,FJ5,1);
    FJE = P(1)*V+P(2);
    %hold on
plot(V,FJE,'m-','DisplayName', 'YSR25E');
    %hold off    

    FJ6 = V + JF; 
    %scatter(V,FJ6,25,'y','*') 
    P = polyfit(V,FJ6,1);
    FJF = P(1)*V+P(2);
    %hold on
plot(V,FJF,'b--','DisplayName', 'YSR25F');
    %hold off    
    
    FJ7 = V + JG; 
    %scatter(V,FJ7,25,'k','*') 
    P = polyfit(V,FJ7,1);
    FJG = P(1)*V+P(2);
    %hold on
plot(V,FJG,'k-','DisplayName', 'YSR25G');
    %hold off
    
hold off
title('J Linear Fitted Stacked Plots')
xlabel('Voltage')
ylabel('Current Density')
legend
J = 'Plotted Average Current Densities';
end

