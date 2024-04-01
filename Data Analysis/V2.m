clc
clear all 
close all
format long

    FileExtr = 'Data Group 4\Reliability Data.csv'

    Spill1 = importdata(FileExtr);
    Spill=Spill1.data;
    
    Disp=Spill(:,21);
    time=Spill(:,16);
    Voltage=Spill(:,12);
    Current=Spill(:,13);
    Rx=Spill(:,15);
    Jx=Spill(:,16);


    Set=Spill(:,2);
    Trial=Spill(:,3);
    N=Spill(:,4);
    %R_P=Spill(:.0);
%}

%% 
%Sort By ... j levels of any category%

j = [1;2;3;4;5;6;7;8;9;10;11];

i=1;
k=4300/10;
k;
V=zeros(k,1);
I=zeros(k,1);
R=zeros(k,1);
t=zeros(k,1);
disp=zeros(k,1);
J=zeros(k,1);
set=zeros(k,1);
trial=zeros(k,1);
n=zeros(k,1);


while  i < (1+k)
    V(i) = Voltage(i,1);
    I(i) = Current(i,1);
    R(i) = Rx(i,1);
    t(i) = time(i,1);
    disp(i) = Disp(i,1);
    J(i) = Jx(i,1);
    set(i) = Set(i,1);
    trial(i) = Trial(i,1);
    n(i) = N(i,1);
    i=i+1;

end
ii=i;



%%
%i=1;
%i=2151;

for j = 1:6
 switch j
     case 1 %First Experiment
         k=4300/10;
kk=k+i;
V=zeros(k,1);
I=zeros(k,1);
R=zeros(k,1);
t=zeros(k,1);
disp=zeros(k,1);
J=zeros(k,1);
set=zeros(k,1);
trial=zeros(k,1);
n=zeros(k,1);
xx=zeros(k,1);
yy=zeros(k,1);

while  i < kk
    V(i) = Voltage(i,1);
    I(i) = Current(i,1);
    R(i) = Rx(i,1);
    t(i) = time(i,1);
    disp(i) = Disp(i,1);
    J(i) = Jx(i,1);
    set(i) = Set(i,1);
    trial(i) = Trial(i,1);
    n(i) = N(i,1);
    i=i+1;

end

xx=t;
yy=R;
dd=disp;
[ZZ] = fft_Fun(xx,yy,dd)



     case 2 % Second Experiment
i=i;
kk=i+k;
V=zeros(k,1);
I=zeros(k,1);
R=zeros(k,1);
t=zeros(k,1);
disp=zeros(k,1);
J=zeros(k,1);
set=zeros(k,1);
trial=zeros(k,1);
n=zeros(k,1);
xx=zeros(k,1);
yy=zeros(k,1);

while  i < kk
    V(i) = Voltage(i,1);
    I(i) = Current(i,1);
    R(i) = Rx(i,1);
    t(i) = time(i,1);
    disp(i) = Disp(i,1);
    J(i) = Jx(i,1);
    set(i) = Set(i,1);
    trial(i) = Trial(i,1);
    n(i) = N(i,1);
    i=i+1;

end

xx=t;
yy=R; 
[ZZ] = fft_Fun(xx,yy,dd)

     case 3 % Second Experiment
i=i;
kk=i+k;
V=zeros(k,1);
I=zeros(k,1);
R=zeros(k,1);
t=zeros(k,1);
disp=zeros(k,1);
J=zeros(k,1);
set=zeros(k,1);
trial=zeros(k,1);
n=zeros(k,1);
xx=zeros(k,1);
yy=zeros(k,1);

while  i < kk
    V(i) = Voltage(i,1);
    I(i) = Current(i,1);
    R(i) = Rx(i,1);
    t(i) = time(i,1);
    disp(i) = Disp(i,1);
    J(i) = Jx(i,1);
    set(i) = Set(i,1);
    trial(i) = Trial(i,1);
    n(i) = N(i,1);
    i=i+1;

end

xx=t;
yy=R; 
dd=disp;
[ZZ] = fft_Fun(xx,yy,dd)


     case 4 % Second Experiment
i=i;
kk=i+k;
V=zeros(k,1);
I=zeros(k,1);
R=zeros(k,1);
t=zeros(k,1);
disp=zeros(k,1);
J=zeros(k,1);
set=zeros(k,1);
trial=zeros(k,1);
n=zeros(k,1);
xx=zeros(k,1);
yy=zeros(k,1);

while  i < kk
    V(i) = Voltage(i,1);
    I(i) = Current(i,1);
    R(i) = Rx(i,1);
    t(i) = time(i,1);
    disp(i) = Disp(i,1);
    J(i) = Jx(i,1);
    set(i) = Set(i,1);
    trial(i) = Trial(i,1);
    n(i) = N(i,1);
    i=i+1;

end

xx=t;
yy=R; 
dd=disp;
[ZZ] = fft_Fun(xx,yy,dd)


     case 5 % Second Experiment
i=i;
kk=i+k;
V=zeros(k,1);
I=zeros(k,1);
R=zeros(k,1);
t=zeros(k,1);
disp=zeros(k,1);
J=zeros(k,1);
set=zeros(k,1);
trial=zeros(k,1);
n=zeros(k,1);
xx=zeros(k,1);
yy=zeros(k,1);

while  i < kk
    V(i) = Voltage(i,1);
    I(i) = Current(i,1);
    R(i) = Rx(i,1);
    t(i) = time(i,1);
    disp(i) = Disp(i,1);
    J(i) = Jx(i,1);
    set(i) = Set(i,1);
    trial(i) = Trial(i,1);
    n(i) = N(i,1);
    i=i+1;

end

xx=t;
yy=R; 
dd=disp;
[ZZ] = fft_Fun(xx,yy,dd)

     otherwise
         disp('Analysis complete')
         ZZ=0;

 end
end



%%
%{

     figure(1),subplot(2,1,2),plot(time,Voltage,'-b'),hold on

% VOLTAGE DATA ANALYZED USING MATLAB FFT ALGORITHM BELOW...
    freq=1.d0/(time(2)-time(1));
%     min1=length(disp);
    min1=length(Voltage);
    mn=2^(floor(log(min1)/log(2.d0))-1);
    time_in=time(1+min1-mn:min1);
%     y_in=disp(1+min1-mn:min1);
    y_in=Voltage(1+min1-mn:min1);
    y=abs(fft(y_in));
    f=(freq/2.d0)*linspace(0,1,mn/2+1);
     figure(2),subplot(2,1,1),plot(time_in,y_in,'-b'),hold on
     figure(2),subplot(2,1,2),plot(f,y(1:mn/2+1),'-r'),hold on
%}