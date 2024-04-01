     

function [ZZ] = fft_Fun(xx,yy,dd)

%j=j;
XX=xx;
YY=yy;
DD=dd;
time=xx;
Voltage=yy;

i= 0.381000000000000;
j= 0;

 figure('Name', 'FFT Analysis'),subplot(2,2,1),plot(time,Voltage,'-b'),hold on
 title('Raw XX vs. YY')
xlabel('XX')
ylabel('FoM')

% VOLTAGE DATA ANALYZED USING MATLAB FFT ALGORITHM BELOW...
    freq=1.d0/(i-j)
%     min1=length(disp)
    min1=length(Voltage);
    mn=2^(floor(log(min1)/log(2.d0))-1);
    time_in=time(1+min1-mn:min1);
%     y_in=disp(1+min1-mn:min1);
    y_in=Voltage(1+min1-mn:min1);
    y=abs(fft(y_in));
    f=(freq/2.d0)*linspace(0,1,mn/2+1);
     subplot(2,2,2),plot(time_in,y_in,'-b'),hold on
     title('Sampled XX vs. YY')
xlabel('XX')
ylabel('FoM')
     subplot(2,2,[3,4]),plot(f,y(1:mn/2+1),'-r'),hold on
     title('Simulated XX vs. YY')
xlabel('XX')
ylabel('FoM')
%}

%{
% VOLTAGE DATA ANALYZED USING MATLAB FFT ALGORITHM BELOW...
    freq=1.d0/(XX(2)-XX(1));
%     min1=length(disp);
    min1=length(YY);
    mn=2^(floor(log(min1)/log(2.d0))-1);
    time_in=XX(1+min1-mn:min1);
%     y_in=disp(1+min1-mn:min1);
    y_in=YY(1+min1-mn:min1);
    y=abs(fft(y_in));
    f=(freq/2.d0)*linspace(0,1,mn/2+1);

figure('Name', 'FFT Analysis')
subplot(2,2,1),plot(XX,YY,'-b'),hold on
title('Raw XX vs. YY')
xlabel('XX')
ylabel('FoM')
%xlim([0 7400])


subplot(2,2,2),plot(time_in,y_in,'-b'),hold on
title('Sampled XX vs. YY')
xlabel('XX')
ylabel('FoM')
%xlim([0 7400])


%{
hold on;
subplot(2,2,[3,4]);
%Plot Simulated
plot(f,y(1:mn/2+1),'-r')
title('Simulated XX vs. YY')
xlabel('XX')
ylabel('FoM')
%xlim([0 7400])
%}
%}

     ZZ=1
end



   