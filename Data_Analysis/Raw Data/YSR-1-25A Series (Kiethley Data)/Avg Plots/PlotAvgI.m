function [I] = PlotAvgI(FileExtr)
%% Data Extraction Section

Spill1 = importdata(FileExtr);
Spill=Spill1.data;
    
V = Spill(1:end, 1);

%25 A
 IA = Spill(1:21,3);
 
%25 B
 IB = Spill(1:21,6);
 
%25 C
 IC = Spill(1:21,9);
 
%25 D
 ID = Spill(1:21,12);
 
%25 E
 IE = Spill(1:21,15);
 
%25 F
 IF = Spill(1:21,18);
 
%25 G
 IG = Spill(1:21,21);




%% Making the Plots
figure('Name', 'Compiled Current (I) Averages')
subplot(4,2,1);
plot(V,IA);% 
title('YSR25A I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,2);
plot(V,IB);% 
title('YSR25B I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,3);
plot(V,IC);% 
title('YSR25C I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,4);
plot(V,ID);% 
title('YSR25D I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,5);
plot(V,IE);% 
title('YSR25E I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,6);
plot(V,IF);% 
title('YSR25F I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,7);
plot(V,IG);% 
title('YSR25G I-V')
xlabel('Voltage')
ylabel('Current')

subplot(4,2,8);
hold on

plot(V,IA,'b-.');
   
plot(V,IB,'g-.');
 
plot(V,IC,'r-.');

plot(V,ID,'c-.');
 
plot(V,IE,'m-.');
 
plot(V,IF,'y-.');

plot(V,IG,'k-.');

    
hold off
title('I Raw Stacked Plots')
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
figure('Name', 'Averaged Compiled Current (I) Stacked Plots')
hold on

plot(V,IA,'b-','DisplayName', 'YSR25A');
   
plot(V,IB,'g-','DisplayName', 'YSR25B');
 
plot(V,IC,'r-','DisplayName', 'YSR25C');

plot(V,ID,'c-','DisplayName', 'YSR25D');
 
plot(V,IE,'m-','DisplayName', 'YSR25E');
 
plot(V,IF,'b--','DisplayName', 'YSR25F');

plot(V,IG,'k-','DisplayName', 'YSR25G');

    
hold off
title('I Raw Stacked Plots')
xlabel('Voltage')
ylabel('Current')
legend

figure('Name', 'Linear Fitted Compiled Current (I) Stacked Plots')

hold on
    FI1 = V + IA; 
    %scatter(V,FJ1,25,'b','*') 
    P = polyfit(V,FI1,1);
    FIA = P(1)*V+P(2);
    %hold on
 plot(V,FIA,'b-', 'DisplayName', 'YSR25A');
    %hold off
    
    FI2 = V + IB; 
    %scatter(V,FJ2,25,'g','*') 
    P = polyfit(V,FI2,1);
    FIB = P(1)*V+P(2);
    %hold on
plot(V,FIB,'g-','DisplayName', 'YSR25B');
    %hold off

    FI3 = V + IC; 
    %scatter(V,FJ3,25,'r','*') 
    P = polyfit(V,FI3,1);
    FIC = P(1)*V+P(2);
    %hold on
plot(V,FIC,'r-','DisplayName', 'YSR25C');
    %hold off
    
    FI4 = V + ID; 
    %scatter(V,FJ4,25,'c','*') 
    P = polyfit(V,FI4,1);
    FID = P(1)*V+P(2);
    %hold on
plot(V,FID,'c-','DisplayName', 'YSR25D');
    %hold off
    
    FI5 = V + IE; 
    %scatter(V,FJ5,25,'m','*') 
    P = polyfit(V,FI5,1);
    FIE = P(1)*V+P(2);
    %hold on
plot(V,FIE,'m-','DisplayName', 'YSR25E');
    %hold off    

    FI6 = V + IF; 
    %scatter(V,FJ6,25,'y','*') 
    P = polyfit(V,FI6,1);
    FIF = P(1)*V+P(2);
    %hold on
plot(V,FIF,'b--','DisplayName', 'YSR25F');
    %hold off    
    
    FI7 = V + IG; 
    %scatter(V,FJ7,25,'k','*') 
    P = polyfit(V,FI7,1);
    FIG = P(1)*V+P(2);
    %hold on
plot(V,FIG,'k-','DisplayName', 'YSR25G');
    %hold off
    
hold off
title('I Linear Fitted Stacked Plots')
xlabel('Voltage')
ylabel('Current Density')
legend
I = 'Plotted Average Currents';
end

