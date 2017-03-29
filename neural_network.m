clc; clear all;
load('Input_data')
load('Output_data')
Input_data;
Output_data;
%scaling of data
mu = 0.1; 
scmin = -.5;
scmax = .5;
[n ni] = size(Input_data);
[n no] = size(Output_data);
smin = min([Input_data Output_data]);
smax = max([Input_data Output_data]);
scalefac = (scmax- scmin)./(smax- smin);
for i = 1:ni
    Iput(:,i) = scmin +(Input_data(:,i)- smin(i))*scalefac(i);
end
for i = 1:no
    Oput(:,i) = scmin + (Output_data(:,i) - smin(i+ni))*scalefac(i+ni);
end
X = Iput;
Z = Oput;
w1 = scmin+(scmax-scmin).*rand(2,2);
w2 = scmin+(scmax-scmin).*rand(2,2);
for kk = 1:200
%1
u0 = X;
y1 = u0*w1;
u1 = tanh(y1);
y2 = u1*w2;
u2 = tanh(y2);
%2
diffy2 = sech(y2).^2;
diffy1 = sech(y1).^2;
%3
e2b = diffy2.*(Z-u2);
e1b = diffy1.*e2b*w2';
%4
w2 = w2 + mu.*(u1'*e2b);
w1 = w1 + mu.*(u0'*e1b);
end
[nx ny] = size(Z);
sigma2 = 1/(nx*ny)*sum(sum((Z-u2)'*(Z-u2)));
u2
%descaling of data
for i = 1:ni
    DSIput(:,i) = smin(i) + (Iput(:,i) - scmin)/scalefac(i);
end
for i = 1:no
    DSOput(:,i) = smin(i+ni) + (Oput(:,i) - scmin)/scalefac(i+ni);
    Caloput(:,i) = smin(i+ni) + (u2(:,i)-scmin)/scalefac(i+ni);
end

plot(DSOput(:,1))
hold on
plot(Caloput(:,1),'r')

figure
plot(DSOput(:,2))
hold on
plot(Caloput(:,2),'r')
w1;
w2;
MSE = sigma2