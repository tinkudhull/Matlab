clear all;
clc
%% load data
load('Input_data');
load('Output_data');
%% Scaling
Scmin=-0.5;
Scmax=0.5;
[n nI]=size(Input_data);
[n nO]=size(Output_data);
Smin=min([Input_data Output_data])
Smax=max([Input_data Output_data])
ScaleFac=(Scmax-Scmin)./(Smax-Smin);
for i=1:nI
    Iput(:,i)=Scmin+(Input_data(:,i)-Smin(i))*ScaleFac(i);
end
for i=1:nO
    Oput(:,i)=Scmin+(Output_data(:,i)-Smin(i))*ScaleFac(i+nI);
end
%% Initialization
mu=0.001;
weighthi=0.0765*rand([10 2]);
weightoh=0.0545*rand([2 10]);
biash=0.065*ones([10 n]);
biaso=0.023*ones([2 n]);
%% Forward propagation
Iput=Iput';
Oput=Oput';
for iter=1:20000
    z1=weighthi*Iput;
    a1=tanh(z1);
    z2=weightoh*a1;
    a2=tanh(z2);
    error=(Oput-z2);
    weighthi=weighthi+mu*(((error.*(1-a2.^2))'*weightoh)'.*(1-a1.^2))*Iput';
    weightoh=weightoh+mu*error.*(1-a2.^2)*a1';
end
scatter((1:n),Oput(1,1:n));
hold on;
plot((1:n),z2(1,1:n));